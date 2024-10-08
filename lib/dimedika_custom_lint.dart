import 'package:custom_lint_builder/custom_lint_builder.dart';
import 'package:dimedika_custom_lint/rules/dont_use_text_widget_directly.dart';

// This is the entrypoint of our custom linter
PluginBase createPlugin() => DimedikaCustomLint();

class DimedikaCustomLint extends PluginBase {
  // Lint rules
  @override
  List<LintRule> getLintRules(CustomLintConfigs configs) => [
        const DontUseTextWidgetDirectly(),
      ];
}
