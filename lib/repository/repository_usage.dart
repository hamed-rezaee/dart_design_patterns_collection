import 'repository.dart';

Future<void> main() async {
  final BaseRepository<UserModel> repository = MockUserRepository();

  final UserModel newUser =
      UserModel(id: 1, name: 'John Doe', email: 'johndoe@example.com');
  await repository.insert(newUser);

  final UserModel? user = await repository.getById(1);

  print('id: ${user?.id}, name: ${user?.name}, email:${user?.email}');

  final UserModel updatedUser =
      UserModel(id: 1, name: 'New Jane Doe', email: 'janedoe@example.com');
  await repository.update(updatedUser);

  final List<UserModel> users = await repository.getAll();

  print('user count: ${users.length}');

  for (final UserModel user in users) {
    print('id: ${user.id}, name: ${user.name}, email:${user.email}');
  }

  await repository.delete(1);

  final List<UserModel> usersAfterDelete = await repository.getAll();

  print('user count: ${users.length}');

  for (final UserModel user in usersAfterDelete) {
    print('id: ${user.id}, name: ${user.name}, email:${user.email}');
  }
}
