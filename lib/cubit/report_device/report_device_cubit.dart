import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_device_tracking/cubit/report_device/report_device_state.dart';
import 'package:medical_device_tracking/di/di.dart';
import 'package:medical_device_tracking/network/dio_config/dio_config.dart';

class ReportDeviceCubit extends Cubit<ReportDeviceState> {
  ReportDeviceCubit() : super(ReportDeviceState(status: ReportStatus.initial));

  Future<void> reportDevice({required int deviceId}) async {
    final String reportDeviceEndPoints = 'api/v1/equipment/$deviceId';
    final dio = getIt<DioConfig>().dio;

    emit(state.copyWith(
      status: ReportStatus.loading
    ));

    try {
      final response = await dio.post(
        reportDeviceEndPoints,
      );

      if (response.statusCode == 200) {
        emit(state.copyWith(
          status: ReportStatus.success,
          message: 'Báo hỏng thành công'
        ));

        log('Báo hỏng thành công');
      }

      else {
        emit(state.copyWith(
          status: ReportStatus.failure,
          message: 'Báo hỏng thất bại'
        ));

        log('Báo hỏng thất bại');
      }
    }

    on DioException catch(e,s) {
      emit(state.copyWith(
          status: ReportStatus.failure,
          message: 'Báo hỏng thất bại'
      ));

      log(e.toString());
      log(s.toString());
    }

    catch(e,s) {
      emit(state.copyWith(
          status: ReportStatus.failure,
          message: 'Báo hỏng thất bại'
      ));

      log(e.toString());
      log(s.toString());
    }
  }
}