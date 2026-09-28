class HomeViewState {
  final String? code;
  final String? validationError;
  final bool isLoading;
  final bool shouldShowValidationErrors;

  const HomeViewState({
    this.code,
    this.isLoading = false,
    this.shouldShowValidationErrors = false,
    this.validationError,
  });

  HomeViewState copyWith({
    String? code,
    bool? isLoading,
    String? validationError,
    bool? shouldShowValidationErrors,
  }) {
    return HomeViewState(
      shouldShowValidationErrors:
          shouldShowValidationErrors ?? this.shouldShowValidationErrors,
      validationError: validationError ?? this.validationError,
      code: code ?? this.code,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
