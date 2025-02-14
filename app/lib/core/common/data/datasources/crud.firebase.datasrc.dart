import 'package:buzzup/core/common/base_interfaces/id_holder.dart';
import 'package:buzzup/core/common/data/datasources/crud.datasrc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract interface class CrudFirebaseDatasrc<M extends IdHolder> implements CrudDatasource<M> {
  CollectionReference<M> get collectionReference;

  @override
  Future<void> set(M data) async => await collectionReference.doc(data.id).set(data, SetOptions(merge: true));

  @override
  Future<void> delete(String id) async => await collectionReference.doc(id).delete();

  @override
  Future<List<M>> getAll() async => await collectionReference.get().then((snap) => snap.docs.map((e) => e.data()).toList());

  @override
  Future<M?> getById(String id) async => await collectionReference.doc(id).get().then((snap) => snap.data());

  Stream<List<M>> watchAll() => collectionReference.snapshots().map((snap) => snap.docs.map((e) => e.data()).toList());

  Stream<M?> watchById(String id) => collectionReference.doc(id).snapshots().map((snap) => snap.data());
}
