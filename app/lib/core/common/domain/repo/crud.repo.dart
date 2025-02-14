import 'package:buzzup/core/common/domain/entities/all_entities.dart';
import 'package:buzzup/core/utils/typedefs.dart';

abstract interface class CrudRepo<E> {
  const CrudRepo();

  ResultFuture<List<E>> getAll(LocationEntity? location);

  ResultFuture<E?> getById(String id);

  ResultFuture<void> create(E data);

  ResultFuture<void> update(E data);

  ResultFuture<void> delete(String id);
}
