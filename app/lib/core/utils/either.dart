sealed class Either<L, R> {
  const Either._();
}

class Left<L, R> extends Either<L, R> {
  const Left(this.value) : super._();

  final L value;
}

class Right<L, R> extends Either<L, R> {
  const Right(this.value) : super._();

  final R value;
}
