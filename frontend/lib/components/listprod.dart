import 'package:penitipan/components/Navigate.dart';
import 'package:penitipan/pages/listdata.dart';
import 'package:penitipan/pages/productcat.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:penitipan/bloc/bloc/product_bloc.dart';

class ListProd extends StatelessWidget {
  const ListProd({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductBloc()..add(GetProductEvent()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Halaman Product',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const Comprod(),
      ),
    );
  }
}

class Comprod extends StatefulWidget {
  const Comprod({super.key});

  @override
  State<Comprod> createState() => _ComprodState();
}

class _ComprodState extends State<Comprod> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromARGB(255, 30, 8, 200),
        child: Icon(Icons.refresh),
        onPressed: () {
          MaterialPageRoute(
            builder: (context) => const Comprod(),
          );
          // Navigator.push(context, route);
        },
      ),
      body: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          if (state is ProductLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is ProductSuccess) {
            return ListView.builder(
                itemCount: state.products.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text('Rp.${state.products[index].price}'),
                      subtitle: Text('Rp.${state.products[index].title}'),
                      leading: Image.network(
                        '${state.products[index].images[0]}',
                        height: 100,
                        width: 100,
                      ),
                    ),
                  );
                });
          }
          return const Center(child: Text("No data Get"));
        },
      ),
    );
  }
}
