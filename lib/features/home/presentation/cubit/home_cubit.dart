import 'package:flutter_bloc/flutter_bloc.dart';
import 'home_state.dart';
import '../../domain/usecases/get_home_usecase.dart';

class HomeCubit extends Cubit<HomeState> {
  final GetHomeUseCase getHomeUseCase;

  HomeCubit({required this.getHomeUseCase}) : super(const HomeState());
}
