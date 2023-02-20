import 'package:test/test.dart';

import 'package:dart_design_patterns/repository/repository.dart';

void main() {
  group('Repository pattern test =>', () {
    late final BaseRepository<UserModel> userRepository;

    setUpAll(() => userRepository = MockUserRepository());

    test('should insert a user and get it by id.', () async {
      final UserModel user =
          UserModel(id: 1, name: 'John', email: 'john@example.com');

      await userRepository.insert(user);

      final UserModel? retrievedUser = await userRepository.getById(user.id);

      expect(retrievedUser, equals(user));
    });

    test('should update a user.', () async {
      final UserModel user =
          UserModel(id: 1, name: 'John', email: 'john@example.com');

      await userRepository.insert(user);

      final UserModel updatedUser = UserModel(
        id: 1,
        name: 'Updated John',
        email: 'updated_john@example.com',
      );

      await userRepository.update(updatedUser);

      final UserModel? retrievedUser = await userRepository.getById(user.id);

      expect(retrievedUser, equals(updatedUser));
    });

    test('should delete a user.', () async {
      final UserModel user =
          UserModel(id: 1, name: 'John', email: 'john@example.com');

      await userRepository.insert(user);
      await userRepository.delete(user.id);

      final UserModel? users = await userRepository.getById(user.id);

      expect(users, isNull);
    });

    test('should get all users.', () async {
      final List<UserModel> users = <UserModel>[
        UserModel(id: 1, name: 'John', email: 'john@example.com'),
        UserModel(id: 2, name: 'Jane', email: 'jane@example.com'),
        UserModel(id: 3, name: 'Bob', email: 'bob@example.com'),
      ];

      for (final UserModel user in users) {
        await userRepository.insert(user);
      }

      final List<UserModel> retrievedUsers = await userRepository.getAll();

      expect(retrievedUsers, equals(users));
    });
  });
}
