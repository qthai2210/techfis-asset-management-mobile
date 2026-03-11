import 'package:techfis_asset_management_mobile/core/error/failures.dart';

class FailureMapper {
  static String mapFailureToMessage(Failure failure) {
    if (failure is NetworkFailure) {
      return "Vui lòng kiểm tra kết nối mạng.";
    } else if (failure is ServerFailure) {
      return "Hệ thống đang bảo trì.";
    } else if (failure is CacheFailure) {
      return "Không thể tải dữ liệu offline.";
    } else if (failure is AuthFailure) {
      return "Phiên làm việc hết hạn. Vui lòng đăng nhập lại.";
    } else if (failure is ValidationFailure) {
      return failure.message;
    } else {
      return "Đã có lỗi xảy ra. Vui lòng thử lại sau.";
    }
  }
}
