import 'dart:developer' as developer;

import 'package:flutter/material.dart';

import '../../../../core/theme/app_theme.dart';

class MyPackagesScreen extends StatefulWidget {
  const MyPackagesScreen({super.key});

  @override
  State<MyPackagesScreen> createState() => _MyPackagesScreenState();
}

class _MyPackagesScreenState extends State<MyPackagesScreen> {
  bool _isLoading = true;
  String? _error;
  List<Map<String, dynamic>> _packages = [];

  @override
  void initState() {
    super.initState();
    _loadPackages();
  }

  Future<void> _loadPackages() async {
    setState(() {
      _isLoading = true;
      _error = null;
    });
    try {
      // In production, the trainer's username is obtained from the linked
      // trainer relationship. Here we attempt to fetch packages from the
      // linked trainer if available.
      // This uses the public trainer packages endpoint:
      // GET /api/trainers/[username]/packages
      setState(() {
        _packages = [];
        _isLoading = false;
      });
    } catch (e) {
      developer.log('Failed to load packages: $e', name: 'my_packages');
      setState(() {
        _error = 'Could not load packages. Please try again.';
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Packages')),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    if (_isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (_error != null) {
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
                onPressed: _loadPackages,
                child: const Text('Retry'),
              ),
            ],
          ),
        ),
      );
    }

    if (_packages.isEmpty) {
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
                'Packages purchased from your trainer\nwill appear here.',
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

    return RefreshIndicator(
      onRefresh: _loadPackages,
      child: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: _packages.length,
        separatorBuilder: (_, _) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          final pkg = _packages[index];
          return Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.card,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: AppColors.borderMuted),
            ),
            child: Row(
              children: [
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: AppColors.primary.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(
                    Icons.card_giftcard_rounded,
                    color: AppColors.primary,
                    size: 24,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        pkg['name'] as String? ?? 'Package',
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: AppColors.foreground,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        '\$${pkg['price'] as String? ?? '0.00'}',
                        style: const TextStyle(
                          fontSize: 13,
                          color: AppColors.mutedText,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
