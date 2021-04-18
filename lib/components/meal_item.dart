import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/utils/app_routes.dart';

class MealItem extends StatefulWidget {
  final Meal meal;

  MealItem(this.meal);

  @override
  _MealItemState createState() => _MealItemState();
}

class _MealItemState extends State<MealItem> {
  bool _isFavorite = false;
  void _selectMeal(BuildContext context) {
    Navigator.of(context)
        .pushNamed(AppRoutes.MEAL_DETAIL, arguments: widget.meal)
        .then((value) {
      if (value == null) {
        print('null');
      } else {
        print(value);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _selectMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 4,
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)),
                  child: Image.network(
                    widget.meal.imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 10,
                  child: Container(
                    width: 300,
                    color: Colors.black54,
                    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 20),
                    child: Text(
                      widget.meal.title,
                      softWrap: true,
                      overflow: TextOverflow.fade,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 26,
                      ),
                    ),
                  ),
                ),
                Positioned(
                    right: 15,
                    top: 15,
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          _isFavorite = !_isFavorite;
                        });
                      },
                      child: Container(
                        child: Icon(
                          _isFavorite ? Icons.star : Icons.star_border,
                          size: 30,
                          color: Colors.yellowAccent,
                        ),
                      ),
                    ))
              ],
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Icon(Icons.schedule),
                      SizedBox(width: 6),
                      Text('${widget.meal.duration} min')
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.work),
                      SizedBox(width: 6),
                      Text(widget.meal.complexityText)
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.attach_money),
                      SizedBox(width: 6),
                      Text(widget.meal.costText)
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
