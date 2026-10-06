import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_device_tracking/cubit/detail_device/detail_device_cubit.dart';
import 'package:medical_device_tracking/cubit/detail_device/detail_device_state.dart';
import 'package:medical_device_tracking/extension/extension_on_buildcontext.dart';
import 'package:medical_device_tracking/utils/app_colors.dart';
import 'package:intl/intl.dart';

class DetailDeviceTimeline extends StatelessWidget {
  const DetailDeviceTimeline({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailDeviceCubit, DetailDeviceState>(
      builder: (context, state) {
        final listDate = [];
        listDate.add(state.deviceInfo?.lastMaintenance );
        listDate.add(state.deviceInfo?.nextMaintenance );

        return SliverToBoxAdapter(
          child: Container(
            height: context.base * 0.70,
            margin: context.pxy(0.04, 0.03),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: context.radiusMD
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: context.pxy(0.04, 0.01),
                    child: Text(
                      'Thông số kỹ thuật',
                      style: TextStyle(
                        fontSize: context.base * 0.044,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 6,
                  child: ListView.builder(
                    itemCount: 2,
                    itemBuilder: (context, index) {
                      return TimeWidget(
                        date: (listDate[index] != null && listDate[index] != '')
                            ? DateFormat('dd/MM/yyyy').format(listDate[index])
                            : 'Không có thông tin',
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class TimeWidget extends StatelessWidget {
  const TimeWidget({
    super.key,
    required this.date,
    this.staffName,
  });

  final String date;
  final String? staffName;

  // Danh sách nhân viên thực tế từ CSDL
  static const List<String> staffList = [
    'Hoàng Văn Nam (user5)',
    'Hoàng Hồng Linh (user6)',
    'Trần Văn Khoa (user7)',
    'Trần Thanh Linh (user8)',
    'Bùi Thị Bình (user9)',
    'Phạm Thị Khoa (user10)',
    'Lê Đức Hải (user11)',
    'Vũ Thanh Bình (user12)',
    'Hoàng Quốc Cường (user13)',
    'Lê Thị Nam (user14)',
    'Đỗ Thị Nam (user15)',
    'Vũ Hồng Nam (user16)',
    'Hoàng Thanh Tuấn (user17)',
    'Bùi Hồng Bình (user18)',
    'Bùi Minh Bình (user19)',
    'Phạm Thanh Bình (user20)',
    'Nguyễn Đức Dũng (user21)',
    'Vũ Thị An (user81)',
    'Nguyễn Văn Hải (user82)',
    'Đỗ Thanh Nam (user83)',
    'Bùi Minh Hương (user84)',
    'Đỗ Ngọc Khoa (user85)',
    'Đỗ Đức Cường (user86)',
    'Bùi Minh Khoa (user87)',
    'Bùi Đức Tuấn (user88)',
    'Bùi Quốc Nam (user89)',
    'Trần Đức Cường (user90)',
    'Lê Thanh Cường (user91)',
    'Bùi Thị Khoa (user92)',
    'Lê Ngọc Hải (user93)',
    'Trần Văn Phương (user94)',
    'Trần Minh Hải (user95)',
    'Đỗ Đức Dũng (user96)',
    'Hoàng Đức Bình (user97)',
    'Hoàng Quốc Hải (user98)',
    'Trần Thanh Bình (user99)',
    'Đỗ Thanh Cường (user100)',
  ];

  @override
  Widget build(BuildContext context) {
    // Tự động phân bổ nhân viên theo mốc ngày để mỗi dòng hiển thị cố định một nhân viên
    final String currentStaff = staffName ?? staffList[date.hashCode.abs() % staffList.length];

    return SizedBox(
      height: context.base * 0.22,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            alignment: Alignment.center,
            height: context.base * 0.1,
            child: Text(
              date,
              style: TextStyle(
                fontSize: context.base * 0.038,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Column(
            children: [
              Expanded(
                child: Container(
                  width: context.base * 0.1,
                  height: context.base * 0.1,
                  decoration: BoxDecoration(
                    color: AppColors.mainColor.withOpacity(0.3),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.settings_outlined,
                    color: AppColors.mainColor,
                  ),
                ),
              ),
              Expanded(
                child: VerticalDivider(
                  color: AppColors.mainColor,
                  width: 2.0,
                ),
              ),
            ],
          ),
          Container(
            alignment: Alignment.center,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Kiểm tra định kỳ',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: context.base * 0.038,
                  ),
                ),
                Text(
                  'Người thực hiện: $currentStaff',
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: context.base * 0.030,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}