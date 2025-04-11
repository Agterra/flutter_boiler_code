class LandingState {
  final bool authenticated;

  LandingState({required this.authenticated}) : super();

  LandingState.initial() : authenticated = false;
}
