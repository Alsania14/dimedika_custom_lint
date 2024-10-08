import 'package:analyzer/error/listener.dart';
import 'package:custom_lint_builder/custom_lint_builder.dart';

// This is the entrypoint of our custom linter
PluginBase createPlugin() => _ExampleLinter();

/// A plugin class is used to list all the assists/lints defined by a plugin.
class _ExampleLinter extends PluginBase {
  /// We list all the custom warnings/infos/errors
  @override
  List<LintRule> getLintRules(CustomLintConfigs configs) => [
        const TypographyLintCode(),
      ];
}

class TypographyLintCode extends DartLintRule {
  const TypographyLintCode() : super(code: _defaultTextCode);

  /// Metadata about the warning that will show-up in the IDE.
  /// This is used for `// ignore: code` and enabling/disabling the lint
  static const _defaultTextCode = LintCode(
    name: 'my_custom_lint_text_code',
    problemMessage: 'please dont use default text widget',
  );

  @override
  void run(
    CustomLintResolver resolver,
    ErrorReporter reporter,
    CustomLintContext context,
  ) {
    context.registry.addClassDeclaration((node) {
      if (node.name.toString() == 'Text') {
        reporter.atNode(node, _defaultTextCode);
      }
    });
  }
}
