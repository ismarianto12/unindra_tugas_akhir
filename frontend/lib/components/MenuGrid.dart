import 'package:flutter/material.dart';
import '../model/menugrid.dart';

class MenuGrid extends StatelessWidget {
  final List<MenuItem> menuItems;

  MenuGrid({required this.menuItems});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 4,
      padding: EdgeInsets.all(30),
      mainAxisSpacing: 28,
      crossAxisSpacing: 20,
      children: menuItems.map((item) {
        return InkWell(
          onTap: () {
            Navigator.pushNamed(
                context, item.route!); // Add the null-aware operator here
          },
          child: Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: item.colors,
              borderRadius: BorderRadiusDirectional.circular(160),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(item.icon, size: 20, color: Colors.white),
                SizedBox(height: 4),
                Expanded(
                  child: Text(
                    item.title!,
                    style: TextStyle(color: Colors.white, fontSize: 10.0),
                  ),
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}
