import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_shop/cubit/cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: BlocConsumer<InternetCubit, InternetState>(
          builder: (context, state) {
            if (state is InternetGainedState) {
              return const Text("Connected!");
            } else if (state is InternetLostState) {
              return const Text("Not Connected!");
            } else {
              return const Text("Loading...");
            }
          },
          listener: (context, state) {
            if (state is InternetGainedState) {
              print("Connected!");
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text("Internet connected!"),
                backgroundColor: Colors.green,
              ));
            } else if (state is InternetLostState) {
              print("Not Connected");
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text("Internet not connected!"),
                backgroundColor: Colors.red,
              ));
            }
          },
        ),

        // child: BlocBuilder<InternetBloc, InternetState>(
        //   builder: (context, state) {
        //     if (state is InternetGainedState) {
        //       print("Connected!");
        //       return const Text("Connected!");
        //     } else if (state is InternetLostState) {
        //       print("Not Connected");
        //       return const Text("Not Connected!");
        //     } else {
        //       return const Text("Loading...");
        //     }
        //   },
        // ),
      ),
    );
  }
}
