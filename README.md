# custom_lint_lsp_bug

## Steps to Reproduce

1. Run `dart example/tool/lsp_client.dart` to start LSP server.
2. Wait for built-in lint to show, as well as custom_lint.
3. Comment out code in `example/lib/example.dart`, line-by-line.

NOTE: the code in `tool/lsp_client.dart` is copied directly from the
`analysis_server_client` example in the Dart SDK repo.

## Observed Result

Both the built-in deprecation lint, as well as the custom_lint are seen on first
load.

From that point onwards, if you comment out the deprecation code (which triggers
the built-in Dart lints), you will observe the list of issues in the terminal
DOES change.

However, if you try the same with the custom_lint, the list of lints NEVER
changes. In other words, stale diagnostics will always be displayed, until the
LSP server is restarted.

Of course, this isn't observed in e.g. VSCode IDE (using Dart extension) - but
I'm unsure what could be causing this descrepency.
