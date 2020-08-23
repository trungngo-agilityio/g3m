part of g3.techlab.markdown;

class ReadmeFile implements Node {
  final Node content;

  ReadmeFile(this.content);

  @override
  Node build(BuildContext context) {
    return MarkdownFile('README', content);
  }
}
