import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:transparent_image/transparent_image.dart';

// String tmpImage =
//     "https://scontent.fcai20-2.fna.fbcdn.net/v/t39.30808-6/385095626_179649248510215_6733862229124335763_n.jpg?stp=dst-jpg_p843x403&_nc_cat=1&ccb=1-7&_nc_sid=813123&_nc_ohc=gu1Q8SeVzcYAX-HyN2f&_nc_ht=scontent.fcai20-"
//     "2.fna&cb_e2o_trans=q&oh=00_AfB8ykeiMtzCoBVNdlq-i304vo4M0FpB0uyjVhQb_jXjLg&oe=652390D6";

class MealItem extends StatelessWidget {
  const MealItem({super.key, required this.meal, required this.onSelectMeal});
  //--------------------
  final Meal meal;
  final void Function(Meal meal) onSelectMeal;
  //--------------------

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 4),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 5,
      clipBehavior: Clip.hardEdge, //to force the child to clip it's edges  //!
      child: InkWell(
        onTap: () => onSelectMeal(meal),
        child: Stack(
          children: [
            InkWell(
              child: FadeInImage(
                placeholder: MemoryImage(kTransparentImage),
                image: NetworkImage(
                  meal.imageUrl,
                ),
              ),
            ),
            Positioned(
              //to make the text at bottom
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                color: Colors.black54,
                child: Column(
                  children: [
                    //-----------meal title
                    Text(
                      meal.title,
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis, //ex: text...
                      softWrap: true,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 18),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(6),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            children: [
                              const Icon(Icons.schedule),
                              Text(
                                '  ${meal.duration} min',
                                style: const TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              const Icon(Icons.work_history),
                              Text(
                                '  ${meal.complexity.name}',
                                style: const TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              const Icon(Icons.attach_money),
                              Text(
                                '  ${meal.affordability.name}',
                                style: const TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
