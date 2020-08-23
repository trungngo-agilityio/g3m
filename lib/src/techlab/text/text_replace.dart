part of g3.techlab;

class TextReplace extends SingleChildNode {
  TextReplace.all(
    Pattern from,
    String replace,
    Node child,
  )   : assert(from != null, 'from is required'),
        assert(replace != null, 'replace is required'),
        super(TextTransform(child, (s) {
          return s.replaceAll(from, replace);
        }));

  TextReplace.first(
    Pattern from,
    String replace,
    Node child,
  )   : assert(from != null, 'from is required'),
        assert(replace != null, 'replace is required'),
        super(TextTransform(child, (s) {
          return s.replaceFirst(from, replace);
        }));

  TextReplace.range(
    int start,
    int end,
    String replace,
    Node child,
  )   : assert(start != null, 'start required'),
        assert(replace != null, 'replace required'),
        super(TextTransform(child, (s) {
          return s.replaceRange(start, end, replace);
        }));
}
