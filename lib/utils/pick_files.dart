import 'package:file_picker/file_picker.dart';
import 'package:provider/provider.dart';

import '../bloc/e_files_bloc.dart';
import '../models/e_image.dart';

void pickFiles(Locator read) async {
  final filesBloc = read<EFilesBloc>();
  final files = await FilePicker.pickFiles(
    type: .image,
  );

  if (files.isEmpty) return;

  final images = files.map((e) => EImage(
    id: e.name,
    file: e,
    metadata: const {},
  ));

  filesBloc.add(EAddFiles(images));
}