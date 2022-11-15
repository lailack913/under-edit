import 'package:flutter/material.dart';

class restor_new_password extends StatefulWidget {
  const restor_new_password({Key? key}) : super(key: key);

  @override
  State<restor_new_password> createState() => _restor_new_passwordState();
}

class _restor_new_passwordState extends State<restor_new_password> {
  bool check = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Icon(Icons.arrow_back_ios_new, ) ,
          backgroundColor: Colors.grey,
        ),

        body:
        SafeArea(
          child:
          Container(
            alignment: Alignment.topRight,
            padding: EdgeInsets.fromLTRB(70, 70, 70, 0),
            child:
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text("كلمة مرور جديدة",
                  style: TextStyle( fontSize: 31,  ),) ,
                Text("يرجى تعيين كلمة مرور جديدة",
                  style: TextStyle( fontSize: 19,),) ,

                SizedBox(height: 17,),

                TextField(
                  textAlign: TextAlign.right,
                  decoration: InputDecoration(
                    labelText: 'كلمة المرور الجديدة',
                    labelStyle: TextStyle(

                    ),
                    border: OutlineInputBorder(
                    ),
                  ),
                ),

                SizedBox(height: 17,),

                TextField(
                  textAlign: TextAlign.right,
                  decoration: InputDecoration(
                    labelText: 'تأكيد كلمة المرور الجديدة',
                    labelStyle: TextStyle(

                    ),
                    border: OutlineInputBorder(
                    ),
                  ),
                ),

                SizedBox(height: 19,),

                Center(
                  child:
                  ElevatedButton(
                    onPressed: () {
                    },
                    child: Text("حفظ"),
                  ) ,

                )
              ],
            ),
          ),
        )
    );
  }
}
