import 'package:flutter/material.dart';
import '../models/meal.dart';

import '../widgets/meal_item.dart';
import '../dummy_data.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = '/category-meals';

  final List<Meal> _availableMeals = DUMMY_MEALS;

  CategoryMealsScreen(List<Meal> availableMeals);

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String categoryTitle;
  List<Meal> displayedMeails;
  var _loadedInitData = false;

  @override
  void initState() {
    // ...
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // this is how you can pass data back
    if (!_loadedInitData) {
      // getting the data from route Arguments
      final routeArgs =
          ModalRoute.of(context).settings.arguments as Map<String, String>;
      categoryTitle = routeArgs['title'];
      final categoryId = routeArgs['id'];
      displayedMeails = widget._availableMeals.where((meal) {
        return meal.categories.contains(categoryId);
      }).toList();
      _loadedInitData = true;
    }
    super.didChangeDependencies();
  }

  void _removeMeal(String mealId) {
    setState(() {
      displayedMeails.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: displayedMeails[index].id,
            title: displayedMeails[index].title,
            imageUrl: displayedMeails[index].imageUrl,
            duration: displayedMeails[index].duration,
            affordability: displayedMeails[index].affordability,
            complexity: displayedMeails[index].complexity,
            removeItem: _removeMeal,
          );
        },
        itemCount: displayedMeails.length,
      ),
    );
  }
}
