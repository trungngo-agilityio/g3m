part of g3.armory;

class MarkdownFile implements Node {
  final String name;
  final Node content;

  MarkdownFile(this.name, this.content);

  @override
  Node build(BuildContext context) {
    return CodeFile(
      name: name,
      extension: 'md',
      syntax: 'markdown',
      source: content,
    );
  }
}

class ReadmeFile implements Node {
  final Node content;

  ReadmeFile(this.content);

  @override
  Node build(BuildContext context) {
    return MarkdownFile('README', content);
  }
}
