---
layout: post
title: Кастомные инструменты Дарта как средства работы с техническим долгом
date: 2025-07-22 00:00:02 +0300
categories: post
description: Создание custom Dart tools для управления техническим долгом, автоматизация рефакторинга, написание собственных инструментов для анализа и улучшения кода
---

<img src="/assets/windows/technical_debt_output.jpg" width="320" />

[Читать в Telegram](https://t.me/fluttermiddlepodcast/446)

Дарт и его тулы в купе с AI дают нам возможность быстро создавать собственные инструменты для работы с техническим
долгом.

Один из возможных способов чинить разбитые окна - собственные аннотации и генерация отчетов о состоянии кода по ним.

Сделал [небольшой демонстрационный проект](https://github.com/fluttermiddlepodcast/technical_debt), с помощью которого
можно помечать технический долг (любой элемент кода в проекте), и генерировать отчет в формате HTML для визуализации
имеющихся проблем.

**В коде будет выглядеть так:**

```dart
@TechnicalDebt(
  author: 'fluttermiddlepodcast',
  description: 'Move to UI-Kit',
  severity: Severity.minor,
  deadline: '2025-12-12',
)
class BEShimmer extends StatelessWidget {
  final double height;
  final double width;

  const BEShimmer({
    super.key,
    required this.height,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade50,
      child: SizedBox(
        height: height,
        width: width,
        child: const ColoredBox(
          color: Colors.white,
        ),
      ),
    );
  }
}
```

В [bloc_example](https://github.com/fluttermiddlepodcast/bloc_example) сделал
ветку [technical_debt](https://github.com/fluttermiddlepodcast/bloc_example/tree/technical_debt), где можно попробовать
самим сгенерировать отчет, и посмотреть на сгенерированный результат.

**Просто выгружаете проект, и дальше из терминала после `fvm pub get` выполняете:**

```shell
$ fvm flutter pub run build_runner build --delete-conflicting-outputs
```

Это - не готовое решение, а лишь небольшой пример, сделанный меньше чем за час при помощи AI. Вы можете доработать его и
использовать у себя в проектах (о том, что нужно сделать,
написал [тут](https://github.com/fluttermiddlepodcast/technical_debt?tab=readme-ov-file#%D0%B5%D1%81%D0%BB%D0%B8-%D0%B1%D1%83%D0%B4%D0%B5%D1%82%D0%B5-%D0%B8%D1%81%D0%BF%D0%BE%D0%BB%D1%8C%D0%B7%D0%BE%D0%B2%D0%B0%D1%82%D1%8C-%D1%83-%D1%81%D0%B5%D0%B1%D1%8F-%D0%B2-%D0%BF%D1%80%D0%BE%D0%B5%D0%BA%D1%82%D0%B5)).

Дарт - это не только про бизнес-логику и плагины. На нем можно писать инструменты, помогающие в прикладной разработке.
Полученные данные можно интегрировать в ваши CI-системы, строить отчеты о росте проблем в проекте (или их снижении), а
так же держать руку на пульсе и не давать разбивать еще больше окон (а так же чинить то, что есть).
