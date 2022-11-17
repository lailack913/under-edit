import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:diary/templates/other_templates.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:http/http.dart';
import 'dart:convert';

var area_Controller = TextEditingController();
var interface_Controller = TextEditingController();
var depth_Controller = TextEditingController();
var price_Controller = TextEditingController();
var city_Controller = TextEditingController();
var district_Controller = TextEditingController();
var location_link_Controller = TextEditingController();
var describtion_Controller  = TextEditingController();



class form_land extends StatefulWidget {
  const form_land({Key? key}) : super(key: key);

  @override
  State<form_land> createState() => _form_landState();
}

class _form_landState extends State<form_land> {
  /// main var
  String _land_type="سكنية";
  String _sell_rent="بيع";
  String _price_type = "الف";
  String _area_type = "م²";
  String _city="";
  String _district="";

  /// thse vars re helping to set values for the main vars

  bool _b_price_type = true; /// <<< true=thousand, false=million
  bool _b_area_type = true; /// <<< true=m

  /// defult choice of _land_type will be the house
  bool _b_residential=true;
  bool _b_agricultural=false;
  bool _b_sell_rent=true; /// <<< true=sell, false=rent

  /// photo vars
  PlatformFile? mainImg;
  PlatformFile? proprtyImg;
  PlatformFile? title_deed;


  /// photo upload functions
  ///
  /// file
  Future proprtyImg_selector() async {
    final result = await FilePicker.platform.pickFiles();
    if (result==null) return print("file is null");
    setState(() {
      proprtyImg = result.files.first;
    });
  }
  Future proprtyImg_uploader() async {
    final path = 'Diary/${proprtyImg!.name}';
    final file = File(proprtyImg!.path!);

    final ref = FirebaseStorage.instance.ref().child(path);
    ref.putFile(file);
    print("file uploaded");
  }
  ///
  /// for main img select then upload
  Future mainImg_selector() async {
    final result = await FilePicker.platform.pickFiles();
    if (result==null) return print("file is null");
    setState(() {
      mainImg = result.files.first;
    });
  }
  Future mainImg_uploader() async {
    final path = 'Diary/${mainImg!.name}';
    final file = File(mainImg!.path!);

    final ref = FirebaseStorage.instance.ref().child(path);
    ref.putFile(file);
    print("mainImg  uploaded");
  }
  ///
  /// for main img select then upload

  Future title_deed_selector() async {
    final result = await FilePicker.platform.pickFiles();
    if (result==null) return print("file is null");
    setState(() {
      title_deed = result.files.first;
    });
  }
  Future title_deed_uploader() async {
    final path = 'Diary/${mainImg!.name}';
    final file = File(mainImg!.path!);

    final ref = FirebaseStorage.instance.ref().child(path);
    ref.putFile(file);
    print("mainImg  uploaded");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Diary_appbar_color,

        actions: [
          Padding(
              padding: EdgeInsets.only(top: 9,right: 9),
              child: Text("اضافة عقار - ارض",style: TextStyle(fontSize: 20.sp),))
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

                  // set _sell_rent withe help of _b_sell_rent
                  Text(":هل تود",style: TextStyle(fontSize: 23.sp),),
                  SizedBox(height: 0.5.h,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        child: other_templates.selsection(
                            other_templates.height(context)/13,
                            other_templates.width(context)/2.5,
                            23.sp, "البيع", _b_sell_rent),
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
                            23.sp, "التاجير", !_b_sell_rent),
                        onTap: (){
                          setState(() {
                            _sell_rent="للايجار";
                            _b_sell_rent=false;
                          });
                        },
                      )
                    ],
                  ),
                  SizedBox(height: 1.h,),



                  // set _lnad_type
                  Text(":النوع",style: TextStyle(fontSize: 23.sp),),
                  SizedBox(height: 0.5.h,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        child: other_templates.selsection(
                            8.h,
                            37.w,
                            23.sp, "زراعية", _b_agricultural),
                        onTap: (){
                          setState(() {

                            _land_type="زراعية";
                            _b_residential=false;
                            _b_agricultural=true;

                          });
                        },
                      ),
                      GestureDetector(
                        child: other_templates.selsection(
                            8.h,
                            37.w,
                            21.sp, "سكنية", _b_residential),
                        onTap: (){
                          setState(() {

                            _land_type="سكنية";
                            _b_residential=true;
                            _b_agricultural=false;



                          });
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 3.h,),


                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        child: other_templates.tow_choices_bar(
                            _b_area_type, _area_type, "م²", "دونم"
                        ),
                        onTap:(){
                          setState(() {
                            _b_area_type=!_b_area_type;
                            _b_area_type? _area_type= "م²": _area_type= "دونم";
                          });
                        },
                      ),
                      Text(":المساحةالكلية ",style: TextStyle(fontSize: 21.sp),),
                    ],
                  ),
                  other_templates.Diary_TextField(area_Controller, ''),
                  SizedBox(height: 1.h,),



                  // interface & depth
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        height: 27.w,
                        width: 37.w,
                        child:  Column(
                          crossAxisAlignment:CrossAxisAlignment.end,
                          children: [
                            Text(":الواجهة",style: TextStyle(fontSize: 21.sp),),
                            other_templates.Diary_TextField(interface_Controller, '')
                          ],
                        ),
                      ),

                      SizedBox(width: 3.w,),

                      Container(
                        height: 27.w,
                        width: 37.w,
                        child:
                        Column(
                          crossAxisAlignment:CrossAxisAlignment.end,
                          children: [
                            Text(":النزال",style: TextStyle(fontSize: 21.sp),),

                            other_templates.Diary_TextField(depth_Controller, '')

                          ],
                        ),
                      )
                    ],
                  ),

                  SizedBox(height: 2.h,),



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
                  SizedBox(height: 0.7.h,),
                  other_templates.Diary_TextField(price_Controller, ''),


                  SizedBox(height: 1.h,),

                  // set location by city & distract & location link
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        height: 27.w,
                        width: 37.w,
                        child:  Column(
                          crossAxisAlignment:CrossAxisAlignment.end,
                          children: [
                            Text("المنطقة",style: TextStyle(fontSize: 21.sp),),
                            other_templates.Diary_TextField(interface_Controller, '')

                          ],
                        ),
                      ),

                      SizedBox(width: 3.w,),

                      Container(
                        height: 27.w,
                        width: 37.w,
                        child:
                        Column(
                          crossAxisAlignment:CrossAxisAlignment.end,
                          children: [
                            Text(":المدينة",style: TextStyle(fontSize: 21.sp),),
                            other_templates.Diary_TextField(depth_Controller, '')

                          ],
                        ),
                      )
                    ],
                  ),
                  Text(":رابط الموقع",style: TextStyle(fontSize: 21.sp),),
                  other_templates.Diary_TextField(location_link_Controller, ''),


                  SizedBox(height: 3.h,),

                  // select pictures
                  Text(":اضافة الصورة الرئيسية",style: TextStyle(fontSize: 19),),
                  Container(
                    width: 50.w,
                    child: ElevatedButton(
                        onPressed: mainImg_selector,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(mainImg!= null? "تم اختيار الصورة":"اختيار صورة من المعرض",),
                            Icon(Icons.image)
                          ],
                        ),
                        style: ElevatedButton.styleFrom(
                            primary: mainImg!= null? Colors.teal.shade200 : Diary_button_color
                        )
                    ),
                  ),


                  SizedBox(height: 1.h,),


                  Text(":اضافة صور للسكن",style: TextStyle(fontSize: 23),),
                  Container(
                    width: 50.w,
                    child: ElevatedButton(
                        onPressed: proprtyImg_selector,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(proprtyImg!= null? "تم اختيار الصورة":"اختيار صورة من المعرض",),
                            Icon(Icons.image)
                          ],
                        ),
                        style: ElevatedButton.styleFrom(
                            primary: proprtyImg!= null? Colors.teal.shade200 : Diary_button_color
                        )
                    ),
                  ),


                  SizedBox(height: 1.h,),


                  Text(":اضافة سندات ثبوت الملكية",style: TextStyle(fontSize: 23),),
                  Container(
                    width: 50.w,
                    child: ElevatedButton(
                        onPressed: title_deed_selector,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(title_deed!= null? "تم اختيار الصورة":"اختيار صورة من المعرض",),
                            Icon(Icons.image)
                          ],
                        ),
                        style: ElevatedButton.styleFrom(
                            primary: title_deed!= null? Colors.teal.shade200 : Diary_button_color
                        )
                    ),
                  ),

                  SizedBox(height: 1.h,),

                  //set description
                  Text(
                    ":اضافة وصف السكن",
                    style: TextStyle(fontSize: 23),
                  ),
                TextField(
                controller: describtion_Controller,
                textAlign: TextAlign.right,
                keyboardType: TextInputType.multiline,
                minLines: 1,
                maxLines: 5,
                decoration: InputDecoration(
                  labelText: "",
                  labelStyle: TextStyle(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.teal.shade300, width: 2.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 2.0),
                  ),
                )
            ),

                  SizedBox(height: 3.h,),


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
                  ),

                  SizedBox(height: 1.h,),

                ],
              )
          ),
        ),
      ),

    );
  }

}
