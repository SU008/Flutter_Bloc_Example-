import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'API_Bloc.dart';
import 'myhomepage.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (context) => ApiBloc("https://jsonplaceholder.typicode.com/posts"),
        child: MyHomePage(),
      ),
    );
  }
}

