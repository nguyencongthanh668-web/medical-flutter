import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_device_tracking/cubit/report_device/report_device_cubit.dart';
import 'package:medical_device_tracking/cubit/report_device/report_device_state.dart';
import 'package:medical_device_tracking/widget/button/custom_filled_button.dart';
import 'package:medical_device_tracking/widget/snack_bar/custom_snackbar.dart';

class DetailDeviceBottomNav extends StatelessWidget {
  const DetailDeviceBottomNav({super.key,
    required this.deviceId,
  });

  final int deviceId;

  @override
  Widget build(BuildContext context) {
    return BlocListener<ReportDeviceCubit, ReportDeviceState>(

      listener: (context, state) {

        if (state.status == ReportStatus.success) {
          showCustomSnackBar(
              context,
              message: 'Báo hỏng thành công'
          );
        }

        if (state.status == ReportStatus.failure) {
          showCustomSnackBar(
            context,
            message: 'Báo hỏng thất bại',
            isError: true,
          );
        }

      },

      child: Container(
        color: Colors.white,
        child: CustomFilledButton(
          onPressed: () {
            context.read<ReportDeviceCubit>().reportDevice(deviceId: deviceId);
          },
          title: 'Thông báo sửa chữa',
        ),
      ),
    );
  }
}
