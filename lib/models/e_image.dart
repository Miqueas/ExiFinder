import 'package:collection/collection.dart';
import 'package:file_picker/file_picker.dart';

const _eq = DeepCollectionEquality();

final class EImage({
  required final String id,
  required final PlatformFile file,
  required final Map<String, dynamic> metadata,
}) {
  @override
  int get hashCode => Object.hash(id, file.path, _eq.hash(metadata));

  @override
  bool operator ==(Object other) {
    if (other is! EImage) return false;
    if (identical(this, other)) return true;

    final sameId = id == other.id;
    final samePath = file.path == other.file.path;
    final sameMetadata = _eq.equals(metadata, other.metadata);

    return sameId && samePath && sameMetadata;
  }

  EImage copyWith({
    String? id,
    PlatformFile? file,
    Map<String, dynamic>? metadata,
  }) => .new(
    id: id ?? this.id,
    file: file ?? this.file,
    metadata: metadata ?? this.metadata,
  );
}