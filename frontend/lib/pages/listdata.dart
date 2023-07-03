import 'package:penitipan/components/Navigate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:penitipan/bloc/bloc/product_bloc.dart';

class ListData extends StatelessWidget {
  const ListData({super.key});

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
        home: const ProdPage(),
      ),
    );
  }
}

class ProdPage extends StatefulWidget {
  const ProdPage({super.key});

  @override
  State<ProdPage> createState() => _ProdPageState();
}

class _ProdPageState extends State<ProdPage>
    with SingleTickerProviderStateMixin {
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
        child: Icon(Icons.shopping_cart_checkout_sharp),
        onPressed: () {
          Route route = MaterialPageRoute(
            builder: (context) => const ListData(),
          );
          Navigator.push(context, route);
        },
      ),
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            MaterialPageRoute(
              builder: (context) => const Navigate(),
            );
          },
          child: Icon(Icons.home),
        ),
        title: Text("Data Product"),
      ),
      body: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          if (state is ProductLoading) {
            return Center(
              child: Image.network(
                  "https://media.tenor.com/hlKEXPvlX48AAAAi/loading-loader.gif"),
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


// SafeArea(
//           child: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(15.0),
//             child: TextField(
//               decoration: InputDecoration(
//                   disabledBorder: OutlineInputBorder(
//                       borderRadius: BorderRadius.all(Radius.circular(5.0)),
//                       borderSide: BorderSide(
//                           color: const Color.fromARGB(255, 255, 255, 255))),
//                   border: OutlineInputBorder(
//                       borderRadius: BorderRadius.all(Radius.circular(5.0)),
//                       borderSide: BorderSide(
//                           color: const Color.fromARGB(255, 255, 255, 255))),
//                   labelText: "Search"),
//             ),
//           ),