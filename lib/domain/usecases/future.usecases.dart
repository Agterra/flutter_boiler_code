import 'package:mon_app_flutter/domain/usecases/results.usecases.dart';
import 'package:mon_app_flutter/domain/usecases/usecase.interfaces.dart';

/// [FutureUseCase]
abstract class FutureUseCase<T> implements BaseUseCase<Future<ResultState<T>>> {
  /// execute
  @override
  Future<ResultState<T>> execute() async {
    return _futureCatcher(invoke);
  }

  Future<T> invoke();
}

/// [FutureUseCaseWithParams]
abstract class FutureUseCaseWithParams<T, P>
    implements BaseUseCaseWithParams<Future<ResultState<T>>, P> {
  /// execute
  @override
  Future<ResultState<T>> execute(P params) async {
    return _futureCatcher(() => invoke(params));
  }

  Future<T> invoke(P params);
}

Future<ResultState<T>> _futureCatcher<T, P>(Future<T> Function() invoke) async {
  try {
    final T result = await invoke();
    return ResultState<T>.success(result);
  } on Exception catch (e) {
    return ResultState<T>.failure(e);
  }
}
