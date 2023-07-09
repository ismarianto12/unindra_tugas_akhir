import 'package:flutter/material.dart';

class ExerciseTile extends StatelessWidget {
  final Color? color;
  final String? title;
  final String? subtitle;

  const ExerciseTile({Key? key, this.color, this.title, this.subtitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Container(
                  padding: EdgeInsets.all(16),
                  color: color,
                  child: Icon(
                    Icons.money_rounded,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('$title'),
                  SizedBox(
                    height: 5,
                  ),
                  Text('$subtitle'),
                ],
              ),
            ],
          ),
          Icon(
            Icons.more_horiz,
            color: Colors.grey,
          ),
        ],
      ),
    );
  }
}
