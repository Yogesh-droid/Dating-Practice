import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Data2Class extends StatefulWidget {
  @override
  _Data2ClassState createState() => _Data2ClassState();
}

class _Data2ClassState extends State<Data2Class> {
  List<Widget>imageList=[Image(image: AssetImage('assets/affection.png'),),
    Image(image: AssetImage('assets/woman.jpg'),fit: BoxFit.fill,),
    Image(image: AssetImage('assets/fashion_girl.jpg'),fit: BoxFit.fill,),
    Image(image: AssetImage('assets/girl2.jpg'),fit: BoxFit.fill,),
    Image(image: AssetImage('assets/girl3.jpg'),fit: BoxFit.fill,)];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.all(0.0),
        child: Container(
            child: new Stack(
          children: [
            CarouselSlider(
              options: CarouselOptions(height: 600.0,enlargeCenterPage: true,viewportFraction: 0.8,),
              items: [1,2,3,4].map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                        width: MediaQuery.of(context).size.width, 
                        margin: EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(
                            color: Colors.amber
                        ),
                        child: imageList.elementAt(i)
                    );
                  },
                );
              }).toList(),
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '2.5 km',
                      style: TextStyle(color: Colors.yellow),
                    ),
                    Text(
                      'Rachel',
                      style: TextStyle(
                          color: Colors.yellow,
                          fontSize: 30,
                          fontStyle: FontStyle.italic),
                    ),
                    Icon(
                      Icons.chat,
                      color: Colors.yellow,
                    )
                  ],
                ),
                SizedBox(
                  height: 440.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FloatingActionButton(
                      onPressed: () {},
                      child: Icon(Icons.close),
                      splashColor: Colors.red,
                    ),  
                    FloatingActionButton(
                      onPressed: () {},
                      child: Icon(Icons.add_circle_outline),
                      splashColor: Colors.red,
                    ),
                    FloatingActionButton(
                      onPressed: () {},
                      child: Icon(Icons.favorite_border),
                      splashColor: Colors.yellow,
                    ),
                  ],
                )
              ],
            ),
          ],
        )),
      ),
    );
  }
}
