import 'package:dating_practice/Profile.dart';
import 'package:dating_practice/model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class Test extends StatefulWidget {
  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  List<Widget> imageList = [
    Image(
      image: AssetImage('assets/woman.jpg'),
      fit: BoxFit.fill,
    ),
    Image(
      image: AssetImage('assets/fashion_girl.jpg'),
      fit: BoxFit.fill,
    ),
    Image(
      image: AssetImage('assets/girl2.jpg'),
      fit: BoxFit.fill,
    ),
    Image(
      image: AssetImage('assets/girl3.jpg'),
      fit: BoxFit.fill,
    )
  ];
 List<MyModel>list=[];

  var keys;
  var values;
  MyModel myModel;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    DatabaseReference mRef=FirebaseDatabase.instance.reference().child('dating');

    return new Scaffold(
      appBar: AppBar(title:Text('Date Mate',style: TextStyle(color: Colors.red),),centerTitle: true,backgroundColor: Colors.transparent,
      elevation: 0.0,),
      body: Column(
        children: [
          Swiper(
          layout: SwiperLayout.CUSTOM,
          duration: 200,
          customLayoutOption:
          new CustomLayoutOption(startIndex: -1, stateCount: 3)
              .addRotate([10.0 / 180, 0.0, -10.0 / 180]).addTranslate([
            new Offset(0.0, 0.0),
            new Offset(0.0, 0.0),
            new Offset(0.0, 0.0)
          ]),
          itemWidth: 340.0,
          itemHeight: 398.0,
          itemBuilder: (context, index) {
            return new Container(
                color: Colors.grey,
                child:new Stack(
                  children: [new GestureDetector(
                      child: Card(child:Container(/*child: //imageList.elementAt(index),
                      Image.network(list.elementAt(index).getImageUrl),*/
                        child: Image(
                          image: AssetImage('assets/woman.jpg'),
                          fit: BoxFit.fill,
                        ),
                        width: 340,
                        height: 390,),
                        elevation: 1000,
                      ),onTap:(){Navigator.push(context, MaterialPageRoute(builder: (context)=>DatingApp()));}
                  ),
                  ],
                )
            );
          },
          itemCount: imageList.length),
           SizedBox(
             height: 20,
           ),
           Row(
             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FloatingActionButton(
                heroTag:'one',
                child: Icon(Icons.close),
                onPressed: (){
                  setState(() {
                    mRef.once().then((value) => {
                      keys=value.value.keys,
                      values=value.value,
                      for(var key in keys){
                        myModel=new MyModel(values[key]['image_url'],
                            values[key]['location'],
                            values[key]['name']
                        ),
                        list.add(myModel)
                      }
                    });
                  });


                },
              ),
              FloatingActionButton(
                heroTag: 'two',
                child: Icon(Icons.favorite),
                onPressed: (){

                },
              )
            ],
          )
        ],
      ),
    );
  }
}
