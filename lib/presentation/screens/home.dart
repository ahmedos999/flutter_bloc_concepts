import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_concepts/business_logic/cubit/counter_cubit.dart';
import 'package:flutter_bloc_concepts/business_logic/cubit/internet_cubit.dart';
import 'package:flutter_bloc_concepts/business_logic/cubit/testcounter_cubit.dart';
import 'package:flutter_bloc_concepts/constants/enums.dart';
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
    print('whole screen building.....');
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Builder(builder: (context) {
              print('just the row building.....');
              final internetwatcher = context.watch<InternetCubit>().state;
              final conuterwatcher = context.watch<CounterCubit>().state;
              final test = context.watch<TestcounterCubit>().state;
              if (internetwatcher is InternetConnected &&
                  internetwatcher.connectionType == ConnectionType.mobile) {
                return Text(
                    'counter: ${conuterwatcher.counterValue} and internet provider is: Mobile');
              } else if (internetwatcher is InternetConnected &&
                  internetwatcher.connectionType == ConnectionType.wifi) {
                return Text(
                    'counter: ${conuterwatcher.counterValue} and internet provider is: wifi');
              } else {
                return Text(
                    'counter: ${conuterwatcher.counterValue} and internet provider is: none');
              }
            }),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                    onPressed: () {
                      context.read<CounterCubit>().increment();
                      // BlocProvider.of<CounterCubit>(context).increment();
                    },
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('Incement'),
                    )),
                ElevatedButton(
                    onPressed: () {
                      context.read<CounterCubit>().decrement();
                      // BlocProvider.of<CounterCubit>(context).decrement();
                    },
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('decrment'),
                    )),
              ],
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/third');
                },
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('go to Third Screen'),
                )),
            BlocConsumer<CounterCubit, CounterState>(
              listener: (context, state) {
                if (state.isIncrement) {
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }
              },
              builder: (context, state) {
                return Center(
                  child: Text(state.counterValue.toString()),
                );
              },
            )
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
