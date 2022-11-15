import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import '../../dataa.dart';
import '../../1_home/home_page.dart';
import '../a_sign in/creat_account.dart';
import 'package:diary/2_account/c_restoration/restor_verify.dart';

var phoneController = TextEditingController();

class restor_pn extends StatefulWidget {
  late final String title;
  late final String message;
  late final String note;
  restor_pn({
    required this.title,
    required this.message,
    required this.note,
  });

  @override
  State<restor_pn> createState() => _restor_pnState();
}

class _restor_pnState extends State<restor_pn> {
  var litems = [];



  Future getData() async {
    var url = Uri.parse("http://localhost:4000");
    Response response = await get(url);
    String body = response.body;

    List<dynamic> list1 = json.decode(body);
    print(list1);
    litems.clear();
    for (int i = 0; i < list1.length; i++) {
      litems.add(list1[i]["u_phone"]);
      setState(() {
        if (list1[i]["u_phone"] == u_phone) {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => restor_verify()));
        }
      });
    }

// print(litems);
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
          padding: EdgeInsets.fromLTRB(70, 70, 70, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                widget.title,
                style: TextStyle(
                  fontSize: 31,
                ),
              ),
              Text(
                widget.message,
                style: TextStyle(
                  fontSize: 17,
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
              Text(
               widget.note,
                style: TextStyle(
                  fontSize: 19,
                ),
                textAlign: TextAlign.right,
              ),
              SizedBox(
                height: 19,
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      u_phone = phoneController.text;
                    });
                    getData();
                  },
                  child: Text(
                    "التالي",
                    style: TextStyle(fontSize: 19),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
