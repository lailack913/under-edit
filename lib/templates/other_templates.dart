import 'package:flutter/material.dart';

Color Diary_appbar_color= Colors.green;
Color Diary_button_color= Colors.green;



class other_templates{

  static height(var context){
    var height=MediaQuery.of(context).size.height;
    return height;
  }
  static width(var context){
    var width=MediaQuery.of(context).size.width;
    return width;
  }

  /// for payment type
  static choice_title_script( double height, double width,
      String title, String script,
      double title_size, double script_size ){
    return Container(
      height: height, width: width,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey, width: 3)
      ),

      padding: EdgeInsets.all(11),

      child: Column(

        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text("$title",style: TextStyle(fontSize: title_size),),
          Text("$script",
            style: TextStyle(fontSize: script_size), textAlign: TextAlign.right,)

        ],
      ),
    );
  }


  static property_choices( double height, double width,
      String title, String script,
      double title_size, double script_size ){
    return Container(
      height: height, width: width,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey, width: 3),
          borderRadius: BorderRadius.circular(19)
      ),

      margin: EdgeInsets.only(top: 11),

      child: Column(

        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("$title",style: TextStyle(fontSize: title_size),),
          Text("$script",
            style: TextStyle(fontSize: script_size), textAlign: TextAlign.right,)

        ],
      ),
    );
  }
  static selsection(double height, double width, double fs,
      String type, bool isPressed,
      )
  {
    return
      Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(17),
            border: Border.all(color: (isPressed == true ) ? Colors.green : Colors.grey, width: 3),
          ),
          child:
          Center(
            child:
            Text("$type",  style: TextStyle(
              fontSize: fs , color: (isPressed == true ) ? Colors.green : Colors.grey,
            ),),
          )
      );
  }

  static tow_choices_bar(bool detector, var detected,
      String choice1, String choice2){
    return  Container(
      height: 35, width: 110,
      decoration: BoxDecoration(
        border: Border.all(),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
              width: 53,
              color: !detector ? Colors.green.shade200: Colors.white,
              alignment: Alignment.center,
              child: Text(choice2,style: TextStyle(fontSize: 19),)),
          Container(height: 25, width: 3,color: Colors.grey,),
          Container(
              width: 51,
              color: detector ? Colors.green.shade200: Colors.white,
              alignment: Alignment.center,
              child:
              Text(choice1,style: TextStyle(fontSize: 19),)
          ),
        ],
      ),
    );

  }

  // textfield
  static Diary_TextField(var controller,String lable){
    return TextField(
        controller: controller,
        textAlign: TextAlign.right,
        decoration: InputDecoration(
        labelText: lable,
        labelStyle: TextStyle(),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.green, width: 2.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey, width: 2.0),
          ),
    )
    );
  }
}