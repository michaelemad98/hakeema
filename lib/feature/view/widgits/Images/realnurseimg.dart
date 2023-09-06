import 'package:flutter/cupertino.dart';

import '../../../constant/constats.dart';

class RealNurseImg extends StatelessWidget {

  const RealNurseImg({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size, height, width;
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Container(
      margin: EdgeInsets.all(16),
      child: ClipRRect(
        // width: double.infinity,
        borderRadius: BorderRadius.circular(16.0),
        child:  FadeInImage(width:width/2 ,
            fit: BoxFit.cover,
            image: NetworkImage(
                '${imageUrl}nursereal.jpg'),
            placeholder: AssetImage(
                "assets/images/logo.png")),

      ),
    );
  }
}
