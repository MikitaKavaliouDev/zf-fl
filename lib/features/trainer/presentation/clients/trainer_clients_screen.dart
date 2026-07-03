import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_theme.dart';
import '../../cubit/trainer_clients_cubit.dart';
import '../../cubit/trainer_clients_state.dart';
import '../../data/models/trainer_client_list_item_dto.dart';

/// Searchable trainer client list.
class TrainerClientsScreen extends StatefulWidget {
  const TrainerClientsScreen({super.key});

  @override
  State<TrainerClientsScreen> createState() => _TrainerClientsScreenState();
}

class _TrainerClientsScreenState extends State<TrainerClientsScreen> {
  final _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<TrainerClientsCubit>().loadClients();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(title: const Text('Clients')),
      body: Column(
        children: [
          // Search bar
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search clients...',
                prefixIcon: const Icon(Icons.search_rounded),
                filled: true,
                fillColor: AppColors.mutedSurface,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(99),
                  borderSide:
                      const BorderSide(color: AppColors.borderMuted),
                ),
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              ),
              onChanged: (q) {
                context.read<TrainerClientsCubit>().searchClients(q);
              },
            ),
          ),
          // List
          Expanded(
            child: BlocBuilder<TrainerClientsCubit, TrainerClientsState>(
              builder: (context, state) {
                return switch (state) {
                  TrainerClientsInitial() || TrainerClientsLoading() =>
                    const Center(
                        child: CircularProgressIndicator(
                            color: AppColors.primary)),
                  TrainerClientsError(:final message) => Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(message,
                              style: const TextStyle(
                                  color: AppColors.mutedText)),
                          const SizedBox(height: 12),
                          FilledButton.icon(
                            onPressed: () => context
                                .read<TrainerClientsCubit>()
                                .loadClients(),
                            icon: const Icon(Icons.refresh_rounded),
                            label: const Text('Retry'),
                          ),
                        ],
                      ),
                    ),
                  TrainerClientsLoaded(:final clients) =>
                    clients.isEmpty
                        ? const Center(
                            child: Text('No clients found.',
                                style:
                                    TextStyle(color: AppColors.mutedText)))
                        : RefreshIndicator(
                            onRefresh: () => context
                                .read<TrainerClientsCubit>()
                                .refresh(),
                            child: ListView.builder(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              itemCount: clients.length,
                              itemBuilder: (context, index) =>
                                  _ClientCard(
                                client: clients[index],
                                onTap: () => context.push(
                                    '/trainer/clients/${clients[index].id}'),
                              ),
                            ),
                          ),
                };
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _ClientCard extends StatelessWidget {
  final TrainerClientListItemDto client;
  final VoidCallback onTap;

  const _ClientCard({required this.client, required this.onTap});

  Color _statusColor(String status) {
    switch (status) {
      case 'active':
        return const Color(0xFF34C759);
      case 'inactive':
        return AppColors.mutedText;
      case 'pending':
        return const Color(0xFFFF9500);
      default:
        return AppColors.mutedText;
    }
  }

  Color _engagementColor(String score) {
    switch (score) {
      case 'high':
        return const Color(0xFF34C759);
      case 'medium':
        return const Color(0xFFFF9500);
      default:
        return AppColors.mutedText;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        onTap: onTap,
        leading: CircleAvatar(
          backgroundColor: AppColors.primary.withValues(alpha: 0.15),
          child: Text(
            client.name.isNotEmpty
                ? client.name[0].toUpperCase()
                : '?',
            style: const TextStyle(
                fontWeight: FontWeight.w600, color: AppColors.primary),
          ),
        ),
        title: Text(client.name,
            style: const TextStyle(
                fontSize: 14, fontWeight: FontWeight.w600)),
        subtitle: Row(
          children: [
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              decoration: BoxDecoration(
                color: _statusColor(client.status).withValues(alpha: 0.15),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(client.status[0].toUpperCase() +
                  client.status.substring(1),
                  style: TextStyle(
                      fontSize: 11,
                      color: _statusColor(client.status),
                      fontWeight: FontWeight.w500)),
            ),
            const SizedBox(width: 8),
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              decoration: BoxDecoration(
                color: _engagementColor(client.engagementScore)
                    .withValues(alpha: 0.15),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(client.engagementScore,
                  style: TextStyle(
                      fontSize: 11,
                      color: _engagementColor(client.engagementScore),
                      fontWeight: FontWeight.w500)),
            ),
          ],
        ),
        trailing: const Icon(Icons.chevron_right_rounded,
            size: 18, color: AppColors.mutedText),
      ),
    );
  }
}
