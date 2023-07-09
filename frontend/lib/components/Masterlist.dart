import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';

// Define Event to load data
abstract class DataEvent {}

class FetchDataEvent extends DataEvent {}

// Define State to display data
abstract class DataState {}

class InitialDataState extends DataState {}

class LoadedDataState extends DataState {
  final List<Map<String, dynamic>> data;

  LoadedDataState(this.data);
}

class DataBloc extends Bloc<DataEvent, DataState> {
  DataBloc(DataState initialState) : super(initialState);

  @override
  Stream<DataState> mapEventToState(DataEvent event) async* {
    if (event is FetchDataEvent) {
      yield InitialDataState();
      try {
        final response = await http
            .get(Uri.parse('http://localhost:8088/masterdata/satuan/satuan'));
        if (response.statusCode == 200) {
          final List<dynamic> jsonData = json.decode(response.body);
          final List<Map<String, dynamic>> data = [];
          for (var item in jsonData) {
            data.add(Map<String, dynamic>.from(item));
          }
          yield LoadedDataState(data);
        } else {
          throw Exception('Failed to load data');
        }
      } catch (e) {
        throw Exception('Error: $e');
      }
    }
  }
}

class MasterList extends StatelessWidget {
  final DataBloc dataBloc = DataBloc(InitialDataState());

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Bloc Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider<DataBloc>(
        create: (context) => dataBloc,
        child: HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final DataBloc dataBloc = BlocProvider.of<DataBloc>(context);
    dataBloc.add(FetchDataEvent());

    return Scaffold(
      appBar: AppBar(
        title: Text('Data Table Example'),
      ),
      body: Center(
        child: BlocBuilder<DataBloc, DataState>(
          builder: (context, state) {
            if (state is InitialDataState) {
              return CircularProgressIndicator();
            } else if (state is LoadedDataState) {
              return DataTable(
                columns: <DataColumn>[
                  DataColumn(
                    label: Text('ID'),
                  ),
                  DataColumn(
                    label: Text('Kode'),
                  ),
                  DataColumn(
                    label: Text('Nama'),
                  ),
                  DataColumn(
                    label: Text('Type'),
                  ),
                ],
                rows: state.data
                    .map(
                      (data) => DataRow(
                        cells: <DataCell>[
                          DataCell(Text(data['id'].toString())),
                          DataCell(Text(data['kode'] ?? '')),
                          DataCell(Text(data['nama'] ?? '')),
                          DataCell(Text(data['type'] ?? '')),
                        ],
                      ),
                    )
                    .toList(),
              );
            } else {
              return Text('Failed to load data');
            }
          },
        ),
      ),
    );
  }
}
