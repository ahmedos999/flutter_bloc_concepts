import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_concepts/business_logic/bloc/bloc/wishlist_bloc.dart';
import 'package:flutter_bloc_concepts/business_logic/cubit/testcounter_cubit.dart';
import 'package:flutter_bloc_concepts/data/models/product_model.dart';

class ThirdScreen extends StatefulWidget {
  String title;
  ThirdScreen({super.key, required this.title});

  @override
  State<ThirdScreen> createState() => _ThirdScreenState();
}

const snackBar = SnackBar(
  content: Text('Yay! A SnackBar!'),
);

class _ThirdScreenState extends State<ThirdScreen> {
  @override
  Widget build(BuildContext context) {
    print('Building...');
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: 500,
            child: BlocBuilder<TestcounterCubit, TestcounterState>(
              builder: (context, state) {
                return ListView.builder(
                    itemCount: state.product.length,
                    itemBuilder: ((context, index) {
                      return ListTile(
                        title: Text(state.product[index].id.toString()),
                        subtitle: Text(state.product[index].name),
                      );
                    }));
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    context.read<TestcounterCubit>().incementcount(1, 'a');
                  },
                  child: const Text('Change')),
            ],
          ),
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
