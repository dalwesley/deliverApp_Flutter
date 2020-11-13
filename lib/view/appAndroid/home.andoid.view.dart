import 'package:delivery/view/components/category.list.widget.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: CategoryList(
        categories: [],
      ),
    );
  }
}
