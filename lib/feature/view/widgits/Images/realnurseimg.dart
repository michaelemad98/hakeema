import 'package:flutter/cupertino.dart';

class RealNurseImg extends StatelessWidget {
  const RealNurseImg({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16),
      child: ClipRRect(
        // width: double.infinity,
        borderRadius: BorderRadius.circular(16.0),
        child: Image.asset('assets/images/nursereal.jpg',),
      ),
    );
  }
}
