import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ziro_fit/core/models/trainer_list_item_dto.dart';
import 'package:ziro_fit/features/explore/cubit/explore_map_state.dart';
import 'package:ziro_fit/features/explore/data/models/explore_event_dto.dart';

class ClusterListView extends StatelessWidget {
  final List<MapItem> items;
  final void Function(TrainerListItemDto) onSelectTrainer;
  final void Function(ExploreEventDto) onSelectEvent;
  final VoidCallback onClose;

  const ClusterListView({
    super.key,
    required this.items,
    required this.onSelectTrainer,
    required this.onSelectEvent,
    required this.onClose,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.9),
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Header
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 12),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${items.length} ${items.length == 1 ? 'Item' : 'Items'} Here',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        'Select an item to view details',
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0xFF8E8E93),
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: onClose,
                  icon: const Icon(Icons.close, color: Colors.grey),
                ),
              ],
            ),
          ),
          // List
          ConstrainedBox(
            constraints: const BoxConstraints(maxHeight: 350),
            child: ListView.separated(
              shrinkWrap: true,
              itemCount: items.length,
              separatorBuilder: (_, _) => const Divider(indent: 84),
              itemBuilder: (context, index) {
                return items[index].when(
                  trainer: (trainer) => _buildTrainerRow(trainer),
                  event: (event) => _buildEventRow(event),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTrainerRow(TrainerListItemDto trainer) {
    return InkWell(
      onTap: () => onSelectTrainer(trainer),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: SizedBox(
                width: 48,
                height: 48,
                child: _buildTrainerAvatar(trainer),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    trainer.name ?? 'Professional',
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  _buildCertifications(trainer),
                ],
              ),
            ),
            const Icon(Icons.chevron_right, size: 16, color: Colors.grey),
          ],
        ),
      ),
    );
  }

  Widget _buildEventRow(ExploreEventDto event) {
    return InkWell(
      onTap: () => onSelectEvent(event),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: SizedBox(
                width: 48,
                height: 48,
                child: _buildEventImage(event),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    event.title,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    event.locationName,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Color(0xFF8E8E93),
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            const Icon(Icons.chevron_right, size: 16, color: Colors.grey),
          ],
        ),
      ),
    );
  }

  Widget _buildTrainerAvatar(TrainerListItemDto trainer) {
    final photoPath = trainer.profile?.profilePhotoPath;
    if (photoPath != null && photoPath.isNotEmpty) {
      return CachedNetworkImage(
        imageUrl: photoPath,
        fit: BoxFit.cover,
        errorWidget: (_, _, _) => _avatarPlaceholder(),
      );
    }
    return _avatarPlaceholder();
  }

  Widget _avatarPlaceholder() {
    return Container(
      color: Colors.grey.shade200,
      child: const Icon(Icons.person, color: Colors.grey),
    );
  }

  Widget _buildEventImage(ExploreEventDto event) {
    if (event.imageUrl != null && event.imageUrl!.isNotEmpty) {
      return CachedNetworkImage(
        imageUrl: event.imageUrl!,
        fit: BoxFit.cover,
        errorWidget: (_, _, _) => _eventPlaceholder(),
      );
    }
    return _eventPlaceholder();
  }

  Widget _eventPlaceholder() {
    return Container(
      color: const Color(0xFF007aff).withValues(alpha: 0.1),
      child: const Icon(Icons.calendar_today, color: Color(0xFF007aff)),
    );
  }

  Widget _buildCertifications(TrainerListItemDto t) {
    final certs = t.profile?.certifications;
    if (certs != null && certs.isNotEmpty) {
      return Text(
        certs.take(2).join(', '),
        style: const TextStyle(
          fontSize: 12,
          color: Color(0xFF8E8E93),
        ),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      );
    }
    return const SizedBox.shrink();
  }
}
