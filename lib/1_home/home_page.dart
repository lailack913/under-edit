import 'package:diary/2_account/b_login/login.dart';
import 'package:diary/dataa.dart';
import 'package:flutter/material.dart';

// import packages
import 'package:http/http.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'dart:convert';
import 'package:responsive_sizer/responsive_sizer.dart';

//import dart files
import 'package:diary/templates/other_templates.dart';
import 'package:diary/1_home/Carousel.dart';
import '../2_account/e_account details/information section/account_info.dart';
import '../templates/post_templates.dart';
import '../4_filter/filter.dart';
class home_page extends StatefulWidget {
  const home_page({Key? key}) : super(key: key);

  @override
  State<home_page> createState() => _home_pageState();
}

class _home_pageState extends State<home_page> {
  post_templates _post_templates = post_templates();
  var litems = ["1","2","Third","4"];
  var sororrentitems=[];
  var typebuilditems = [];
  var floornumbitems = [];
  var kichenitems = [];
  var spaceitems = [];
  var interacetitems = [];
  var priceitems=[];
  var locationitems=[];
  Future getData() async{
    var url=Uri.parse("http://localhost:4000");
    Response response= await get(url);

    String body =response.body;

    List<dynamic> list1=json.decode(body);
    List<dynamic> list2=json.decode(body);

    print(list1);
    litems.clear();  //to not print the items in litems just print value in mySql colum(name ,phone,..)
    //items.clear();
    for (int i=0; i<list1.length; i++){
      litems.add(list1[i]["sale_or_rent"]);
      sororrentitems.add(list1[i]["type_build"]);
      typebuilditems.add(list1[i]["floor_number"]);
      floornumbitems.add(list1[i]["room_number"]);
      kichenitems.add(list1[i]["kichen"]);
      spaceitems.add(list1[i]["space"]);
      interacetitems.add(list1[i]["interace"]);
      priceitems.add(list1[i]["price"]);
      locationitems.add(list1[i]["location"]);

      setState(() {

      });
    }

    print(list1);//to print my databace in run

  }
  void initState(){
    super.initState();
    getData();
  }
  @override



  Widget build(BuildContext context) {
    final List<String> imgList = [
      'https://images.pexels.com/photos/208736/pexels-photo-208736.jpeg?auto=compress&cs=tinysrgb&w=600'
          'https://images.pexels.com/photos/208736/pexels-photo-208736.jpeg?auto=compress&cs=tinysrgb&w=600'
          'https://images.pexels.com/photos/208736/pexels-photo-208736.jpeg?auto=compress&cs=tinysrgb&w=600'
    ];


    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  padding: EdgeInsets.fromLTRB(1.w, 7.w, 3.w, 3.w),
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.shade50,
                            offset: Offset(0,9.w),
                            blurRadius: 6,
                            spreadRadius: 3
                        )
                      ]
                  ),

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: Icon(Icons.account_circle_outlined, size: 27.sp, color: main_color, ),
                        onPressed: (){
                          Navigator.of(context).
                          push(MaterialPageRoute(builder: (context) =>  Login_state ?  account_info() : login(),));
                        },
                      ),

                      IconButton(
                          icon: Icon(CupertinoIcons.line_horizontal_3_decrease,size: 27.sp, color: main_color,),
                          onPressed: (){

                          },
                      )
                    ],
                  )
              ),

              Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.all(20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 13.w,
                      height: 6.h,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all()
                      ),
                      child:  Icon(Icons.search),
                    ),

                    SizedBox(width: 3.w,),

                    Expanded(
                        child: SizedBox(
                            height: 6.h,
                            child:  Directionality(
                              textDirection: TextDirection.rtl,
                              child: TextFormField(
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.fromLTRB(2.w, 1.h, 2.w, 2.h),
                                  filled: false,
                                  border: InputBorder.none,
                                  hintText: "بحث عن ",
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10)
                                  )
                              ),
                            ),)
                        )),
                  ],
                ),
              ),

              CarouselWithDotsPage(imgList: imgList),

              SizedBox(height: 1.h,),

              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 11, 23, 11),
                    child: Text(
                      "المعروض",
                      style: TextStyle(
                        color: Colors.teal,
                        fontWeight: FontWeight.bold,
                        fontSize: 21.sp,
                      ),
                    ),
                  ),
                ],
              ),

              Container(
                width: 95.w,
                child: ListView.builder(
                    itemCount: 5,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: ( context, pos){
                      return
                        Column(
                          children: [

                            post_templates.post_residential(context,
                              'https://images.pexels.com/photos/208736/pexels-photo-208736.jpeg?auto=compress&cs=tinysrgb&w=600',
                                "مشتمل", "بيع",
                                "بغداد", "الدورة",'www.google.org',
                                150,10,15, 12, "مليون د.ع",
                                1, 2, 3, 4, true, false,
                                "مكتب النور للعقار", "07700000",
                                "property_describtion", true,
                              ),

                            SizedBox(height: MediaQuery.of(context).size.height/17,),

                            post_templates.post_land(context,
                              'https://images.pexels.com/photos/208736/pexels-photo-208736.jpeg?auto=compress&cs=tinysrgb&w=600',
                              "سكنية","بغداد", "العامرية", 'www.google.com',
                               30,"دونم",15,10, 120, "مليون د.ع",
                              "مكتب السلطان للعقار", "07700000",
                              "بلا بلا بلا بلا بلا بلا بلا بلا بلا بلا بلا بلا بلا بلا بلا", true,
                            ),

                            SizedBox(height: MediaQuery.of(context).size.height/17,),

                            post_templates.post_store(context,
                              'https://images.pexels.com/photos/208736/pexels-photo-208736.jpeg?auto=compress&cs=tinysrgb&w=600',
                                "بيع", "البصرة", "شارع اجزائر", 'www.google.org',
                                "300","10","30", "32.0", "مليون د.ع",
                                "مكتب السلطان للعقار", "07700000",
                                "بلا بلا بلا بلا بلا بلا بلا بلا بلا بلا بلا بلا بلا بلا بلا", true, ),

                            SizedBox(height: MediaQuery.of(context).size.height/17,),

                            post_templates.post_buildings(context,
                              'https://images.pexels.com/photos/208736/pexels-photo-208736.jpeg?auto=compress&cs=tinysrgb&w=600',
                                "تجاري", "للبيع", "البصرة", "الجزائر",'www.google.com',
                                150,10,15, 12, "مليون د.ع",
                                3,
                                "مكتب السلطان للعقار", "07700000",
                                "بلا بلا بلا بلا بلا بلا بلا بلا بلا بلا بلا بلا بلا بلا بلا", true,
                            ),

                            SizedBox(height: MediaQuery.of(context).size.height/17,),


                          ],
                        );
                    }),
              ),
            ],
          ),
        ),
      )
    );
  }
}
