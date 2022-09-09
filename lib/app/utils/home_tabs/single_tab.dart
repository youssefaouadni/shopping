import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SingleTab extends StatelessWidget {
  final String? title;
  final bool? isActive;
  final Function()? onTap;
  const SingleTab({Key? key, this.title, this.isActive, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        height: 35.h,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),

          color: isActive!
              ? Colors.black
              : Colors.white,
        ),
        child: Text(
          "$title",
          style: TextStyle(
              fontFamily: 'Inter',
              fontWeight: FontWeight.w500,
              fontSize: 12.sp,
              letterSpacing: -0.5,
              color: isActive!
          ? Colors.white
              : Colors.black,),
        ),
      ),
    );
  }
}
