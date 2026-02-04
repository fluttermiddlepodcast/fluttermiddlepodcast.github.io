---
layout: post
title: Тестирование с моками и фейками
date: 2026-02-03 00:00:00 +0300
categories: post
description: Рассказываю о применении моков и фейков для тестирования
---

[Читать в Telegram](https://t.me/fluttermiddlepodcast/470)

В нашем тестовом проекте [bloc_example](https://github.com/fluttermiddlepodcast/bloc_example) недавно
появились [тесты](https://t.me/fluttermiddlepodcast/463). Пока добавил только проверку логики работы блоков. Вместо
реальных запросов в сеть или походов в локальную БД мы используем моки и фейки.

**Мок (Mock)** - это тестовый объект, имитирующий поведение реального объекта и позволяющий проверять взаимодействия с
ним (что вызывалось, с какими параметрами, сколько раз).

**Фейк (Fake)** - это самостоятельная реализация того же интерфейса, который реализует реальный компонент.

В [bloc_example](https://github.com/fluttermiddlepodcast/bloc_example) эти компоненты реализуются через
пакет [mocktail](https://pub.dev/packages/mocktail) - решение от [Феликса Ангелова](https://github.com/felangel),
разработчика [bloc](https://pub.dev/packages/bloc) и [flutter_bloc](https://pub.dev/packages/flutter_bloc). С другими
плагинами по типу [mockito](https://pub.dev/packages/mockito) я мало работал, поэтому рассказывать про них и сравнивать
с [mocktail](https://pub.dev/packages/mocktail) не буду.

<u>Создать и использовать мок репозитория можно следующим образом:</u>

```dart
// Создаем мок репозитория как отдельный класс.
class MockUsersRepository extends Mock implements UsersRepository {}

void main() {
  group(
    'UsersBloc tests',
        () {
      late UsersRepository usersRepository;

      setUp(
            () {
          usersRepository = MockUsersRepository();

          // Определяем поведение мока при вызове метода
          // с определенными параметрами.
          when(
                () =>
                usersRepository.fetchUsers(
                  limit: 30,
                  page: 0,
                ),
          ).thenAnswer((_) => Future.value((_testUsers, null)));
        },
      );

      blocTest(
        'Initialization test',
        build: () =>
            UsersBloc(
              usersRepository: usersRepository,
            ),
        expect: () =>
        [
          _defaultLoadedState,
        ],
        // После того, как тест завершится, мы можем проверить,
        // сколько раз, например, был вызван метод `fetchUsers`.
        // Это полезно, когда у блока сложный флоу инициализации,
        // и нужно быть на все 100% уверенными в том, что лишних запросов нет.
        tearDown: () {
          verify(() => usersRepository.fetchUsers(limit: 30, page: 0)).called(1);
        },
      );
    },
  )
  ,
}
```

Проверку количества запросов метода fetchUsers по требованиям мы делать не будем - это показано для примера. Конечная
цель теста - удостовериться, что состояния и данные в них у блоков такие, какие мы в них ожидаем. Для этого требуется
добавить проверку пагинации. В реализации выше нужно для каждого возможного варианта запроса сделать связку `when` ->
`thenAnswer`. Это долго, и есть куда-более простой способ решить данную задачу - написать фейковый репозиторий.

<u>Фейк, выполняющий ту же самую работу, что и мок, будет выглядеть так:</u>

```dart
class FakeUsersRepository extends Fake implements UsersRepository {
  final List<User> _allUsers;

  FakeUsersRepository(this._allUsers);

  @override
  Future<(List<User>?, String?)> fetchUsers({
    int limit = 30,
    int page = 0,
  }) async {
    final start = page * limit;
    final end = start + limit;

    if (start >= _allUsers.length) {
      return (<User>[], null);
    }

    final pageUsers = _allUsers.sublist(
      start,
      min(end, _allUsers.length),
    );

    return (pageUsers, null);
  }
}
```

Для простой логики и проверок вызовов методов лучше использовать моки, для сложных кейсов - фейки. Руководствуйтесь
требованиями к вашим тестам, но если на первых порах ничего не понятно, возьмите моки - они легче в реализации.

❗️ <u>Учитывайте, что фейковые репозитории, которые наследуются от Fake из mocktail, лучше использовать только в
тестах:</u>

```shell
/// **WARNING**:[Fake] uses [noSuchMethod](goo.gl/r3IQUH), which is a _form_ of
/// runtime reflection, and causes sub-standard code to be generated. As such,
/// [Fake] should strictly _not_ be used in any production code, especially if
/// used within the context of Dart for Web (dart2js, DDC) and Dart for Mobile
/// (Flutter).
```

▶️ Подробнее про mocktail, моки, фейки, и остальные возможности библиотеки можно узнать
из [документации](https://pub.dev/packages/mocktail).
