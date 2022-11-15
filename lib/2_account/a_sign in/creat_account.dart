import 'package:diary/templates/other_templates.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

//read it
// import 'dart:js'; ir didnt run until i stop this line so check it pls <<<<<<<<<<
import '../../dataa.dart';
import 'package:diary/1_home/home_page.dart';
import 'package:diary/2_account/b_login/login.dart';

var nameController = TextEditingController();
var phoneController = TextEditingController();
var passwordController = TextEditingController();
var password_confirmController = TextEditingController();

class creat_account extends StatefulWidget {
  @override
  State<creat_account> createState() => _creat_accountState();
}

class _creat_accountState extends State<creat_account> {

  late String _account_typeup;

  bool check = false;
  Future Add_data() async {
    var url = Uri.parse("http://localhost:4000/r");
    Map<String, String> headers = {"Content-type": "application/json"};

    String json = '{"fullname": "$nameup",'
        ' "u_phone": "$phoneup",'
        ' "password": "$passwordup",'
        ' "usertype": "$usertypeup"}';
    // make POST request
    Response response = await post(url, headers: headers, body: json);
    // check the status code for the result
    int statusCode = response.statusCode;
    // this API passes back the id of the new item added to the body
    String body1 = response.body;
    var data = jsonDecode(body1);
    print(data);
    var res = data["code"];

    if (res == null) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Icon(
            Icons.arrow_back_ios_new,
          ),
          backgroundColor: Colors.grey,
        ),
        body: SafeArea(
          child: Container(
            alignment: Alignment.topRight,
            padding: EdgeInsets.fromLTRB(70, 30, 70, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "إنشاء حساب جديد",
                  style: TextStyle(
                    fontSize: 31,
                  ),
                ),
                Text(
                  "اهلا بك",
                  style: TextStyle(
                    fontSize: 31,
                  ),
                ),
                Text(":اختر نوع الحساب",style: TextStyle(
                  fontSize: 25,
                ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 13),
                  child: Row(
                    children: [

                      GestureDetector(
                        child: type("شخص"),
                        onTap: (){
                          setState(() {
                            usertypeup="person";

                          });
                        },
                      ),

                      SizedBox(width: 5,),

                      GestureDetector(
                        child: type("تاجر"),
                        onTap: (){
                          setState(() {
                            usertypeup="merchant";

                          });
                        },
                      ),

                      SizedBox(width: 5,),

                      GestureDetector(
                        child: type("مكتب"),
                        onTap: (){
                          setState(() {
                            usertypeup="office";

                          });
                        },
                      ),

                      SizedBox(width: 5,),

                      GestureDetector(
                        child: type("شركة"),
                        onTap: (){
                          setState(() {
                            usertypeup="company";
                          });
                        },
                      )

                    ],
                  ),
                ),
                TextField(
                  controller: nameController,
                  textAlign: TextAlign.right,
                  decoration: InputDecoration(
                    labelText: 'الاسم',
                    labelStyle: TextStyle(),
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(
                  height: 17,
                ),
                TextField(
                  controller: phoneController,
                  textAlign: TextAlign.right,
                  decoration: InputDecoration(
                    labelText: 'رقم الهاتف',
                    labelStyle: TextStyle(),
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(
                  height: 17,
                ),
                TextField(
                  controller: passwordController,
                  textAlign: TextAlign.right,
                  decoration: InputDecoration(
                    labelText: 'كلمة المرور',
                    labelStyle: TextStyle(),
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(
                  height: 17,
                ),
                TextField(
                  // controller: password_confirmController,
                  textAlign: TextAlign.right,
                  decoration: InputDecoration(
                    labelText: 'تأكيد كلمة المرور',
                    labelStyle: TextStyle(),
                    border: OutlineInputBorder(),
                  ),
                ),
                Transform.translate(
                  offset: const Offset(19, 0),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: CheckboxListTile(
                      title: const Text("     الموافقة على سياسة التطبيق",
                          style: TextStyle(
                            color: Colors.black,
                          )),
                      controlAffinity: ListTileControlAffinity.trailing,
                      activeColor: Colors.white,
                      checkColor: Colors.blueGrey,
                      value: check,
                      onChanged: (value) {
                        setState(() {
                          check = value!;
                        });
                      },
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              nameup = nameController.text;
                              phoneup = phoneController.text;
                              passwordup = passwordController.text;
                              password_confirmup = password_confirmController.text;
                              account_typeup=usertypeup;
                              Add_data();
                            });
                            //getData();
                          },
                          child: Text("أنشئ حسابي"),
                        ),
                        SizedBox(
                          height: 7,
                        ),
                        Row(
                          children: [
                            Text(
                              "تسجيل الدخول",
                              style: TextStyle(
                                  fontSize: 19,
                                  decoration: TextDecoration.underline,
                                  color: Colors.blue),
                            ),
                            SizedBox(width: 7,),
                            Text(
                              "لديك حساب بالفعل؟",
                              style: TextStyle(fontSize: 19),
                            ),

                          ],
                        )
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
              ],
            ),
          ),
        ));
  }
  type(String type){
    return Container(
        height: other_templates.height(context)/15,
        width: other_templates.width(context)/6.5,
        decoration: BoxDecoration(
          border: Border.all(),
          borderRadius: BorderRadius.circular(19),
        ),
        child: Center(
          child:  Text("$type",style: TextStyle(
            fontSize: 19,
          ),),
        )
    );
  }
}
