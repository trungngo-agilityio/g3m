part of g3.techlab.markdown;

class ReadmeFile implements Node {
  final Node source;

  ReadmeFile(this.source);

  @override
  Node build(BuildContext context) {
    return MarkdownFile('README', source: source);
  }
}
