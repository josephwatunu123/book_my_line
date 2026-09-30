import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/features/home/home_repository.dart';
import 'package:mobile/features/queue/model/queue_session.dart';
import 'package:mobile/network/api_exception.dart';
import 'package:mobile/services/snackbar_service.dart';

import 'home_view_state.dart';

final homeViewModelProvider = NotifierProvider<HomeViewmodel, HomeViewState>(
  HomeViewmodel.new,
);

class HomeViewmodel extends Notifier<HomeViewState> {
  HomeRepository get homeRepository => ref.read(homeRepositoryProvider);

  @override
  build() => HomeViewState();

  Future<QueueSession?> onGetQueue() async {
    state = state.copyWith(isLoading: true);
    final inputError = validateCode();
    if (inputError != null) {
      state = state.copyWith(
        validationError: inputError,
        shouldShowValidationErrors: true,
        isLoading: false,
      );
      return null;
    }
    final code = state.code!.trim().toUpperCase();
    try {
      return await homeRepository.getQueue(code);
    } on ApiException catch (error) {
      SnackBarService.show(
        message: error.message,
        title: "Error",
        snackBarType: SnackBarType.error,
      );
    } finally {
      state = state.copyWith(isLoading: false);
    }
    return null;
  }

  String? validateCode() {
    String? code = state.code?.trim().toUpperCase();
    if (code == null || code.isEmpty) return "Please enter a code";

    if (code.length < 4) {
      return "The Code must be 4 or more characters";
    }
    //TODO: Ensure to check what is the actual code params
    if (!RegExp(r'^[A-Z1-9]+$').hasMatch(code)) {
      return 'Code can only contain A-Z and 1-9';
    }

    return null;
  }

  void onCodeChanged(String? code) {
    state = state.copyWith(code: code);
  }
}
