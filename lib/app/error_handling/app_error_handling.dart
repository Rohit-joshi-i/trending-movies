// import 'package:bluestacktask/common_utils/common_utils.dart';
// import 'package:bluestacktask/services/api/app_exception.dart';
// import 'package:bluestacktask/services/api/exception_helper.dart';
// import 'package:dio/dio.dart';
// import 'app_error_type.dart';
//
// class AppError {
//   AppErrorType? _appErrorType;
//   String? _errorCode;
//   int? _apiCode;
//   String? displayMessage;
//
//   //Debug purpose only
//   DioError? _dioError;
//   ErrorModel? _errorModel;
//
//   DioError? get dioError => _dioError;
//
//   AppErrorType get appErrorType =>
//       _appErrorType ?? AppErrorType.unknownHandlingError;
//   String get errorCode => _errorCode ?? kApiUnknownError;
//   int get apiCode => _apiCode ?? kApiUnknownErrorCode;
//
//   AppError.withApiException(ExceptionHandler? error, {String? displayMessage}) {
//     if (error != null &&
//         error.getErrorModel() != null &&
//         error.getErrorModel()!.errorMessageKey.hasValidData()) {
//       _dioError = error.getDioError();
//       _errorModel = error.getErrorModel();
//       _setErrorType(_errorModel?.errorMessageKey,
//           apiCode: _errorModel?.errorCode);
//       this.displayMessage = displayMessage;
//     } else {
//       AppError.defaultException(displayMessage: displayMessage);
//     }
//   }
//
//   // AppError.withRestaurantException(result.getRestaurantException)
//   // AppError.defaultError(exception: error)
//
//
//   AppError.defaultException({Exception? exception, this.displayMessage}) {
//     _defaultError();
//   }
//
//   AppError.defaultError({Error? error, this.displayMessage}) {
//     _defaultError();
//   }
//
//   void _defaultError() {
//     _appErrorType = AppErrorType.unknownHandlingError;
//   }
//
// }