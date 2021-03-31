import 'package:flutter/material.dart';
import 'package:myapplication/category_item.dart';
import 'package:myapplication/dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  static const String routeName = "/categories";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('DeliverMeals'),
        ),
        body: GridView(
          padding: const EdgeInsets.all(25),
          children: DUMMY_CATEGORIES
              .map((catData) => CategoryItem(catData.id, catData.title, catData.color))
              .toList(),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            crossAxisSpacing: 20,
            mainAxisExtent: 200,
            childAspectRatio: 3 / 2,
            mainAxisSpacing: 20,
            maxCrossAxisExtent: 200
          ),
        ));
  }
}
