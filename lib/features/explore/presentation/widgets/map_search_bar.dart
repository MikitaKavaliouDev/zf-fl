import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class MapSearchBar extends StatefulWidget {
  final String? initialQuery;
  final ValueChanged<String> onSearch;
  final void Function(double lat, double lng, String name) onLocationSelected;

  const MapSearchBar({
    super.key,
    this.initialQuery,
    required this.onSearch,
    required this.onLocationSelected,
  });

  @override
  State<MapSearchBar> createState() => _MapSearchBarState();
}

class _MapSearchBarState extends State<MapSearchBar> {
  late TextEditingController _controller;
  List<Map<String, dynamic>> _locationResults = [];
  bool _isSearchingLocations = false;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialQuery ?? '');
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _searchLocations(String query) async {
    if (query.isEmpty) {
      setState(() => _locationResults = []);
      return;
    }

    setState(() => _isSearchingLocations = true);
    try {
      // Use Nominatim OSM geocoding (matches iOS MKLocalSearch behavior)
      final dio = Dio(BaseOptions(
        baseUrl: 'https://nominatim.openstreetmap.org',
        connectTimeout: const Duration(seconds: 5),
        receiveTimeout: const Duration(seconds: 5),
      ));
      final response = await dio.get(
        '/search',
        queryParameters: {
          'format': 'json',
          'q': query,
          'limit': 5,
        },
        options: Options(headers: {'User-Agent': 'fit.ziro.app'}),
      );
      if (mounted) {
        setState(() {
          _locationResults =
              (response.data as List).cast<Map<String, dynamic>>();
          _isSearchingLocations = false;
        });
      }
    } catch (_) {
      if (mounted) setState(() => _isSearchingLocations = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Search bar capsule
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.85),
            borderRadius: BorderRadius.circular(99),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.1),
                blurRadius: 10,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: TextField(
            controller: _controller,
            onChanged: (value) {
              widget.onSearch(value);
              _searchLocations(value);
            },
            style: const TextStyle(fontSize: 16),
            decoration: InputDecoration(
              hintText: 'Search specialists or events',
              hintStyle: const TextStyle(color: Color(0xFF8E8E93)),
              prefixIcon:
                  const Icon(Icons.search, color: Color(0xFF8E8E93)),
              suffixIcon: _controller.text.isNotEmpty
                  ? IconButton(
                      icon: const Icon(Icons.cancel,
                          size: 18, color: Color(0xFF8E8E93)),
                      onPressed: () {
                        _controller.clear();
                        widget.onSearch('');
                        setState(() => _locationResults = []);
                      },
                    )
                  : null,
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(vertical: 12),
            ),
          ),
        ),
        // Search results
        if (_controller.text.isNotEmpty)
          Container(
            margin: const EdgeInsets.fromLTRB(16, 8, 16, 16),
            constraints: const BoxConstraints(maxHeight: 300),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.9),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.1),
                  blurRadius: 10,
                  offset: const Offset(0, -2),
                ),
              ],
            ),
            child: ListView(
              shrinkWrap: true,
              children: [
                // Location results
                if (_locationResults.isNotEmpty) ...[
                  _sectionHeader('Locations'),
                  ..._locationResults.map((loc) => _buildLocationRow(loc)),
                ],
                if (_isSearchingLocations)
                  const Padding(
                    padding: EdgeInsets.all(16),
                    child:
                        Center(child: CircularProgressIndicator(strokeWidth: 2)),
                  ),
              ],
            ),
          ),
      ],
    );
  }

  Widget _sectionHeader(String title) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
      color: Colors.black.withValues(alpha: 0.05),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
          color: Color(0xFF8E8E93),
        ),
      ),
    );
  }

  Widget _buildLocationRow(Map<String, dynamic> location) {
    final displayName = location['display_name'] as String? ?? 'Unknown';
    final lat = double.parse(location['lat'] as String);
    final lon = double.parse(location['lon'] as String);
    // Shorten display name for the list
    final parts = displayName.split(',');
    final name =
        parts.isNotEmpty ? parts[0].trim() : displayName;
    final subtitle = parts.length > 1
        ? parts
            .sublist(1, parts.length > 3 ? 3 : parts.length)
            .join(',')
            .trim()
        : '';

    return InkWell(
      onTap: () => widget.onLocationSelected(lat, lon, name),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Row(
          children: [
            const Icon(Icons.location_on, color: Color(0xFF007aff), size: 20),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  if (subtitle.isNotEmpty)
                    Text(
                      subtitle,
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
          ],
        ),
      ),
    );
  }
}
