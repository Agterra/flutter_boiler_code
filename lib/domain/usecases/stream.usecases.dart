import 'package:mon_app_flutter/domain/usecases/results.usecases.dart';
import 'package:mon_app_flutter/domain/usecases/usecase.interfaces.dart';

/// [StreamUseCase]
abstract class StreamUseCase<T> implements BaseUseCase<Stream<ResultState<T>>> {
  /// execute

  @override
  Stream<ResultState<T>> execute() async* {
    yield* _streamCatcher(invoke);
  }

  Stream<T> invoke();
}

/// [StreamUseCaseWithParams]
abstract class StreamUseCaseWithParams<T, P>
    implements BaseUseCaseWithParams<Stream<ResultState<T>>, P> {
  @override
  Stream<ResultState<T>> execute(P params) async* {
    yield* _streamCatcher(() => invoke(params));
  }

  Stream<T> invoke(P params);
}

Stream<ResultState<T>> _streamCatcher<T, P>(Stream<T> Function() invoke) {
  try {
    final Stream<T> result = invoke();
    return result.map(ResultState<T>.success);
  } on Exception catch (e) {
    return Stream<ResultState<T>>.value(ResultState<T>.failure(e));
  }
}
