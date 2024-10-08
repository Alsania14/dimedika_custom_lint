import 'package:analyzer/error/error.dart';
import 'package:analyzer/error/listener.dart';
import 'package:custom_lint_builder/custom_lint_builder.dart';

class DontUseTextWidgetDirectly extends DartLintRule {
  const DontUseTextWidgetDirectly() : super(code: _code);

  static const _textWidgetMaterialBaseChecker = TypeChecker.fromName(
    'Text',
    packageName: 'material',
  );

  static const _textWidgetsBaseChecker = TypeChecker.fromName(
    'Text',
    packageName: 'widgets',
  );

  static const _textWidgetCupertinoBaseChecker = TypeChecker.fromName(
    'Text',
    packageName: 'cupertino',
  );

  // Lint rule metadata
  static const _code = LintCode(
      name: 'dont_use_dart_text_widget_directly',
      problemMessage:
          'Signature Lint Code : Don\'t use Text widget directly !.',
      correctionMessage: 'Use SignatureText widget instead.',
      errorSeverity: ErrorSeverity.WARNING);

  // `run` is where you analyze a file and report lint errors
  // Invoked on a file automatically
  @override
  void run(
    CustomLintResolver resolver,
    ErrorReporter reporter,
    CustomLintContext context,
  ) {
    context.registry.addInstanceCreationExpression((node) {
      if (node.staticType == null) return;
      if (!(node.constructorName.type.toString() == 'Text') &&
          !(_textWidgetMaterialBaseChecker.isExactlyType(node.staticType!) ||
              _textWidgetsBaseChecker.isExactlyType(node.staticType!) ||
              _textWidgetCupertinoBaseChecker
                  .isExactlyType(node.staticType!))) {
        return;
      }
      reporter.atNode(node, _code);
    });
  }
}
