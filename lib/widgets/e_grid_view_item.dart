import 'dart:io';

import 'package:material_ui/material_ui.dart';

import '../models/e_image.dart';
import 'e_grid_view_item_info.dart';
import 'e_grid_view_item_remove_icon_button.dart';

final class const EGridViewItem({
  super.key,
  required final File file,
  required final double dpr,
  required final EImage image,
}) extends StatelessWidget {
  static const _cacheStep = 128;

  /// Quantizes a tile dimension to a coarse step so resizing reuses decoded
  /// images instead of minting a new cache entry per pixel.
  int _cacheHeight(double logicalHeight, double dpr) {
    final physical = (logicalHeight * dpr).ceil();
    final bucketed = (physical / _cacheStep).ceil() * _cacheStep;
    return bucketed.clamp(_cacheStep, 2048);
  }

  @override
  Widget build(BuildContext context) => LayoutBuilder(
    builder: (context, limits) => ClipRRect(
      borderRadius: .circular(16),
      child: Stack(
        alignment: .center,
        children: [
          Positioned.fill(
            child: ImageFiltered(
              imageFilter: .blur(sigmaX: 8, sigmaY: 8,),
              child: Image.file(
                file,
                fit: .cover,
                height: limits.maxHeight,
                cacheHeight: _cacheHeight(limits.maxHeight, dpr),
              ),
            ),
          ),
          Column(
            children: [
              Expanded(
                child: Image.file(
                  file,
                  fit: .contain,
                  height: limits.maxHeight,
                  cacheHeight: _cacheHeight(limits.maxHeight, dpr),
                ),
              ),
              EGridViewItemInfo(image: image,),
            ],
          ),
          Positioned(
            top: 8,
            right: 8,
            child: EGridViewItemRemoveIconButton(image: image),
          ),
        ],
      ),
    ),
  );
}