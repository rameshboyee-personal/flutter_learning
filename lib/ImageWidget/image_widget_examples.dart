import 'package:flutter/material.dart';
class ImageWidgetExample extends StatelessWidget {
  const ImageWidgetExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Image Widget Example"),
      ),

      // body:  Image.asset("assets/images/pk1.jpg",height: 300, width: 300,),

      body: Column(
        children: <Widget>[

          Row(
            children: <Widget>[
              Image.asset("assets/images/pk1.jpg",width: 300,height: 300,),
              Image.network("https://static.toiimg.com/photo/msid-75092220/75092220.jpg?787138",width: 300,height: 300,),
              Image.asset("assets/images/pk2.jpg",width: 300,height: 300,),
              Image.network("https://images.news18.com/ibnlive/uploads/2022/02/untitled-design-6-47.png",width: 300,height: 300,)
            ],
          ),

          Row(
            children: <Widget>[
              Image.asset("assets/images/pk3.jpg",width: 300,height: 300,),
              Image.asset("assets/images/pk4.jpg",width: 300,height: 300,),
              Image.asset("assets/images/pk5.jpg",width: 300,height: 300,),
              Image.asset("assets/images/pk6.webp",width: 300,height: 300,),
            ],
          )





        ],
      )
    );
  }
}
