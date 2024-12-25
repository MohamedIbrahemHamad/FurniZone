import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'ProfilePage.dart';

class TermsAndConditions extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading : IconButton(
           onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage()));
           } ,
         icon: const Icon(
          Icons.arrow_back_ios,
          color: Color(0xffFFCC47),
          ) ,
          ) ,
        backgroundColor: const Color(0xffF9F8F8),
        elevation: 0,
        title:  Text(
          " Terms & Conditions ",
          style: TextStyle(
            color: Color(0xffFFCC47),
            fontSize: 20,
          ),
        ),
      ),
      body:const Padding(
        padding:  EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child:  Text(
          "Please read these Terms of Service carefully before accessing or using our website. By accessing or using any part of the site, you agree to be bound by these Terms of Service. If you do not agree to all the terms and conditions of this agreement, then you may not access the website or use any services. If these Terms of Service are considered an offer, acceptance is expressly limited to these Terms of Service.\n\n"
          "Any new features or tools which are added to the current store shall also be subject to the Terms of Service. You can review the most current version of the Terms of Service at any time on this page. We reserve the right to update, change or replace any part of these Terms of Service by posting updates and/or changes to our website. It is your responsibility to check this page periodically for changes. Your continued use of or access to the website following the posting of any changes constitutes acceptance of those changes..\n\n"
          ,
          style: TextStyle(
                fontSize: 18,
                height: 1.5,
                fontWeight: FontWeight.w500
        ),
        ),
      ),
    );
  }
  
}