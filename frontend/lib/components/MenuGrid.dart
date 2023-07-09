import 'package:flutter/material.dart';
import '../model/menugrid.dart';

class MenuGrid extends StatelessWidget {
  final List<MenuItem> menuItems;

  MenuGrid({required this.menuItems});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 4,
      padding: EdgeInsets.all(10),
      mainAxisSpacing: 6,
      crossAxisSpacing: 3,
      children: menuItems.map((item) {
        return InkWell(
          onTap: () {
            Navigator.pushNamed(context, item.route!);
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: item.colors,
                  borderRadius: BorderRadiusDirectional.circular(160),
                ),
                child: Icon(item.icon, size: 39, color: Colors.white),
              ),
              // SizedBox(height: 5),
              Expanded(
                child: Center(
                  child: Text(
                    item.title!,
                    style: const TextStyle(
                        color: const Color.fromARGB(255, 0, 0, 0),
                        fontSize: 12.0),
                  ),
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}
