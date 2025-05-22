import 'package:analyzer/error/error.dart' hide LintCode;
import 'package:analyzer/error/listener.dart';
import 'package:custom_lint_builder/custom_lint_builder.dart';

PluginBase createPlugin() => _ExampleLinter();

class _ExampleLinter extends PluginBase {
  @override
  List<LintRule> getLintRules(CustomLintConfigs configs) {
    return [
      MyCustomLintCode(),
    ];
  }
}

class MyCustomLintCode extends DartLintRule {
  MyCustomLintCode() : super(code: _code);

  static const _code = LintCode(
    name: 'my_custom_lint_code',
    problemMessage: 'THIS is the description of our custom lint',
    errorSeverity: ErrorSeverity.WARNING,
  );

  @override
  void run(
    CustomLintResolver resolver,
    ErrorReporter reporter,
    CustomLintContext context,
  ) {
    context.registry.addVariableDeclaration((node) {
      reporter.atNode(node, code);
    });
  }
}
