import 'package:flutter/material.dart';

class Details extends StatefulWidget {
  const Details({Key? key}) : super(key: key);

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: [
        Stack(
          children: [
            Container(
              height: 250,
              color: Colors.grey,
            ),
            Positioned(
              top: 6,
              right: 10,
              child: Container(
                  padding: EdgeInsets.only(left: 0),
                  width: 39,
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(13),
                      boxShadow: []),
                  child: Icon(
                    Icons.bookmark_border,
                    color: Colors.grey,
                    size: 30,
                  )),
            )
          ],
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(17, 13, 17, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "مليون د.ر 12",
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500),
              ),
              Text(
                "بيت - بيع",
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500),
              )
            ],
          ),
        ),

        Padding(
          padding: EdgeInsets.fromLTRB(17, 30, 17, 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Spacer(),
              Text(
                "المساحة: 125 م",
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(17, 20, 17, 50),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                height: 50,
                width: 100,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 2),
                    borderRadius: BorderRadius.all(Radius.circular(11))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("صالة"),
                    Text("2"),
                    Icon(
                      Icons.cabin,
                      size: 17,
                    )
                  ],
                ),
              ),
              Container(
                height: 50,
                width: 100,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 2),
                    borderRadius: BorderRadius.all(Radius.circular(11))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("غرف"),
                    Text("4"),
                    Icon(
                      Icons.cabin,
                      size: 17,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(17, 1.5, 17, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                height: 50,
                width: 100,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 2),
                    borderRadius: BorderRadius.all(Radius.circular(11))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("حمام"),
                    Text("4"),
                    Icon(
                      Icons.cabin,
                      size: 17,
                    )
                  ],
                ),
              ),
              Container(
                height: 50,
                width: 100,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 2),
                    borderRadius: BorderRadius.all(Radius.circular(11))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("مطبخ"),
                    Text("1"),
                    Icon(
                      Icons.cabin,
                      size: 17,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        Padding(
            padding: EdgeInsets.fromLTRB(17, 50, 17, 20),
            child: Row(
              children: [
                Spacer(),
                Text(
                  "بغداد - الدورة",
                  style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500),
                ),
                Icon(Icons.location_on_rounded)
              ],
            )),
        Padding(
            padding: EdgeInsets.fromLTRB(17, 20, 17, 80),
            child: Row(
              children: [
                Spacer(),
                Text(
                  "معلومات اخرى",
                  style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500),
                ),
              ],
            )),
        Padding(
            padding: EdgeInsets.fromLTRB(17, 10, 17, 25),
            child: Row(
              children: [
                Spacer(),
                Container(
                  height: 30,
                  width: 200,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(5)),
                ),
                SizedBox(width: 10),
                Text(
                  ":المالك",
                  style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500),
                ),
              ],
            )),
        Padding(
            padding: EdgeInsets.fromLTRB(17, 0, 17, 10),
            child: Row(
              children: [
                Spacer(),
                Container(
                  height: 30,
                  width: 200,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(5)),
                ),
                SizedBox(width: 10),
                Text(
                  ":رقم الهاتف",
                  style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500),
                ),
              ],
            )),
        Padding(
            padding: EdgeInsets.fromLTRB(17, 20, 17, 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  padding: EdgeInsets.only(left: 20),
                  height: 30,
                  width: 80,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(5)),
                  child: Text(
                    "حجز",
                    style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 20),
                  height: 30,
                  width: 80,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(5)),
                  child: Text(
                    "اتصال",
                    style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            )),
      ],
    ));
  }
}
