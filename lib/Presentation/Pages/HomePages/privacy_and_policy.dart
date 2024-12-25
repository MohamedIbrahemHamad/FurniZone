import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'ProfilePage.dart';

class PrivacyAndPolicy extends StatelessWidget{
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
          color: Color(0xff008BD9),
          ) ,
          ) ,
        backgroundColor: const Color(0xffF9F8F8),
        elevation: 0,
        title:const  Text(
          " Privacy & Policy ",
          style: TextStyle(
            color: Color(0xff008BD9),
            fontSize: 20,
          ),
        ),
      ),
      body:  Column(
        children: [
          const Expanded(
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Text(
                      "Your privacy is important to us. It is Brainstorming's policy to respect your privacy regarding any information we may collect from you across our website, and other sites we own and operate.\n\n"
                      "We only ask for personal information when we truly need it to provide a service to you. We collect it by fair and lawful means, with your knowledge and consent. We also let you know why we’re collecting it and how it will be used.\n\n"
                      "We only retain collected information for as long as necessary to provide you with your requested service. What data we store, we’ll protect within commercially acceptable means to prevent loss and theft, as well as unauthorized access, disclosure, copying, use or modification.\n\n"
                      "We don’t share any personally identifying information publicly or with third-parties, except when required to by law.",
                      style: TextStyle(
                        fontSize: 18,
                        height: 1.5,
                        fontWeight: FontWeight.w500
                      ),
                ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(40),
            alignment: Alignment.bottomCenter,
            height: 60,
            width: 350,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
               color: Color(0xff4A628A),
            ),
            child:  ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xff4A628A),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40)
                )
              ),
              child: const Center(
                child: Text(
                  " I’ve agree with this ",
                  style: TextStyle(
                    color: Color(0xffFFFFFF),
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          
        ],
      )
        
    );
  }
  
}