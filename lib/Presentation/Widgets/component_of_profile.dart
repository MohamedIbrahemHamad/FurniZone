import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

class ComponentProfile extends StatelessWidget{
  ComponentProfile({
    required this.text1 , this.text2 ,required this.icon1,this.icon2, this.onTap ,
    required this.color , required this.icon_background_color,
    });
   final String text1;
   final String? text2;
   final IconData icon1 ;
   final IconData? icon2;
   final VoidCallback? onTap;
   final Color color;
   final Color icon_background_color;
  @override
  Widget build(BuildContext context) {
    
    return Container(
      child: Row(
          children: [
            Container(
              margin: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7),
                color: icon_background_color,
              ),
              height: 40,
              width: 40,
              child: Icon(
                icon1,
                color: color,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  text1,
                  style: TextStyle(
                  color: color,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  ),
                ),
                if (text2 != null)
                 Text(
                  text2!,
                  style: TextStyle(
                  color: color,
                  fontSize: 16,
                  fontWeight: FontWeight.w400
                  ),
                ),
              ],
            ),
           const Spacer(
             flex: 1,
            ),
            if (icon2 != null)
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: GestureDetector(
                onTap : onTap, 
                child: Icon(
                  icon2! ,
                  color: color,
                  weight: 2,
                  size: 28,
                ),
              ),
            ),
          ],
        ), 
    );
  }
  
}

class InfoComponentProfile {
   String text1;
   String? text2;
   IconData icon1 ;
   IconData? icon2;
     InfoComponentProfile({required this.text1 , this.text2 ,required this.icon1 , this.icon2});

}