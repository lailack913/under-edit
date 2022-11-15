import 'package:flutter/material.dart';
import '../../../templates/post_templates.dart';

class my_properties extends StatefulWidget {
  const my_properties({Key? key}) : super(key: key);

  @override
  State<my_properties> createState() => _my_propertiesState();
}

class _my_propertiesState extends State<my_properties> {
  post_templates _post_templates = post_templates();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Icon(
          Icons.arrow_back_ios_new,
        ),
        backgroundColor: Colors.grey,
      ),
      body:
      SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width/1.05,
              alignment: Alignment.center,
              child: ListView.builder(
                  itemCount: 1,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, pos){
                    return
                      Center(
                        child: Column(
                          children: [

                            post_templates.post_residential(context,
                              "https://media.architecturaldigest.com/photos/57c7003fdc03716f7c8289dd/master/pass/IMG%20Worlds%20of%20Adventure%20-%201.jpg",
                              "مشتمل", "بيع",
                              "بغداد", "الدورة",'www.google.org',
                              150,10,15, 12, "مليون د.ع",
                              1, 2, 3, 4, true, false,
                              "مكتب النور للعقار", "07700000",
                              "property_describtion", true,
                            ),

                            SizedBox(height: MediaQuery.of(context).size.height/17,),

                            post_templates.post_land(context,
                              "https://media.architecturaldigest.com/photos/57c7003fdc03716f7c8289dd/master/pass/IMG%20Worlds%20of%20Adventure%20-%201.jpg",
                              "سكنية","بغداد", "العامرية", 'www.google.com',
                              30,"دونم",15,10, 120, "مليون د.ع",
                              "مكتب السلطان للعقار", "07700000",
                              "بلا بلا بلا بلا بلا بلا بلا بلا بلا بلا بلا بلا بلا بلا بلا", true,
                            ),

                            SizedBox(height: MediaQuery.of(context).size.height/17,),

                            post_templates.post_store(context,
                              "https://media.architecturaldigest.com/photos/57c7003fdc03716f7c8289dd/master/pass/IMG%20Worlds%20of%20Adventure%20-%201.jpg",
                              "متجر احذية", "بيع", "البصرة", "شارع اجزائر", 'www.google.org',
                              300,10,30, 32.0, "مليون د.ع",
                              "مكتب السلطان للعقار", "07700000",
                              "بلا بلا بلا بلا بلا بلا بلا بلا بلا بلا بلا بلا بلا بلا بلا", true, ),

                            SizedBox(height: MediaQuery.of(context).size.height/17,),

                            post_templates.post_buildings(context,
                              "https://media.architecturaldigest.com/photos/57c7003fdc03716f7c8289dd/master/pass/IMG%20Worlds%20of%20Adventure%20-%201.jpg",
                              "تجاري", "للبيع", "البصرة", "الجزائر",'www.google.com',
                              150,10,15, 12, "مليون د.ع",
                              3,
                              "مكتب السلطان للعقار", "07700000",
                              "بلا بلا بلا بلا بلا بلا بلا بلا بلا بلا بلا بلا بلا بلا بلا", true,
                            ),

                            SizedBox(height: MediaQuery.of(context).size.height/17,),


                          ],
                        )
                      );
                  }),
            )
          ],
        ),
      ),
    );;
  }
}
