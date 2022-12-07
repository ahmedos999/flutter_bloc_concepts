import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_concepts/business_logic/cubit/counter_cubit.dart';
import 'package:flutter_bloc_concepts/presentation/screens/second.dart';

class HomeScreen extends StatefulWidget {
  String title;
  HomeScreen({super.key, required this.title});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

const snackBar = SnackBar(
  content: Text('Yay! A SnackBar!'),
);

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            BlocConsumer<CounterCubit, CounterState>(
              listener: (context, state) {
                if (state.isIncrement) {
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }
              },
              builder: (context, state) {
                return Text(
                  state.counterValue.toString(),
                  style: Theme.of(context).textTheme.headline4,
                );
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () {
                      BlocProvider.of<CounterCubit>(context).increment();
                    },
                    child: const Text('Incremant')),
                const SizedBox(
                  width: 5,
                ),
                ElevatedButton(
                    onPressed: () {
                      BlocProvider.of<CounterCubit>(context).decrement();
                    },
                    child: const Text('Decremant')),
              ],
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/second');
                },
                child: const Text('Go to second Screen')),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/third');
                },
                child: const Text('Go to third Screen')),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
