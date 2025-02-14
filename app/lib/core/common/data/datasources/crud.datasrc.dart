import 'package:buzzup/core/common/base_interfaces/id_holder.dart';

abstract interface class CrudDatasource<M extends IdHolder> {
  Future<void> set(M data);
  Future<void> delete(String id);
  Future<List<M>> getAll();
  Future<M?> getById(String id);
}
