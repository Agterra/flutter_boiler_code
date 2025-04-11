import 'package:mon_app_flutter/app/views/screens/landing/landing.state.dart';
import 'package:mon_app_flutter/domain/services/dialog.service.interface.dart';
import 'package:mon_app_flutter/domain/services/navigation.service.interface.dart';
import 'package:mon_app_flutter/infrastructure/services/dialog.service.dart';
import 'package:mon_app_flutter/infrastructure/services/navigation.service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'landing.view_model.g.dart';

@riverpod
final class LandingViewModel extends _$LandingViewModel {
  late NavigationService _navigationService;
  late DialogService _dialogService;
  // late GetAuthUseCase _getAuthUseCase;

  @override
  Future<LandingState> build() async {
    _navigationService = ref.watch(navigationServiceProvider);
    _dialogService = ref.watch(dialogServiceProvider);
    // _getAuthUseCase = await ref.watch(getAuthUseCaseProvider.future);

    // final ResultState<AuthEntity> result = await _getAuthUseCase.execute();

    bool authenticated = false;

    // result.when(
    //   success: (AuthEntity data) {
    //     authenticated = true;
    //   },
    // );

    final LandingState state = LandingState(authenticated: authenticated);
    return state;
  }

  Future<void> navigateToHome() => _navigationService.home();

  Future<void> showErrorDialog(String error) =>
      _dialogService.showErrorDiablog(error);
}
