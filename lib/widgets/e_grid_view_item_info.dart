import 'package:flutter/foundation.dart';
import 'package:image/image.dart' as img;
import 'package:material_ui/material_ui.dart';
import 'package:path/path.dart' as p;

import '../models/e_image.dart';
import 'e_grid_view_item_info_dimensions.dart';
import 'e_grid_view_item_info_name_and_extension.dart';
import 'e_grid_view_item_info_size.dart';

final class const EGridViewItemInfo({
  super.key,
  required final EImage image,
}) extends StatefulWidget {
  @override
  State<EGridViewItemInfo> createState() => _EGridViewItemInfoState();
}

final class _EGridViewItemInfoState extends State<EGridViewItemInfo> {
  static final _dimensionsCache = <String, (int, int)?>{};
  static final _sizeCache = <String, int?>{};

  late var _fileExtension = widget.image.file.extension?.toUpperCase() ?? '';
  late var _dimensions = _getDimensions();
  late var _baseName = p.basenameWithoutExtension(widget.image.file.name);
  late var _size = _getSize();

  static Future<(int, int)?> _decodeSize(String path) async {
    final image = await img.decodeImageFile(path);
    return image == null ? null : (image.width, image.height);
  }

  Future<int?> _getSize() async {
    final path = widget.image.file.path;
    if (path == null) return null;
    if (_sizeCache.containsKey(path)) return _sizeCache[path];
    final size = await widget.image.file.length();
    return _sizeCache[path] = size;
  }

  Future<(int, int)?> _getDimensions() async {
    final path = widget.image.file.path;
    if (path == null) return null;
    if (_dimensionsCache.containsKey(path)) return _dimensionsCache[path];
    final dimensions = await compute(_decodeSize, path);
    return _dimensionsCache[path] = dimensions;
  }

  @override
  void didUpdateWidget(covariant EGridViewItemInfo old) {
    super.didUpdateWidget(old);

    if (old.image.file.path != widget.image.file.path) {
      _fileExtension = widget.image.file.extension?.toUpperCase() ?? '';
      _dimensions = _getDimensions();
      _baseName = p.basenameWithoutExtension(widget.image.file.name);
      _size = _getSize();
    }
  }

  @override
  Widget build(BuildContext context) => Container(
    padding: .all(12),
    decoration: BoxDecoration(
      color: Theme.of(context).colorScheme.surface,
      border: .all(color: Colors.white.withAlpha(20)),
      borderRadius: .circular(16),
    ),
    foregroundDecoration: BoxDecoration(
      color: Colors.white.withAlpha(6),
      borderRadius: .circular(16),
    ),
    child: Column(
      spacing: 8,
      mainAxisSize: .min,
      children: [
        EGridViewItemInfoNameAndExtension(
          baseName: _baseName,
          fileExtension: _fileExtension,
        ),
        Row(
          spacing: 8,
          children: [
            FutureBuilder(
              future: _dimensions,
              builder: (_, state) => switch (state.hasData) {
                false => const SizedBox.shrink(),
                true => EGridViewItemInfoDimensions(
                  width: state.data!.$1,
                  height: state.data!.$2,
                ),
              }
            ),
            FutureBuilder(
              future: _size,
              builder: (context, state) => AnimatedSwitcher(
                duration: const .new(milliseconds: 150),
                child: switch (state.hasData) {
                  false => const SizedBox.shrink(),
                  true => EGridViewItemInfoSize(size: state.data!,),
                },
              ),
            ),
          ],
        ),
      ],
    ),
  );
}