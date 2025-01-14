---
layout: post
title: Про сложность освоения BLoC и Riverpod
date: 2023-08-20 00:00:00 +0300
categories: post
---

[Читать в Telegram](https://t.me/fluttermiddlepodcast/124)

Недавно ментил 2 людей, и в качестве менеджера состояний мы брали Riverpod (выбрал я, но не суть). Оба человека - люди с
уже имеющимся опытом, кто-то не с Flutter, но с разработкой знаком. Все шло +- нормально, но в какой-то момент у нас
начались пробуксовки - некоторые концепции Riverpod'а у людей как-будто мешались в голове, не всегда было понятно (
особенно без надсмотренности и опыта работы), где и что можно применить (и вообще зачем что-то использовать кроме
setState), и это очень сильно затрудняло дальнейшее изучение чего-то нового. С горем пополам закончили с одним кейсом, и
человек нормально влился и продолжает делать все по документации и идет у него хорошо. А вот со вторым - перешли на
BLoC.

Казалось бы, очень часто слышатся комментарии про то, что BLoC для новичка не очень, он сложный и лучше выбрать что-то
другое (тот же самый Riverpod). Но как только мы перешли с Riverpod на BLoC, очень многое у него сразу прояснилось. Мы
не меняли вообще ничего, кроме StateNotifier -> BLoC. Все сущности, которые отвечали за состояния, все то, что не
относилось к менеджеру состояний, мы не трогали. Мы не переписывали состояния, добавили только события для Блока, но не
более того. И я слышал по голосу, как у человека многие вопросы в голове просто взяли и закрылись одним моментом. Вместо
нотифаеров и стейтов у нас блоки и стейты, но будто концепция обработки событий намного проще всех особенностей
Риверпода.

Это позволило и мне с другой стороны взглянуть на ситуации вокруг трудности Riverpod и BLoC. Возможно, мы так сильно
привыкли использовать что-то у себя на проекте, мы освоили что-то уже настолько, что не видим проблемы со стороны людей,
только-только погружающихся в изучение нашего инструмента. Те концепции, которые нам знакомы, и которые мы можем
передать другим людям, строятся на нашем опыте. Я знаю, как можно применить Riverpod в готовом приложении, но не будет
ли это чем-то сильно трудным в освоении новичку? Тестовые проекты ведь не всегда должны 1 в 1 быть схожими по стеку с
тем, с чем ты работаешь на реальном проекте, особенно когда у тебя немного опыта (если он вообще есть).
