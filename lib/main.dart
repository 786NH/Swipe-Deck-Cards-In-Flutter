import 'package:flutter/material.dart';
import 'package:swipe_deck/swipe_deck.dart';

const IMAGES = ["fc3", "cod", "destiny", "apex", "game_4", "ghost", "mk11", "nfs", "pubg", "mk112"];
final borderRadius = BorderRadius.circular(20.0);
void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Swipe Deck',
      home: TestPage(),
    );
  }
}
class TestPage extends StatelessWidget {
  const TestPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Swipe Deck Card In Flutter"),
      ),
      body: Center(
        child: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Center(
            child: SwipeDeck(
              aspectRatio: 9/4,
              startIndex: 0,
              emptyIndicator: 
                const Center(
                  child: Text("Nothing Here"),
                ), 
              cardSpreadInDegrees: 5, // Change the Spread of Background Cards
              onSwipeLeft: (){
                print("USER SWIPED LEFT -> GOING TO NEXT WIDGET");
              },
              onSwipeRight: (){
                print("USER SWIPED RIGHT -> GOING TO PREVIOUS WIDGET");
              },
              onChange: (index){
                print(IMAGES[index]);
              },
              widgets: IMAGES
                  .map((e) => GestureDetector(
                        onTap: () {
                          print(e);
                        },
                        child: ClipRRect(
                           borderRadius: borderRadius,
                            child: Image.asset(
                              "assets/images/$e.jpg",
                              fit: BoxFit.cover,
                            )),
                      ))
                  .toList(),
            ),
          ),
        ),
      ),
    );
  }
}