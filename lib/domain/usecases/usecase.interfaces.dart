/// Abstract interface for base use case
abstract interface class BaseUseCase<R> {
  R execute();
}

/// Abstract interface for base use case with params
abstract interface class BaseUseCaseWithParams<R, P> {
  R execute(P params);
}
