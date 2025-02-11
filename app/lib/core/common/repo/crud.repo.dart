import 'package:buzzup/core/models/all_models.dart';
import 'package:buzzup/core/utils/typedefs.dart';

abstract interface class CrudRepo<T> {
  const CrudRepo();

  ResultFuture<List<T>> getAll(Location? location);

  ResultFuture<T> getById(String id);

  ResultFuture<void> create(T data);

  ResultFuture<void> update(T data);

  ResultFuture<void> delete(String id);
}
