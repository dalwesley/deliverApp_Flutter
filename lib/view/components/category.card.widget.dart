import 'package:delivery/model/category.list.model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CategoryCard extends StatelessWidget {
  final CategoryListItemModel item;

  CategoryCard({@required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 70,
      margin: EdgeInsets.all(5),
      padding: EdgeInsets.all(5),
      child: FlatButton(
        child: Text("data"),
        onPressed: () {},
      ),
    );
  }
}
