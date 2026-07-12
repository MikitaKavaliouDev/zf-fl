import 'dart:convert';
import 'dart:developer' as developer;

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/theme/app_theme.dart';

/// Local-only purchase record stored in SharedPrefs.
///
/// Written by [MyPackagesScreen] (or any purchase flow) under the
/// `'purchased_packages'` key when a Stripe checkout returns success.
class PurchaseRecord {
  final String id;
  final String packageId;
  final String name;
  final String price;
  final int numberOfSessions;
  final int sessionsRemaining;
  final String purchaseDate; // ISO-8601 date string

  PurchaseRecord({
    required this.id,
    required this.packageId,
    required this.name,
    required this.price,
    required this.numberOfSessions,
    required this.sessionsRemaining,
    required this.purchaseDate,
  });

  factory PurchaseRecord.fromJson(Map<String, dynamic> json) =>
      PurchaseRecord(
        id: json['id'] as String? ?? '',
        packageId: json['packageId'] as String? ?? '',
        name: json['name'] as String? ?? '',
        price: json['price'] as String? ?? '',
        numberOfSessions: json['numberOfSessions'] as int? ?? 0,
        sessionsRemaining: json['sessionsRemaining'] as int? ?? 0,
        purchaseDate: json['purchaseDate'] as String? ?? '',
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'packageId': packageId,
        'name': name,
        'price': price,
        'numberOfSessions': numberOfSessions,
        'sessionsRemaining': sessionsRemaining,
        'purchaseDate': purchaseDate,
      };
}

class PurchaseHistoryScreen extends StatefulWidget {
  const PurchaseHistoryScreen({super.key});

  @override
  State<PurchaseHistoryScreen> createState() => _PurchaseHistoryScreenState();
}

class _PurchaseHistoryScreenState extends State<PurchaseHistoryScreen>
    with WidgetsBindingObserver {
  bool _isLoading = true;
  List<PurchaseRecord> _records = [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _loadRecords();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      _loadRecords();
    }
  }

  Future<void> _loadRecords() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final raw = prefs.getString('purchased_packages');
      if (raw == null || raw.isEmpty) {
        setState(() {
          _records = [];
          _isLoading = false;
        });
        return;
      }
      final List<dynamic> decoded = jsonDecode(raw) as List<dynamic>;
      final records = decoded
          .map((e) =>
              PurchaseRecord.fromJson(e as Map<String, dynamic>))
          .toList();
      // Sort newest first by purchaseDate
      records.sort((a, b) => b.purchaseDate.compareTo(a.purchaseDate));
      setState(() {
        _records = records;
        _isLoading = false;
      });
    } catch (e) {
      developer.log('Failed to load purchase history: $e',
          name: 'purchase_history');
      setState(() {
        _records = [];
        _isLoading = false;
      });
    }
  }

  Future<void> _deleteRecord(PurchaseRecord record) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Remove Record'),
        content: Text(
            'Remove "${record.name}" from purchase history?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(ctx, true),
            child: const Text('Remove'),
          ),
        ],
      ),
    );
    if (confirmed != true) return;

    try {
      final prefs = await SharedPreferences.getInstance();
      final raw = prefs.getString('purchased_packages');
      if (raw == null || raw.isEmpty) return;
      final List<dynamic> decoded = jsonDecode(raw) as List<dynamic>;
      decoded.removeWhere(
          (e) => (e as Map<String, dynamic>)['id'] == record.id);
      await prefs.setString(
          'purchased_packages', jsonEncode(decoded));
      _loadRecords();
    } catch (e) {
      developer.log('Failed to delete purchase record: $e',
          name: 'purchase_history');
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Failed to remove record.')),
        );
      }
    }
  }

  Future<void> _clearHistory() async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Clear History'),
        content: const Text(
            'Remove all purchase records from history?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(ctx, true),
            child: const Text('Clear'),
          ),
        ],
      ),
    );
    if (confirmed != true) return;

    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove('purchased_packages');
      _loadRecords();
      developer.log('Purchase history cleared', name: 'purchase_history');
    } catch (e) {
      developer.log('Failed to clear purchase history: $e',
          name: 'purchase_history');
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text('Failed to clear purchase history.')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: const ValueKey('purchaseHistoryScreen'),
      appBar: AppBar(
        title: const Text('Purchase History'),
        actions: [
          if (_records.isNotEmpty)
            PopupMenuButton<String>(
              onSelected: (value) {
                if (value == 'clear') _clearHistory();
              },
              itemBuilder: (ctx) => [
                const PopupMenuItem(
                  value: 'clear',
                  child: Row(
                    children: [
                      Icon(Icons.delete_outline_rounded,
                          size: 18, color: AppColors.mutedText),
                      SizedBox(width: 8),
                      Text('Clear History'),
                    ],
                  ),
                ),
              ],
            ),
        ],
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    if (_isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (_records.isEmpty) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 72,
                height: 72,
                decoration: BoxDecoration(
                  color: AppColors.primary.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Icon(
                  Icons.receipt_long_rounded,
                  size: 36,
                  color: AppColors.primary,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Transaction History',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: AppColors.foreground,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Your payment receipts and purchase history\nwill appear here.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: AppColors.mutedText,
                  height: 1.4,
                ),
              ),
            ],
          ),
        ),
      );
    }

    return RefreshIndicator(
      onRefresh: _loadRecords,
      child: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: _records.length,
        itemBuilder: (context, index) {
          final record = _records[index];
          return _PurchaseCard(
            record: record,
            onDelete: () => _deleteRecord(record),
          );
        },
      ),
    );
  }
}

class _PurchaseCard extends StatelessWidget {
  final PurchaseRecord record;
  final VoidCallback onDelete;

  const _PurchaseCard({
    required this.record,
    required this.onDelete,
  });

  String _formatDate(String isoDate) {
    try {
      final dt = DateTime.parse(isoDate);
      return DateFormat.yMMMMd().format(dt);
    } catch (_) {
      return isoDate;
    }
  }

  String _sessionsLabel() {
    if (record.numberOfSessions <= 0) return 'All sessions';
    return '${record.numberOfSessions} sessions';
  }

  String _remainingLabel() {
    if (record.numberOfSessions <= 0) return '';
    return '${record.sessionsRemaining} remaining';
  }

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(record.id),
      direction: DismissDirection.endToStart,
      confirmDismiss: (_) async {
        final confirmed = await showDialog<bool>(
          context: context,
          builder: (ctx) => AlertDialog(
            title: const Text('Remove Record'),
            content: Text(
                'Remove "${record.name}" from purchase history?'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(ctx, false),
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () => Navigator.pop(ctx, true),
                child: const Text('Remove'),
              ),
            ],
          ),
        );
        return confirmed ?? false;
      },
      onDismissed: (_) => onDelete(),
      background: Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 24),
        decoration: BoxDecoration(
          color: Colors.red.shade400,
          borderRadius: BorderRadius.circular(16),
        ),
        child: const Icon(Icons.delete_outline_rounded,
            color: Colors.white, size: 24),
      ),
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.card,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.borderMuted),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Icon
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: AppColors.primary.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(
                Icons.receipt_long_rounded,
                size: 20,
                color: AppColors.primary,
              ),
            ),
            const SizedBox(width: 12),
            // Details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    record.name,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: AppColors.foreground,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    _formatDate(record.purchaseDate),
                    style: const TextStyle(
                      fontSize: 12,
                      color: AppColors.mutedText,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Text(
                        '\$${record.price}',
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: AppColors.foreground,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 2),
                        decoration: BoxDecoration(
                          color: AppColors.primary.withValues(alpha: 0.08),
                          borderRadius: BorderRadius.circular(99),
                        ),
                        child: Text(
                          _sessionsLabel(),
                          style: const TextStyle(
                            fontSize: 11,
                            color: AppColors.primary,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                  if (record.sessionsRemaining > 0 &&
                      record.numberOfSessions > 0) ...[
                    const SizedBox(height: 4),
                    Text(
                      _remainingLabel(),
                      style: const TextStyle(
                        fontSize: 12,
                        color: Color(0xFF22C55E),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
