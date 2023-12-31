import 'package:flutter/material.dart';

class ExerciseTile extends StatelessWidget {
  final Color? color;
  final dynamic title;
  final dynamic? subtitle;

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
                    size: 18.0,
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
                  title,
                  SizedBox(
                    height: 5,
                  ),
                  subtitle,
                ],
              ),
            ],
          ),
          Icon(
            Icons.more_horiz,
            color: Colors.grey,
            size: 30.0,
          ),
        ],
      ),
    );
  }
}
