import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:material_ui/material_ui.dart';

import '../bloc/e_files_bloc.dart';
import 'e_icon.dart';
import 'e_label.dart';

final class const EClearButton({ super.key, }) extends StatelessWidget {
  @override
  Widget build(BuildContext context) => GestureDetector(
    onTap: () {
      final filesBloc = context.read<EFilesBloc>();
      filesBloc.add(ERemoveAllFiles());
    },
    child: Container(
      padding: const .symmetric(vertical: 10, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white.withAlpha(20),
        border: .all(color: Colors.white.withAlpha(60)),
        borderRadius: .circular(12)
      ),
      child: Row(
        spacing: 8,
        mainAxisSize: .min,
        children: [
          EIcon(
            size: 16,
            icon: HugeIcons.strokeRoundedDelete01,
          ),
          ELabel('Clear'),
        ],
      ),
    ),
  );
}