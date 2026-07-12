import 'dart:convert';
import 'dart:developer' as developer;

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/di/injection.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../home/data/home_repository.dart';
import '../../../trainers/data/models/trainer_package_dto.dart';
import '../../../trainers/data/trainer_api_service.dart';

class MyPackagesScreen extends StatefulWidget {
  const MyPackagesScreen({super.key});

  @override
  State<MyPackagesScreen> createState() => _MyPackagesScreenState();
}

class _MyPackagesScreenState extends State<MyPackagesScreen> {
  final TrainerApiService _trainerApi = getIt<TrainerApiService>();
  final HomeRepository _homeRepo = getIt<HomeRepository>();

  bool _isLoading = true;
  String? _error;
  bool _hasTrainer = false;
  String? _trainerUsername;
  List<TrainerPackageDto> _availablePackages = [];
  List<Map<String, dynamic>> _purchasedPackages = [];
  bool _isPurchasing = false;

  static const String _purchasedKey = 'purchased_packages';
  static const String _pendingKey = 'pending_purchase';

  @override
  void initState() {
    super.initState();
    _initialize();
  }

  Future<void> _initialize() async {
    await _checkPendingPurchase();
    await _loadData();
  }

  /// Check if there's a pending purchase from Stripe redirect.
  /// If found, move it to purchased packages.
  Future<void> _checkPendingPurchase() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final pendingJson = prefs.getString(_pendingKey);
      if (pendingJson == null) return;

      final pending = jsonDecode(pendingJson) as Map<String, dynamic>;
      await _addPurchasedPackage(
        packageId: pending['packageId'] as String,
        name: pending['name'] as String,
        price: pending['price'] as String,
        numberOfSessions: pending['numberOfSessions'] as int,
      );
      await prefs.remove(_pendingKey);
      developer.log('Pending purchase confirmed after Stripe return',
          name: 'my_packages');
    } catch (e) {
      developer.log('Failed to process pending purchase: $e',
          name: 'my_packages');
    }
  }

  /// Main data loading: resolve trainer, fetch API packages, load purchases.
  Future<void> _loadData() async {
    setState(() {
      _isLoading = true;
      _error = null;
    });

    try {
      await _resolveTrainer();

      await _loadPurchasedPackages();

      if (_trainerUsername != null) {
        _availablePackages =
            await _trainerApi.getTrainerPackages(_trainerUsername!);
      }

      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    } catch (e) {
      developer.log('Failed to load packages: $e', name: 'my_packages');
      if (mounted) {
        setState(() {
          _error = 'Could not load packages. Please try again.';
          _isLoading = false;
        });
      }
    }
  }

  /// Resolve trainer username from SharedPrefs cache or dashboard API.
  Future<void> _resolveTrainer() async {
    final prefs = await SharedPreferences.getInstance();
    final cachedUsername = prefs.getString('linked_trainer_username');
    if (cachedUsername != null && cachedUsername.isNotEmpty) {
      _trainerUsername = cachedUsername;
      _hasTrainer = true;
      return;
    }

    // Fallback: try dashboard cache or API
    try {
      final dashboard = await _homeRepo.getDashboard();
      final trainer = dashboard.clientData.trainer;
      if (trainer != null) {
        _trainerUsername = trainer.username;
        _hasTrainer = true;
        await prefs.setString('linked_trainer_username', trainer.username);
      }
    } catch (e) {
      developer.log('Could not resolve trainer from dashboard: $e',
          name: 'my_packages');
    }
  }

  /// Load purchased packages from SharedPrefs.
  Future<void> _loadPurchasedPackages() async {
    final prefs = await SharedPreferences.getInstance();
    final json = prefs.getString(_purchasedKey);
    if (json == null) {
      _purchasedPackages = [];
      return;
    }
    final list = jsonDecode(json) as List<dynamic>;
    _purchasedPackages = list.cast<Map<String, dynamic>>();
  }

  /// Persist a purchased package to local storage.
  Future<void> _addPurchasedPackage({
    required String packageId,
    required String name,
    required String price,
    required int numberOfSessions,
  }) async {
    final purchase = <String, dynamic>{
      'id': DateTime.now().millisecondsSinceEpoch.toString(),
      'packageId': packageId,
      'name': name,
      'price': price,
      'numberOfSessions': numberOfSessions,
      'sessionsRemaining': numberOfSessions,
      'purchaseDate': DateTime.now().toIso8601String(),
    };

    final prefs = await SharedPreferences.getInstance();
    _purchasedPackages.add(purchase);
    await prefs.setString(_purchasedKey, jsonEncode(_purchasedPackages));
  }

  /// Show confirmation dialog and initiate purchase flow.
  Future<void> _buyPackage(TrainerPackageDto pkg) async {
    final action = await showDialog<String>(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: AppColors.card,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        title: const Text(
          'Confirm Purchase',
          style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              pkg.name,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: AppColors.foreground,
              ),
            ),
            if (pkg.description != null && pkg.description!.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Text(
                  pkg.description!,
                  style: const TextStyle(fontSize: 14, color: AppColors.mutedText),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            const SizedBox(height: 16),
            Row(
              children: [
                Text(
                  '\$${pkg.price}',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary,
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  '•  ${pkg.numberOfSessions} sessions',
                  style: const TextStyle(fontSize: 14, color: AppColors.mutedText),
                ),
              ],
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.of(ctx).pop('simulate'),
            child: const Text('Simulate Purchase'),
          ),
          FilledButton(
            onPressed: () => Navigator.of(ctx).pop('stripe'),
            child: const Text('Buy with Stripe'),
          ),
        ],
      ),
    );

    if (action == null) return;

    if (action == 'simulate') {
      await _addPurchasedPackage(
        packageId: pkg.id,
        name: pkg.name,
        price: pkg.price,
        numberOfSessions: pkg.numberOfSessions,
      );
      if (mounted) setState(() {});
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Purchase recorded (simulated).')),
        );
      }
      return;
    }

    if (action == 'stripe') {
      await _initiateStripePurchase(pkg);
    }
  }

  /// Create Stripe checkout session and launch the URL.
  Future<void> _initiateStripePurchase(TrainerPackageDto pkg) async {
    if (_isPurchasing) return;
    setState(() => _isPurchasing = true);

    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(
        _pendingKey,
        jsonEncode({
          'packageId': pkg.id,
          'name': pkg.name,
          'price': pkg.price,
          'numberOfSessions': pkg.numberOfSessions,
        }),
      );

      final checkoutUrl = await _trainerApi.createCheckoutSession(
        type: 'PACKAGE_SALE',
        id: pkg.id,
      );

      final uri = Uri.parse(checkoutUrl);
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      } else {
        throw Exception('Could not launch checkout URL');
      }
    } catch (e) {
      developer.log('Stripe checkout failed: $e', name: 'my_packages');
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove(_pendingKey);

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Failed to initiate payment. Please try again.'),
          ),
        );
      }
    } finally {
      if (mounted) setState(() => _isPurchasing = false);
    }
  }

  // ── Builders ──

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: const ValueKey('myPackagesScreen'),
      appBar: AppBar(title: const Text('My Packages')),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    if (_isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (_error != null) {
      return _buildErrorState();
    }

    if (!_hasTrainer) {
      return _buildNoTrainerState();
    }

    final hasAvailable = _availablePackages.isNotEmpty;
    final hasPurchased = _purchasedPackages.isNotEmpty;

    if (!hasAvailable && !hasPurchased) {
      return _buildEmptyState();
    }

    return RefreshIndicator(
      onRefresh: _loadData,
      child: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          if (hasAvailable) ...[
            _buildSectionHeader('Available Packages'),
            const SizedBox(height: 8),
            ..._availablePackages.map(_buildAvailablePackageCard),
            if (hasPurchased) const SizedBox(height: 24),
          ],
          if (hasPurchased) ...[
            _buildSectionHeader('My Purchased'),
            const SizedBox(height: 8),
            ..._purchasedPackages.map(_buildPurchasedPackageCard),
          ],
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 4, bottom: 4),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: AppColors.mutedText,
        ),
      ),
    );
  }

  Widget _buildAvailablePackageCard(TrainerPackageDto pkg) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.borderMuted),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Name
          Text(
            pkg.name,
            style: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
              color: AppColors.foreground,
            ),
          ),
          // Description
          if (pkg.description != null && pkg.description!.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Text(
                pkg.description!,
                style: const TextStyle(
                  fontSize: 13,
                  color: AppColors.mutedText,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          const SizedBox(height: 12),
          // Price + Sessions + Buy button
          Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Text(
                      '\$${pkg.price}',
                      style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: AppColors.foreground,
                      ),
                    ),
                    const SizedBox(width: 6),
                    Text(
                      '•  ${pkg.numberOfSessions} sessions',
                      style: const TextStyle(
                        fontSize: 13,
                        color: AppColors.mutedText,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 36,
                child: FilledButton(
                  onPressed: _isPurchasing ? null : () => _buyPackage(pkg),
                  style: FilledButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(99),
                    ),
                  ),
                  child: _isPurchasing
                      ? const SizedBox(
                          width: 16,
                          height: 16,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: Colors.white,
                          ),
                        )
                      : const Text(
                          'Buy',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPurchasedPackageCard(Map<String, dynamic> purchase) {
    final name = purchase['name'] as String? ?? 'Package';
    final sessionsRemaining = purchase['sessionsRemaining'] as int? ?? 0;
    final purchaseDate = purchase['purchaseDate'] as String? ?? '';
    final formattedDate = purchaseDate.isNotEmpty
        ? _formatDate(purchaseDate)
        : '';

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.borderMuted),
      ),
      child: Row(
        children: [
          // Package icon
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: Colors.green.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(
              Icons.card_giftcard_rounded,
              color: Colors.green,
              size: 24,
            ),
          ),
          const SizedBox(width: 12),
          // Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: AppColors.foreground,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    // Sessions remaining badge
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.primary.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(99),
                      ),
                      child: Text(
                        '$sessionsRemaining sessions left',
                        style: const TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    // Active badge
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.green.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(99),
                      ),
                      child: const Text(
                        'Active',
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                          color: Colors.green,
                        ),
                      ),
                    ),
                  ],
                ),
                if (formattedDate.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: Text(
                      'Purchased $formattedDate',
                      style: const TextStyle(
                        fontSize: 11,
                        color: AppColors.mutedText,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _formatDate(String isoDate) {
    try {
      final dt = DateTime.parse(isoDate);
      final months = [
        'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
        'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec',
      ];
      return '${months[dt.month - 1]} ${dt.day}, ${dt.year}';
    } catch (_) {
      return isoDate;
    }
  }

  // ── States ──

  Widget _buildErrorState() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.error_outline_rounded,
              size: 48,
              color: AppColors.mutedText,
            ),
            const SizedBox(height: 16),
            Text(
              _error!,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 14,
                color: AppColors.mutedText,
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: _loadData,
              child: const Text('Retry'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNoTrainerState() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 64,
              height: 64,
              decoration: BoxDecoration(
                color: Colors.orange.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Icon(
                Icons.warning_amber_rounded,
                size: 32,
                color: Colors.orange,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'No trainer linked',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: AppColors.foreground,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Connect with a trainer to view\navailable packages.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                color: AppColors.mutedText,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 64,
              height: 64,
              decoration: BoxDecoration(
                color: AppColors.primary.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Icon(
                Icons.inventory_2_outlined,
                size: 32,
                color: AppColors.primary,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'No Packages Yet',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: AppColors.foreground,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Packages from your trainer\nwill appear here.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                color: AppColors.mutedText,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
