import 'package:clean_arc/core/app_storage/secure_storage_service.dart';
import 'package:clean_arc/core/constant/constants.dart';
import 'package:clean_arc/core/errors/error_model.dart';
import 'package:clean_arc/core/errors/failures.dart';
import 'package:clean_arc/core/errors/parse_error_message.dart';
import 'package:clean_arc/core/extentions/date_time_helper.dart';
import 'package:clean_arc/core/extentions/debouncer.dart';
import 'package:clean_arc/core/extentions/number_formatter.dart';
import 'package:clean_arc/core/network/api_constant.dart';
import 'package:clean_arc/core/network/network_checker.dart';
import 'package:clean_arc/core/state/base_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CoreShowcaseCubit extends Cubit<BaseState<Map<String, dynamic>>> {
  CoreShowcaseCubit({
    required SecureStorageService secureStorageService,
    required NetworkChecker networkChecker,
  })  : _secureStorageService = secureStorageService,
        _networkChecker = networkChecker,
        super(BaseState<Map<String, dynamic>>.init());

  final SecureStorageService _secureStorageService;
  final NetworkChecker _networkChecker;
  final Debouncer _debouncer = Debouncer(milliseconds: 500);

  void emitInit() {
    emit(BaseState<Map<String, dynamic>>.init());
  }

  void emitLoading() {
    emit(BaseState<Map<String, dynamic>>.loading());
  }

  void emitLoadingMore() {
    emit(LoadingMoreState<Map<String, dynamic>>());
  }

  void emitEmpty() {
    emit(BaseState<Map<String, dynamic>>.Empty());
  }

  void emitPaginate() {
    emit(BaseState<Map<String, dynamic>>.PaginateState());
  }

  void emitError() {
    emit(BaseState<Map<String, dynamic>>.error(
        msg: 'Generic error from BaseState.error'));
  }

  void emitErrorData() {
    emit(BaseState<Map<String, dynamic>>.errorData(
        msg: 'Server returned invalid payload'));
  }

  void emitValidate() {
    emit(
      ValidateState<Map<String, dynamic>>(
        errors: {
          'query': ['Query is required'],
        },
      ),
    );
  }

  void emitDone() {
    emit(BaseState<Map<String, dynamic>>.done(msg: 'Operation completed'));
  }

  Future<void> checkConnectivity() async {
    emit(BaseState<Map<String, dynamic>>.loading());
    final isConnected = await _networkChecker.isDeviceConnected;
    if (!isConnected) {
      emit(OfflineState<Map<String, dynamic>>(
          msg: const NoInternetFailure().message));
      return;
    }

    emit(
      BaseState<Map<String, dynamic>>.success(
        data: {
          'connectivity': 'Online',
          'baseUrl': BASE_URL,
          'endpoint': HOME_URL,
          'formattedNow':
              DateTimeHelper.formatDateTime(DateTime.now().toIso8601String()),
          'price': NumberFormatter.formatDynamicPrice(1200000),
          'date': reformatDate(DateTime.now()),
        },
      ),
    );
  }

  Future<void> saveDemoToken(String token) async {
    if (token.trim().isEmpty) {
      emitValidate();
      return;
    }

    emit(BaseState<Map<String, dynamic>>.loading());
    await _secureStorageService.saveToken(token: token.trim());
    emit(
      BaseState<Map<String, dynamic>>.success(
        data: {
          'savedToken': token.trim(),
        },
      ),
    );
  }

  Future<void> readDemoToken() async {
    emit(BaseState<Map<String, dynamic>>.loading());
    final token = await _secureStorageService.getToken();
    if (token == null || token.isEmpty) {
      emit(BaseState<Map<String, dynamic>>.Empty());
      return;
    }

    emit(
      BaseState<Map<String, dynamic>>.success(
        data: {
          'readToken': token,
        },
      ),
    );
  }

  void parseErrorDemo() {
    final parsed = parseErrorMessages({
      'errors': {
        'email': ['Email is invalid'],
        'password': ['Password is too short'],
      },
    });

    final model = ErrorModel.fromJson({
      'message': 'Validation failed',
      'status': '422',
      'data': {
        'email': ['Email is invalid'],
      },
    });

    emit(
      BaseState<Map<String, dynamic>>.success(
        data: {
          'parsedErrors': parsed,
          'firstError': model.getFirstError() ??
              const ValidationFailure(message: 'Validation error').message,
        },
      ),
    );
  }

  void onDebouncedQuery(String text) {
    _debouncer.run(() {
      emit(
        BaseState<Map<String, dynamic>>.success(
          data: {
            'query': text,
            'formattedPrice': NumberFormatter.formatPrice('1234567.89'),
            'timeAgo': DateTimeHelper.formatTimeAgo(
              DateTime.now()
                  .subtract(const Duration(minutes: 3))
                  .toIso8601String(),
            ),
          },
        ),
      );
    });
  }

  @override
  Future<void> close() {
    _debouncer.dispose();
    return super.close();
  }
}
