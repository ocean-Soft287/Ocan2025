import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../Feature/home/presentation/cubit/home_cubit.dart';
import '../../../../Feature/home/presentation/cubit/home_state.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeCubit()..search(keyword: "1452290K5"),
      child: Scaffold(
        appBar: AppBar(title: const Text('Home Page')),
        body: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            return const Center(child: Text('Home Page'));
          },
        ),
      ),
    );
  }
}
