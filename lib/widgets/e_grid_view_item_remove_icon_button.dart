import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:material_ui/material_ui.dart';

import '../bloc/e_files_bloc.dart';
import '../models/e_image.dart';
import 'e_icon.dart';

final class const EGridViewItemRemoveIconButton({
  super.key,
  required final EImage image,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) => GestureDetector(
    onTap: () {
      final bloc = context.read<EFilesBloc>();
      bloc.add(ERemoveFile(image.id));
    },
    child: Stack(
      alignment: .center,
      children: [
        Container(
          padding: .all(16),
          decoration: BoxDecoration(
            shape: .circle,
            color: Theme.of(context).colorScheme.surface,
          ),
          foregroundDecoration: BoxDecoration(
            shape: .circle,
            color: Theme.of(context).colorScheme.primaryContainer.withAlpha(120),
            border: .all(color: Theme.of(context).colorScheme.primaryContainer),
          ),
        ),
        EIcon(
          size: 18,
          icon: HugeIcons.strokeRoundedX,
        ),
      ],
    ),
  );
}