import 'package:flutter/material.dart';
import 'package:hakeema/feature/view/widgits/Textview/textview.dart';

import '../../../constant/constats.dart';
class reservationContainer extends StatelessWidget {
  String ? contractorType;
  String? needsCare;
  String? careServices;
  String? serviceTime;
  String? specialInstructions;
  String? code;
  Widget? widget;

  reservationContainer({Key? key,this.contractorType,this.needsCare,this.careServices,this.serviceTime,this.specialInstructions,this.code,this.widget}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Stack(
      children: [
        Container(
          margin: EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.cyan.shade900.withOpacity(0.5),
                offset: Offset(0,3),
                spreadRadius: 5,
                blurRadius: 7,
              )
            ],
          ),
          child: Row(

            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child:
                  ClipRRect(

                  borderRadius: BorderRadius.circular(150),
                    child: FadeInImage(
                        width: 80,
                        // height: 80,
                        image: NetworkImage(
                            '${imageUrl}nursereal.jpg'),
                        placeholder: AssetImage(
                            "assets/images/logo.png")),
                  )
                // CircleAvatar(
                //   radius: 45,
                //   backgroundImage:AssetImage('assets/images/nursereal.jpg'),
                // ),
              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DefaultText(txt: '${code}',fontSize: 20 ,color: Colors.cyan.shade500,),
                    DefaultText(txt: '${contractorType}',fontSize: 30,),
                    DefaultText(txt: '${needsCare}',fontSize: 12,color: Colors.cyan),
                    DefaultText(txt: '${careServices}',fontSize: 12,color: Colors.cyan),
                    DefaultText(txt: '${specialInstructions}',fontSize: 12,color: Colors.cyan),
                    DefaultText(txt: '${serviceTime}',fontSize: 12,color: Colors.grey),

                  ],
                ),
              )
            ],
          ),
        ),
        Positioned(
            top: 20,
            right: 20,
            child: widget!)
      ],
    );
  }
}
