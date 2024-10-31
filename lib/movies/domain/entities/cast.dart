part of './../../../core/helpers/export_manager/export_manager.dart';

class Cast extends Equatable {
  final String name;
  final String profileUrl;
  final int gender;

  const Cast({
    required this.name,
    required this.profileUrl,
    required this.gender,
  });

  @override
  List<Object?> get props => [
        name,
        profileUrl,
        gender,
      ];
}
