# custom_lint_lsp_bug

## Steps to Reproduce

1. Run `dart example/tool/lsp_client.dart` to start LSP server.
2. Wait for built-in lint to show, as well as custom_lint.
3. Comment out code in `example/lib/example.dart`, line-by-line.

## Observed Result

Both the built-in deprecation lint, as well as the custom_lint are seen on first
load.

From the point onwards, if you comment out the deprecation code (built-in Dart
lints), you will observe the list of issues in the terminal changes.

However, if you try the same with the custom_lint, the list of lints never
changes. In other words, stale diagnostics will ALWAYS be displayed, until the
LSP server is restarted.

Of course, this isn't observed in e.g. VSCode IDE (using Dart extension) - but
I'm unsure what could be causing this descrepency.
