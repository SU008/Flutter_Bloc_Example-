import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'API_Bloc.dart';



class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ApiBloc apiBloc = BlocProvider.of<ApiBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('BLoC API Example'),
      ),
      body: BlocBuilder<ApiBloc, ApiState>(
        builder: (context, state) {
          if (state is LoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is DataLoadedState) {
            List<dynamic> data = state.data;

            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(data[index]['title']),
                  leading: Text(data[index]['id'].toString()),
                );
              },
            );
          } else if (state is ErrorState) {
            return Center(child: Text(state.error));
          } else {
            return const Center(child: Text('Press the button to fetch data'));
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          apiBloc.add(FetchDataEvent());
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
