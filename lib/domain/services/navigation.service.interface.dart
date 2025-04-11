abstract class NavigationService {
  void reset();
  Future<bool> goBack();
  Future<void> home();
  Future<void> loading();
}
