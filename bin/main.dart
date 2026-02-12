import 'package:static_shock/static_shock.dart';

Future<void> main(_) async {
  final staticShock = StaticShock()
    ..pick(ExtensionPicker('html'))
    ..pick(ExtensionPicker('jpeg'))
    ..pick(DirectoryPicker.parse('images'))
    ..plugin(const MarkdownPlugin())
    ..plugin(const JinjaPlugin())
    ..plugin(const PrettyUrlsPlugin())
    ..plugin(const SassPlugin())
    ..plugin(
      RssPlugin(
        site: RssSiteConfiguration(
          title: 'Flutter Developer Talks',
          description: 'Flutter Developer Talks blog',
          homePageUrl: '',
          language: 'Russian',
        ),
        pageToRssItemMapper: (config, page) {
          return defaultPageToRssItemMapper(config, page)?.copyWith(
            author: 'Flutter Developer Talks',
          );
        },
      ),
    );

  await staticShock.generateSite();
}
