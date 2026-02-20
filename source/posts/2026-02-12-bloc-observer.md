---
title: BlocObserver
publishDate: 2026-02-12
---

[Читать в Telegram](https://t.me/fluttermiddlepodcast/474)

**BlocObserver** - это инструмент, который позволяет глобально отслеживать и реагировать на изменения всех блоков в
приложении.

<u>Будет полезен для:</u>

— Логирования / отладки всех событий и изменений состояния

— Интеграции со сторонними сервисами

— Отслеживания ошибок

— Мониторинга производительности

— Отправки аналитики

Пакет [bloc](https://pub.dev/packages/bloc) содержит в себе
[API обсервера](https://pub.dev/documentation/bloc/latest/bloc/BlocObserver-class.html) и реализацию по
умолчанию - простую заглушку без какой-либо логики.

В проект [bloc_example](https://github.com/fluttermiddlepodcast/bloc_example/tree/bloc_observer)
добавил [CustomBlocObserver](https://github.com/fluttermiddlepodcast/bloc_example/blob/bloc_observer/lib/core/bloc/custom_bloc_observer.dart).
В нем мы просто смотрим на все изменения всех состояний всех блоков.

Вот часть реализации обсервера. Как можно заметить, тут только
вызовы [debugPrint](https://api.flutter.dev/flutter/rendering/debugPrint.html):

```dart
class CustomBlocObserver extends BlocObserver {
  const CustomBlocObserver();

  @override
  void onCreate(BlocBase bloc) {
    debugPrint('--- ${bloc.runtimeType} created');

    super.onCreate(bloc);
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    debugPrint('--- ${bloc.runtimeType} received event: $event');

    super.onEvent(bloc, event);
  }

// В полноценном примере так же реализованы методы:
// - onChange
// - onClose
// - onDone
// - onError
// - onTransition
//
// Принцип работы у них такой же - пишут логи в консоль.
}
```

Исходники
находятся [тут](https://github.com/fluttermiddlepodcast/bloc_example/blob/bloc_observer/lib/core/bloc/custom_bloc_observer.dart).

<u>Для того, чтобы обсервер работал, нужно инициализировать его:</u>

```dart
Future<void> main() async {
  // Стоит отметить, что ваш обсервер - это синглтон, и он доступен для всех блоков.
  Bloc.observer = const CustomBlocObserver();

  runApp(const BLoCExampleApp());
}
```

В проекте события и состояния реализованы как `sealed`-классы. В них нет реализации метода `toString`, поэтому данные в
обсервере будут приходить без деталей.

<u>Вывод без правок такой:</u>

```shell
flutter: --- UsersBloc changed state: Change { currentState: Instance of 'UsersBlocStateLoaded', nextState: Instance of 'UsersBlocStateLoading' }

flutter: --- UsersBloc moved to: Transition { currentState: Instance of 'UsersBlocStateLoading', event: Instance of 'UsersBlocEventFetch', nextState: Instance of 'UsersBlocStateLoaded' }

flutter: --- UsersBloc changed state: Change { currentState: Instance of 'UsersBlocStateLoading', nextState: Instance of 'UsersBlocStateLoaded' }
```

<u>Чтобы добавить к логам конкретики, реализовал в классах состояний и событий метод toString:</u>

```shell
flutter: --- UsersBloc moved to: Transition { currentState: UsersBlocStateLoaded{users (count): 30, canLoadMore: true, page: 1}, event: Instance of 'UsersBlocEventRefresh', nextState: UsersBlocStateLoading{} }

flutter: --- UsersBloc changed state: Change { currentState: UsersBlocStateLoaded{users (count): 30, canLoadMore: true, page: 1}, nextState: UsersBlocStateLoading{} }

flutter: --- UsersBloc moved to: Transition { currentState: UsersBlocStateLoading{}, event: Instance of 'UsersBlocEventFetch', nextState: UsersBlocStateLoaded{users (count): 30, canLoadMore: true, page: 1} }

flutter: --- UsersBloc changed state: Change { currentState: UsersBlocStateLoading{}, nextState: UsersBlocStateLoaded{users (count): 30, canLoadMore: true, page: 1} }
```

Читать и обрабатывать подробный вывод намного проще, чем пытаться разобрать, что могло произойти в обезличенном событии
или состоянии. Формат вывода и детали реализации можно делать на свое усмотрение и по своим нуждам.

Логика обсервера должна быть максимально легкой и нейтральной. Идеальный обсервер выполняет только наблюдение и
минимальную обработку данных, не вмешиваясь в основную бизнес-логику и не создавая сайд-эффектов, которые могут изменить
поведение приложения.
