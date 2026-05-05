import 'package:flutter/material.dart';
import 'package:medical_device_tracking/animation/slide_from_right_router.dart';
import 'package:medical_device_tracking/extension/extension_on_buildcontext.dart';
import 'package:medical_device_tracking/screen/scan_qr_code/scan_qr_code_screen.dart';
import 'package:medical_device_tracking/utils/app_colors.dart';

class HomeScreenActions extends StatelessWidget {
  const HomeScreenActions({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Row(
        children: [
          Expanded(
            child: HomeActionButton(
              icon: Icons.add_circle,
              title: 'Thêm thiết bị',
              padding: context.pOnly(0.01, 0.04, 0.01, 0.01),
              onTap: () {},
            ),
          ),
          Expanded(
            child: HomeActionButton(
              icon: Icons.qr_code_scanner,
              title: 'Quét mã',
              padding: context.pOnly(0.01, 0.01, 0.01, 0.04),
              onTap: () {},
            ),
          )
        ],
      ),
    );
  }
}

class HomeActionButton extends StatelessWidget {
  const HomeActionButton({super.key,
    required this.icon,
    required this.title,
    required this.padding,
    required this.onTap,
  });

  final IconData icon;
  final String title;
  final EdgeInsets padding;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.base * 0.12,
      width: context.base * 0.4,
      margin: padding,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.mainColor,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: context.radiusMD,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(
              icon,
              color: Colors.white,
              size: context.base * 0.09,
            ),
            Text(
              title,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: context.base * 0.035
              ),
            )
          ],
        ),
      ),
    );
  }
}