---
layout: post
title: Мои плагины для IntelliJ IDEA
date: 2024-07-28 00:00:00 +0300
categories: post
---

[Читать в Telegram](https://t.me/fluttermiddlepodcast/278)

❗️ *На проектах иногда используем дополнительные плагины для генерации фичей, работы с другими системами контроля
версий (Git используется не везде), ну и интеграции со сторонними сервисами. Подобные плагины являются самописными, и за
рамки компаний не выходят. Это все, разумеется, под NDA, но если будет интересно, можем сделать плагин для генерации
фичи Блока и выложить его на GitHub. Ставьте ⚡️, от этого и будем отталкиваться.*

Использую [IntelliJ IDEA Community Edition](https://www.jetbrains.com/idea/). Ранее активно юзал [Android
Studio](https://developer.android.com/studio), но попробовав Идею понял, что AS кажется какой-то супер нагруженной, и ее
настройкой заниматься не очень хотелось. Пробовал так же [VS Code](https://code.visualstudio.com/) (не только для связки
Dart/Flutter), но мне не зашло (особенно в плане поиска и работы с кодом). Еще какое-то время пользовался
[VIM](https://www.vim.org/), но там прям отдельно нужно под UI/UX адаптироваться, так и не дошли руки его нормально
попробовать.

Под все ранее перечисленные IDE/редакторы есть плагины для Дарта и Флаттера, поэтому рабочие задачи выполнять на них
можно без проблем.

Раньше была история с тем, что имея среднее железо хотелось больше плагинов, чтобы покрывать вообще все потребности (и
даже сверх нужного). Сейчас же железо позволяет, а вот мне не особо хочется держать зоопарк плагинов, из которых
использую только 1/3 (в лучшем случае).

👉 Плагины

1️⃣ [Bloc](https://plugins.jetbrains.com/plugin/12129-bloc) - плагин от создателя
flutter_bloc (https://pub.dev/packages/flutter_bloc) для работы с виджетами в Блоке. Облегчает часть работы по созданию
и вставке виджетов - становится гораздо меньше ручной писанины.

2️⃣ [CodeTogether Live](https://plugins.jetbrains.com/plugin/14225-codetogether-live) - плагин для сервиса
[CodeTogether](https://www.codetogether.com/live/) (парное программирование/удаленный доступ). Очень редко пользуюсь, в
основном для менторинга. Для связи между материками работает намного лучше [аналога от
JetBrains](https://www.jetbrains.com/code-with-me/), и вроде бы даже нет ограничений по региону (Code With Me от JB не
работает в России, и, кажется, Беларуси).

3️⃣ [Dart](https://plugins.jetbrains.com/plugin/6351-dart) - плагин Дарта. Ставится вместе с Флаттером, но можно
использовать отдельно.

4️⃣ [Flutter](https://plugins.jetbrains.com/plugin/9212-flutter) - плагин Флаттера. Думаю, дополнительные комментарии не
нужны.

5️⃣ [Flutter Intl](https://plugins.jetbrains.com/plugin/13666-flutter-intl) - плагин для
[intl_utils](https://pub.dev/packages/intl_utils). Используется на текущем проекте, поэтому пока что в списке плагинов
есть, дальше уже по ситуации - все зависит от использования intl_utils.

6️⃣ [IdeaVim](https://plugins.jetbrains.com/plugin/164-ideavim) - плагин, добавляющий поддержку движка
[VIM](https://www.vim.org/). Мне нравится работа с текстом в Виме, она одинаковая на разных платформах, и скорость работы
с ней становится намного выше (для меня так точно). Без подготовки (базового туториала по Виму) лучше не пробовать - не
особо интуитивно без теории и небольшой практики.

7️⃣ [Key Promoter X](https://plugins.jetbrains.com/plugin/9792-key-promoter-x) - плагин для запоминания шорткатов в IDE.
Каждый раз, когда вы нажимаете на кнопку, у которой есть комбинация горячих клавиш - покажется диалоговое окно с
подсказкой. Так же показывается, сколько раз вы тянулись за мышкой вместо нажатия пары кнопок (можно обнулить).

8️⃣ [Nyan Progress Bar](https://plugins.jetbrains.com/plugin/8575-nyan-progress-bar) - прогресс-бар здорового человека
плагин для кастомизации прогресс-бара. Летающий кот хотя бы как-то скрашивает монотонность Идеи.

9️⃣ [Rainbow Brackets](https://plugins.jetbrains.com/plugin/10080-rainbow-brackets) - плагин для разукрашивания скобок.
Визуально уже не представляю, чтобы работал без него.

🔟 [WakaTime](https://plugins.jetbrains.com/plugin/7425-wakatime) - плагин для сервиса [WakaTime](https://wakatime.com/).
Стараюсь отслеживать время, которое провожу в том или ином редакторе, или работая с тем, или иным языком
программирования. Лучше не говорить о таком вашему руководителю, дабы он не знал, что вы делаете на протяжении рабочего
дня (и в каком объеме).

1️⃣1️⃣ [XWin Keymap](https://plugins.jetbrains.com/plugin/13094-xwin-keymap) - плагин, который добавляет раскладку
горячих клавиш из версии IDEA для Windows на любую платформу. Я начинал работать еще на Windows, и когда появился Mac,
то приходилось переключаться между разными операционными системами (дом/работа). Поскольку уже знал раскладку Windows,
то и поставил ее на IDEA на macOS.
