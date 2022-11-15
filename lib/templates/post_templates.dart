import 'package:diary/templates/other_templates.dart';
import 'package:diary/templates/view_building.dart';
import 'package:diary/templates/view_land.dart';
import 'package:diary/templates/view_residential.dart';
import 'package:diary/templates/view_store.dart';
import 'package:flutter/material.dart';

 class post_templates   {
// make a function to build the posts of residential

   static post_residential(var context,String main_img,
       String residential_type, String sell_rent,
       String city,String district, String location_link,
       int area, double interface, double depth,
       double price, String price_type,
       int room,int hall, int kitchen,int bathroom,
       bool garden, bool carage,
       String owner, String owner_phone,
       String property_describtion,
       bool property_state,
       )
   {
     return  GestureDetector(
       child: Container(
         height: other_templates.height(context)/2.9,
         decoration: BoxDecoration(
             border: Border.all(color: Colors.grey, width: 2),
             borderRadius: BorderRadius.all(Radius.circular(19))
         ),
         child: Column(
           children: [
             Stack(
               children: [
                 Container(
                     height: other_templates.height(context)/5.3,
                     decoration: BoxDecoration(
                         color: Colors.grey,
                         image: DecorationImage(
                           image: NetworkImage("$main_img",),
                           fit: BoxFit.cover,
                         ),
                         borderRadius: BorderRadius.vertical(top: Radius.circular(17))
                     )
                 ),
                 Positioned(
                   top: 6,
                   right: 10,
                   child: Container(
                       padding: EdgeInsets.only(left: 0),
                       width: 39, height: 50,
                       decoration: BoxDecoration(
                           color: Colors.white.withOpacity(0.5),
                           borderRadius: BorderRadius.circular(13),
                           boxShadow: [
                           ]
                       ),
                       child:
                       Icon( Icons.bookmark_border, color: Colors.grey, size: 30,)
                   ),
                 )
               ],
             ),
             Padding(padding: EdgeInsets.fromLTRB(17, 13, 17, 0),
               child:
               Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   Text("المساحة:$area م", style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500),),
                   Text("$residential_type-$sell_rent", style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500),)
                 ],
               ),
             ),
             Padding(padding: EdgeInsets.fromLTRB(17, 1, 17, 0),
               child:
               Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   Text("السعر: $price $price_type", style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500),),
                   Text("$city-$district", style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500),),
                 ],
               ),
             ),
             Padding(padding: EdgeInsets.fromLTRB(17, 1.5, 17, 0),
               child:
               Row(
                 mainAxisAlignment: MainAxisAlignment.spaceAround,
                 children: [
                   Icon(Icons.arrow_back_ios_new),
                   Text("المزيد ", style: TextStyle(fontSize: 21.3, fontWeight: FontWeight.w500),),
                   Container(
                     height: 37, width: 65,
                     decoration: BoxDecoration(
                         border: Border.all(color: Colors.grey, width: 2),
                         borderRadius: BorderRadius.all(Radius.circular(11))
                     ),
                     child: Row(
                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                       children: [
                         Text("حمام"),
                         Text("$bathroom"),
                         Icon(Icons.cabin, size: 17,)
                       ],
                     ),
                   ),
                   Container(
                     height: 37, width: 65,
                     decoration: BoxDecoration(
                         border: Border.all(color: Colors.grey, width: 2),
                         borderRadius: BorderRadius.all(Radius.circular(11))
                     ),
                     child: Row(
                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                       children: [
                         Text("مطبخ"),
                         Text("$kitchen"),
                         Icon(Icons.cabin, size: 17,)
                       ],
                     ),
                   ),
                   Container(
                     height: 37, width: 65,
                     decoration: BoxDecoration(
                         border: Border.all(color: Colors.grey, width: 2),
                         borderRadius: BorderRadius.all(Radius.circular(11))
                     ),
                     child: Row(
                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                       children: [
                         Text("صالة"),
                         Text("$hall"),
                         Icon(Icons.cabin, size: 17,)
                       ],
                     ),
                   ),
                   Container(
                     height: 37, width: 65,
                     decoration: BoxDecoration(
                         border: Border.all(color: Colors.grey, width: 2),
                         borderRadius: BorderRadius.all(Radius.circular(11))
                     ),
                     child: Row(
                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                       children: [
                         Text("غرف"),
                         Text("$room"),
                         Icon(Icons.cabin, size: 17,)
                       ],
                     ),
                   ),
                 ],
               ),
             )
           ],
         ),
       ),
       onTap: (){
         Navigator.of(context).
         push(MaterialPageRoute(builder: (context) => view_residetial(
             residential_type2: residential_type,
             sell_rent2: sell_rent,
             city2: city,
             district2: district,
             area2: area,
             interface2: interface,
             depth2: depth,
             price2: price,
             price_type2: price_type,
             room2: room,
             hall2: hall,
             kitchen2: kitchen,
             bathroom2: bathroom,
             garden2: garden, carage2: carage,
             owner2: owner, owner_phone2: owner_phone,
             property_describtion2: property_describtion,
             property_state2: property_state,
             location_link2: location_link,
         )));
       },
     );


   }

   // make a function to build the posts of store

   static post_store(var context,String main_img,
       String store_type, String sell_rent,
       String city,String district, String location_link,
       int area, double interface, double depth,
       double price,String price_type,
       String owner, String owner_phone, String property_describtion,
       bool property_state,
       )
   {
     return GestureDetector(
         child: Container(
           height: other_templates.height(context)/2.9,
           decoration: BoxDecoration(
               border: Border.all(color: Colors.grey, width: 2),
               borderRadius: BorderRadius.all(Radius.circular(19))
           ),
           child: Column(
             children: [
               Stack(
                 children: [
                   Container(
                       height: other_templates.height(context)/5.3,
                       decoration: BoxDecoration(
                           color: Colors.grey,
                           image: DecorationImage(
                             image: NetworkImage("$main_img",),
                             fit: BoxFit.cover,
                           ),
                           borderRadius: BorderRadius.vertical(top: Radius.circular(17))
                       )
                   ),
                   Positioned(
                     top: 6,
                     right: 10,
                     child: Container(
                         padding: EdgeInsets.only(left: 0),
                         width: 39, height: 50,
                         decoration: BoxDecoration(
                             color: Colors.white.withOpacity(0.5),
                             borderRadius: BorderRadius.circular(13),
                             boxShadow: [
                             ]
                         ),
                         child:
                         Icon( Icons.bookmark_border, color: Colors.grey, size: 30,)
                     ),
                   )
                 ],
               ),
               Padding(padding: EdgeInsets.fromLTRB(17, 13, 17, 0),
                 child:
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     Text("المساحة:$area م", style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500),),
                     Text("$store_type-$sell_rent", style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500),)
                   ],
                 ),
               ),
               Padding(padding: EdgeInsets.fromLTRB(17, 1, 17, 0),
                 child:
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     Text("السعر: $price $price_type", style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500),),
                     Text("$city-$district", style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500),),
                   ],
                 ),
               ),
               Padding(padding: EdgeInsets.fromLTRB(17, 1.5, 17, 0),
                 child:
                 Row(
                   children: [
                     Icon(Icons.arrow_back_ios_new),
                     Text("المزيد ", style: TextStyle(fontSize: 21.3, fontWeight: FontWeight.w500),),
                   ],
                 ),
               )


             ],
           ),
         ),
         onTap:(){
           Navigator.of(context).
           push(MaterialPageRoute(builder: (context) => view_store(
             store_type2: store_type,
             sell_rent2: sell_rent,
             city2: city, district2: district,
             area2: area, interface2: interface, depth2: depth,
             location_link2: location_link,
             price2: price, price_type2: price_type,
             owner2: owner, owner_phone2: owner_phone,
             property_describtion2: property_describtion,
             property_state2: property_state,
           )
           )
           );
         }
     );

   }


   // make a function to build the posts of land
  static post_land(var context, String main_img,
      String land_type, String city, String district, String location_link,
      int area, String area_type, double interface, double depth,
      double price, String price_type,
      String owner, String owner_phone, String property_describtion,
      bool property_state,
      )
  {

    return GestureDetector(
      child: Container(
        height: other_templates.height(context)/2.9,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey, width: 2),
            borderRadius: BorderRadius.all(Radius.circular(19))
        ),
        child: Column(
          children: [
            // img
            Stack(
              children: [
                Container(
                    height: other_templates.height(context)/5.3,
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        image: DecorationImage(
                          image: NetworkImage("$main_img",),
                          //  image: NetworkImage("https://media.architecturaldigest.com/photos/57c7003fdc03716f7c8289dd/master/pass/IMG%20Worlds%20of%20Adventure%20-%201.jpg",),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.vertical(top: Radius.circular(17))
                    )
                ),
                Positioned(
                  top: 6,
                  right: 10,
                  child: Container(
                      padding: EdgeInsets.only(left: 0),
                      width: 39, height: 50,
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(13),
                          boxShadow: [
                          ]
                      ),
                      child:
                      Icon( Icons.bookmark_border, color: Colors.grey, size: 30,)
                  ),
                )
              ],
            ),

            // land type & area
            Padding(padding: EdgeInsets.fromLTRB(17, 13, 17, 0),
              child:
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("المساحة:$area م", style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500),),
                  Text("ارض-$land_type", style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500),)
                ],
              ),
            ),
            Padding(padding: EdgeInsets.fromLTRB(17, 1, 17, 0),
              child:
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("السعر: $price $price_type", style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500),),
                  Text("$city-$district", style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500),),
                ],
              ),
            ),
            Padding(padding: EdgeInsets.fromLTRB(17, 1.5, 17, 0),
              child:
              Row(
                children: [
                  Icon(Icons.arrow_back_ios_new),
                  Text("المزيد ", style: TextStyle(fontSize: 21.3, fontWeight: FontWeight.w500),),
                ],
              ),
            )
          ],
        ),
      ),
      onTap: (){
        Navigator.of(context).
        push(MaterialPageRoute(builder: (context) =>  view_land(
            land_type2: land_type,
            city2: city,
            district2: district,
            location_link2: location_link,
            area2: area,
            interface2: interface,
            depth2: depth,
            area_type2: area_type,
            price2: price,
            price_type2: price_type,
            owner2: owner,
            owner_phone2: owner_phone,
            property_describtion2: property_describtion,
            property_state2: property_state
         )
         )
        );
      },
    );
  }

// make a function to build the posts of buildings

  static post_buildings(var context, String main_img,
      String building_type, String sell_rent,
      String city,String district, String location_link,
      int area, double interface, double depth,
      double price, String price_type,
      int floors,
      String owner, String owner_phone,
      String property_describtion,
      bool property_state,
      )
  {
    return GestureDetector(
      child: Container(
        height:  other_templates.height(context)/2.9,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey, width: 2),
            borderRadius: BorderRadius.all(Radius.circular(19))
        ),
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                    height: other_templates.height(context)/5.3,
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        image: DecorationImage(
                          image: NetworkImage("https://media.architecturaldigest.com/photos/57c7003fdc03716f7c8289dd/master/pass/IMG%20Worlds%20of%20Adventure%20-%201.jpg",),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.vertical(top: Radius.circular(17))
                    )
                ),
                Positioned(
                  top: 6,
                  right: 10,
                  child: Container(
                      padding: EdgeInsets.only(left: 0),
                      width: 39, height: 50,
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(13),
                          boxShadow: [
                          ]
                      ),
                      child:
                      Icon( Icons.bookmark_border, color: Colors.grey, size: 30,)
                  ),
                )
              ],
            ),
            Padding(padding: EdgeInsets.fromLTRB(17, 13, 17, 0),
              child:
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("المساحة:$area م", style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500),),
                  Text("مبنى-$building_type-$sell_rent", style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500),)
                ],
              ),
            ),
            Padding(padding: EdgeInsets.fromLTRB(17, 1, 17, 0),
              child:
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("السعر: $price $price_type", style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500),),
                  Text("$city-$district", style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500),),
                ],
              ),
            ),
            Padding(padding: EdgeInsets.fromLTRB(17, 1.5, 17, 0),
              child:
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.arrow_back_ios_new),
                      Text("المزيد ", style: TextStyle(fontSize: 21.3, fontWeight: FontWeight.w500),),
                    ],
                  ),
                  Container(
                    height: 37, width: 65,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 2),
                        borderRadius: BorderRadius.all(Radius.circular(11))
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text("طابق"),
                        Text("$floors"),
                        Icon(Icons.cabin, size: 17,)
                      ],
                    ),
                  ),
                ],
              ),
            )


          ],
        ),
      ),
      onTap: (){
        Navigator.of(context).
        push(MaterialPageRoute(builder: (context) =>   view_building(
            building_type2: building_type,
            sell_rent2: sell_rent,
            city2: city, district2: district, location_link2: location_link,
            area2: area, interface2: interface, depth2: depth,
            price2: price, price_type2: price_type,
            floors2: floors,
            owner2: owner, owner_phone2: owner_phone,
            property_describtion2: property_describtion,
            property_state2: property_state)
          )
        );
      },
    );
  }
}
