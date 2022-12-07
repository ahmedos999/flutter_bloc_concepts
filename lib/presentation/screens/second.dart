import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_concepts/business_logic/cubit/counter_cubit.dart';

class SecScreen extends StatefulWidget {
  String title;
  SecScreen({super.key, required this.title});

  @override
  State<SecScreen> createState() => _SecScreenState();
}

const snackBar = SnackBar(
  content: Text('Yay! A SnackBar!'),
);

class _SecScreenState extends State<SecScreen> {
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
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
