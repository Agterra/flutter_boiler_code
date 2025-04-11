import 'package:json_annotation/json_annotation.dart';

part 'installation.dto.g.dart';

@JsonSerializable()
class InstallationDTO extends JsonSerializable {
  final String id;

  InstallationDTO({required this.id});

  @override
  factory InstallationDTO.fromJson(Map<String, dynamic> json) =>
      _$InstallationDTOFromJson(json);
}
