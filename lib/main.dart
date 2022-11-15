import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diary/0_welcoming/a_splash%20screen/splash.dart';
import 'package:diary/0_welcoming/b_first%20time%20open/first_time.dart';
import 'package:diary/1_home/home_page.dart';
import 'package:diary/2_account/a_sign%20in/creat_account.dart';
import 'package:diary/2_account/b_login/login.dart';
import 'package:diary/2_account/c_restoration/restor_PN.dart';
import 'package:diary/2_account/c_restoration/restor_new_password.dart';
import 'package:diary/2_account/e_account%20details/information%20section/account_info.dart';
import 'package:diary/5_saved/saved.dart';
import 'package:diary/6_dashboard/add_property/Details.dart';
import 'package:diary/6_dashboard/add_property/form_residential.dart';
import 'package:diary/templates/view_residential.dart';
import 'package:diary/6_dashboard/payment/payment_type.dart';
import 'package:diary/6_dashboard/payment/set_subscribe.dart';
import 'package:diary/BottomNavigationBar/BottomNavigationBar.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import '4_filter/filter.dart';
import '6_dashboard/add_property/form_building.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();


  runApp( MaterialApp(home: form_residential(),debugShowCheckedModeBanner: false,));

}
