import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:diary/templates/other_templates.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';
import 'package:http/http.dart';
import 'dart:convert';


var area_Controller = TextEditingController();
var interface_Controller = TextEditingController();
var depth_Controller = TextEditingController();
var price_Controller = TextEditingController();
var location_Controller = TextEditingController();
var location_link_Controller = TextEditingController();
var describtion_Controller  = TextEditingController();

class form_residential extends StatefulWidget {
  const form_residential({Key? key}) : super(key: key);

  @override
  State<form_residential> createState() => _form_residentialState();
}

class _form_residentialState extends State<form_residential> {

  PlatformFile? pickedFile;

  Future uploadFile() async {
    final path = 'Diary/${pickedFile!.name}';
    final file = File(pickedFile!.path!);

    final ref = FirebaseStorage.instance.ref().child(path);
    ref.putFile(file);
  }

  Future selectFile() async {
    final result = await FilePicker.platform.pickFiles();
    if (result==null) return print("file is null");
    setState(() {
      pickedFile = result.files.first;
    });
  }

  @override
  /// main var
  String _residential_type="house";
  String _sell_rent="بيع";
  String _price_type = "الف";

  /// thse vars re helping to set values for the main vars

  bool _b_price_type = true; /// <<< true=thousand, false=million

  /// defult choice of residential_type will be the house
  bool _b_house=true;
  bool _b_departmaent=false;
  bool _b_mushtamal =false;
  bool _b_vila = false;

  bool _b_sell_rent=true; /// <<< true=sell, false=rent

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Diary_appbar_color,
          actions: [
            Padding(
              padding: EdgeInsets.only(top: 9,right: 9),
                child: Text("اضافة عقار - سكن",style: TextStyle(fontSize: 23),))
          ],
      ),

      body: SafeArea(
        child:
        SingleChildScrollView(
          child:
          Container(
            padding: EdgeInsets.all(30),
            width: other_templates.width(context),
            child:
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(":هل تود",style: TextStyle(fontSize: 23),),

                // set _sell_rent withe help of _b_sell_rent
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      child: other_templates.selsection(
                          other_templates.height(context)/13,
                          other_templates.width(context)/2.5,
                          23, "البيع", _b_sell_rent),
                      onTap: (){
                        setState(() {
                          _sell_rent="للبيع";
                          _b_sell_rent=true;
                        });
                      },
                    ),
                    GestureDetector(
                      child: other_templates.selsection(
                          other_templates.height(context)/13,
                          other_templates.width(context)/2.5,
                          23, "التاجير", !_b_sell_rent),
                      onTap: (){
                        setState(() {
                          _sell_rent="للايجار";
                          _b_sell_rent=false;
                        });
                      },
                    )
                  ],
                ),

                Text(":النوع",style: TextStyle(fontSize: 23),),

                // set _residential_type
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      child: other_templates.selsection(
                          other_templates.height(context)/13,
                          other_templates.width(context)/5,
                          23, "فيلا", _b_vila),
                      onTap: (){
                        setState(() {

                          _residential_type="فيلا";

                          _b_house=false;
                          _b_departmaent=false;
                          _b_mushtamal=false;
                          _b_vila=true;
                        });
                      },
                    ),
                    GestureDetector(
                      child: other_templates.selsection(
                          other_templates.height(context)/13,
                          other_templates.width(context)/5,
                          23, "مشتمل", _b_mushtamal),
                      onTap: (){
                        setState(() {

                          _residential_type="مشتمل";

                          _b_house=false;
                          _b_departmaent=false;
                          _b_mushtamal=true;
                          _b_vila=false;
                        });
                      },
                    ),
                    GestureDetector(
                      child: other_templates.selsection(
                          other_templates.height(context)/13,
                          other_templates.width(context)/5,
                          23, "شقة", _b_departmaent),
                      onTap: (){
                        setState(() {

                          _residential_type="شقة";

                          _b_house=false;
                          _b_departmaent=true;
                          _b_mushtamal=false;
                          _b_vila=false;
                        });
                      },
                    ),
                    GestureDetector(
                      child: other_templates.selsection(
                          other_templates.height(context)/13,
                          other_templates.width(context)/5,
                          23, "بيت", _b_house),
                      onTap: (){
                        setState(() {

                          _residential_type="بيت";

                          _b_house=true;
                          _b_departmaent=false;
                          _b_mushtamal=false;
                          _b_vila=false;
                        });
                      },
                    )
                  ],
                ),

                Text(":المساحةالكلية بالمتر المربع",style: TextStyle(fontSize: 23),),

                other_templates.Diary_TextField(area_Controller, ''),

                // interface & depth
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      height: 100,
                      width: other_templates.width(context)/2.7,
                      child:  Column(
                        crossAxisAlignment:CrossAxisAlignment.end,
                        children: [
                          Text(":الواجهة",style: TextStyle(fontSize: 23),),

                          other_templates.Diary_TextField(interface_Controller, '')

                        ],
                      ),
                    ),

                    SizedBox(width: other_templates.width(context)/17,),

                    Container(
                      height: 100,
                      width: other_templates.width(context)/2.7,
                      child:
                      Column(
                        crossAxisAlignment:CrossAxisAlignment.end,
                        children: [
                          Text(":النزال",style: TextStyle(fontSize: 23),),

                          other_templates.Diary_TextField(depth_Controller, '')

                        ],
                      ),
                    )


                  ],
                ),

                // set _price_type with help of _b_price_type
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      child: other_templates.tow_choices_bar(
                          _b_price_type, _price_type, "الف", "مليون"
                      ),
                      onTap:(){
                        setState(() {
                          _b_price_type=!_b_price_type;
                          _b_price_type? _price_type= "الف": _price_type= "مليون";
                        });
                      },
                    ),


                    Text(":السعر بالدينار العراقي",style: TextStyle(fontSize: 23),),
                  ],
                ),

                other_templates.Diary_TextField(price_Controller, ''),

                Text(":الموقع",style: TextStyle(fontSize: 23),),

               other_templates.Diary_TextField(location_Controller, ''),

                Text(":رابط الموقع",style: TextStyle(fontSize: 23),),

                other_templates.Diary_TextField(location_link_Controller, ''),

                Text(":اضافة الصورة الرئيسية",style: TextStyle(fontSize: 23),),

               Row(
                 children: [

                   if (pickedFile!= null)
                     Expanded(
                     child:
                     Container(
                       alignment: Alignment.center,
                     color: Colors.green[100],
                     child:
                     Image.file(
                         File(pickedFile!.path!),
                       fit:  BoxFit.cover,
                     ),

                     )
                     ),
                   SizedBox(width: 19,),
                   
                   ElevatedButton(
                       onPressed: uploadFile,
                       child: Row(
                         children: [
                           Text("اختيار صورة من المعرض"),
                           Icon(Icons.image)
                         ],
                       ),


                       style: ElevatedButton.styleFrom(
                           primary: Diary_button_color
                       )
                   ),

                 ],
               ),


                Text(":اضافة صور للسكن",style: TextStyle(fontSize: 23),),

                Text(":اضافة سندات ثبوت الملكية",style: TextStyle(fontSize: 23),),

                Text(":اضافة وصف السكن",style: TextStyle(fontSize: 23),),

                other_templates.Diary_TextField(describtion_Controller, ''),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: (){
                        setState(() {

                          });
                      },
                      child:
                      Text("معاينة",style: TextStyle(fontSize: 23),),
                      style: ElevatedButton.styleFrom(
                        primary: Diary_button_color
                      )
                    )
                  ],
                )
              ],
            )
          ),
        ),
      ),

    );
  }


}
