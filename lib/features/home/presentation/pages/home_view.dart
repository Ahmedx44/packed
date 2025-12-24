import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/home_cubit.dart';
import '../cubit/home_state.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          return const Center(
            child: Text('Home View'),
          );
        },
      ),
    );
  }
}
