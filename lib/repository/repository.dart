import 'package:collection/collection.dart';

abstract class BaseRepository<T> {
  Future<T?> getById(int id);
  Future<List<T>> getAll();
  Future<void> insert(T item);
  Future<void> update(T item);
  Future<void> delete(int id);
}

class NetworkUserRepository implements BaseRepository<UserModel> {
  @override
  Future<UserModel?> getById(int id) => throw UnimplementedError();

  @override
  Future<List<UserModel>> getAll() => throw UnimplementedError();

  @override
  Future<void> insert(UserModel item) => throw UnimplementedError();

  @override
  Future<void> update(UserModel item) => throw UnimplementedError();

  @override
  Future<void> delete(int id) => throw UnimplementedError();
}

class MockUserRepository implements BaseRepository<UserModel> {
  final List<UserModel> datasource = <UserModel>[];

  @override
  Future<UserModel?> getById(int id) async =>
      datasource.firstWhereOrNull((UserModel element) => element.id == id);

  @override
  Future<List<UserModel>> getAll() async => datasource;

  @override
  Future<void> insert(UserModel user) async => datasource.add(user);

  @override
  Future<void> update(UserModel user) async {
    final int index =
        datasource.indexWhere((UserModel element) => element.id == user.id);

    datasource[index] = user;
  }

  @override
  Future<void> delete(int id) async =>
      datasource.removeWhere((UserModel element) => element.id == id);
}

class UserModel {
  UserModel({
    required this.id,
    required this.name,
    required this.email,
  });

  final int id;
  final String name;
  final String email;
}
