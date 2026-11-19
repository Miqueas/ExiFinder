import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_ui/material_ui.dart';

import '../bloc/e_files_bloc.dart';
import '../bloc/e_grid_items_size_bloc.dart';
import 'e_grid_view_item.dart';

final class const EHomeFilesView({ super.key, }) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final dpr = MediaQuery.devicePixelRatioOf(context);
    final filesBloc = context.watch<EFilesBloc>();
    final screenWidth = MediaQuery.widthOf(context);
    final gridItemsSizeBloc = context.watch<EGridItemsSizeBloc>();

    final images = filesBloc.state;

    return GridView.builder(
      itemCount: images.length,
      itemBuilder: (context, index) {
        final image = images[index];
        final file = File(image.file.path!);

        return EGridViewItem(file: file, dpr: dpr, image: image);
      },
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: screenWidth ~/ gridItemsSizeBloc.state,
        mainAxisSpacing: 24,
        crossAxisSpacing: 12,
      ),
    );
  }
}