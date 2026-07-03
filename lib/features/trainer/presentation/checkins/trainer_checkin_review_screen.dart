import 'package:flutter/material.dart';

import 'package:dio/dio.dart';

import '../../../../core/di/injection.dart';
import '../../../../core/theme/app_theme.dart';
import '../../data/models/trainer_check_in_list_item_dto.dart';

/// Screen for trainers to review client check-ins.
class TrainerCheckInReviewScreen extends StatefulWidget {
  const TrainerCheckInReviewScreen({super.key});

  @override
  State<TrainerCheckInReviewScreen> createState() =>
      _TrainerCheckInReviewScreenState();
}

class _TrainerCheckInReviewScreenState
    extends State<TrainerCheckInReviewScreen> {
  List<TrainerCheckInListItemDto>? _checkIns;
  bool _loading = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    setState(() => _loading = true);
    try {
      final dio = getIt<Dio>();
      final response = await dio.get('/api/trainer/check-ins');
      final data = response.data['data'] as Map<String, dynamic>;
      final items = data['checkins'] as List<dynamic>;
      if (mounted) {
        setState(() {
          _checkIns = items
              .map((e) => TrainerCheckInListItemDto.fromJson(
                  e as Map<String, dynamic>))
              .toList();
          _loading = false;
        });
      }
    } catch (e) {
      if (mounted) setState(() { _error = e.toString(); _loading = false; });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(title: const Text('Check-In Reviews')),
      body: _loading
          ? const Center(
              child: CircularProgressIndicator(color: AppColors.primary))
          : _error != null
              ? Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(_error!,
                          style:
                              const TextStyle(color: AppColors.mutedText)),
                      const SizedBox(height: 12),
                      FilledButton.icon(
                        onPressed: _load,
                        icon: const Icon(Icons.refresh_rounded),
                        label: const Text('Retry'),
                      ),
                    ],
                  ),
                )
              : _checkIns == null || _checkIns!.isEmpty
                  ? const Center(
                      child: Text('No check-ins to review.',
                          style: TextStyle(color: AppColors.mutedText)))
                  : RefreshIndicator(
                      onRefresh: _load,
                      child: ListView.builder(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        itemCount: _checkIns!.length,
                        itemBuilder: (context, index) {
                          final ci = _checkIns![index];
                          return Card(
                            margin: const EdgeInsets.only(bottom: 8),
                            child: ListTile(
                              leading: CircleAvatar(
                                radius: 18,
                                backgroundColor:
                                    AppColors.primary.withValues(alpha: 0.15),
                                child: Text(
                                  ci.client.name.isNotEmpty
                                      ? ci.client.name[0].toUpperCase()
                                      : '?',
                                  style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.primary),
                                ),
                              ),
                              title: Text(ci.client.name,
                                  style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600)),
                              subtitle: Text(
                                '${ci.date} • ${ci.status}',
                                style: const TextStyle(
                                    fontSize: 12,
                                    color: AppColors.mutedText),
                              ),
                              trailing: const Icon(
                                  Icons.chevron_right_rounded,
                                  size: 18,
                                  color: AppColors.mutedText),
                            ),
                          );
                        },
                      ),
                    ),
    );
  }
}
