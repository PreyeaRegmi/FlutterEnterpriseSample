
import 'dart:async';

abstract class UseCase<P, R> {
  Stream<R> buildUseCase(P param);

  StreamSubscription<R> execute(P param,void Function(R) result,void Function(String) error)
  {
    return buildUseCase(param).listen(result,onError: (Object exception, StackTrace stackTrace){
      error(exception.toString());
    });
  }
}


