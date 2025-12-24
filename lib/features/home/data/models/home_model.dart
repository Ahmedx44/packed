import '../../domain/entities/home_entity.dart';

class HomeModel extends HomeEntity {
  const HomeModel();

  factory HomeModel.fromJson(Map<String, dynamic> json) {
    return const HomeModel();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}
