part of g3.armory;

class TextBlend implements Node {
  /// The list of markers that need to be found in the old content
  final List<String> markers;

  /// If this is true, the new content shall be used for any text
  /// before the first marker.
  final bool newContentFirst;

  final Node oldContent;
  final Node newContent;

  TextBlend({
    @required this.markers,
    @required this.oldContent,
    @required this.newContent,
    this.newContentFirst = false,
  })  : assert(markers != null, 'markers is required'),
        assert(oldContent != null, 'old content is required'),
        assert(newContent != null, 'new content is required');

  @override
  Node build(BuildContext context) {
    return TextMerge(
      func: (contents) {
        assert(contents.length == 2);
        return _blend(contents[0], contents[1]);
      },
      children: [
        oldContent,
        newContent,
      ],
    );
  }

  // The blend function implementation
  String _blend(String s1, String s2) {
    final buf = StringBuffer();

    // True indicates means s1 content before the marker
    // shall need to be copied into the final result.
    var s1Turn = newContentFirst == true ? false : true;

    for (final i in markers) {
      // loops through all marker
      var k1 = s1.indexOf(i);
      var k2 = s2.indexOf(i);

      if (k1 < 0 || k2 < 0) {
        final separator = '#' * 5;
        // the marker could not be found.
        // Generates the error so that developer can manually correct it later.
        buf.write('\n'
            '$separator[MISSING]$separator\n'
            '$i\n'
            '$separator[OLD]$separator\n'
            '$s1\n'
            '$separator[NEW]$separator\n'
            '$s2\n'
            '$separator\n');
        return buf.toString();
      } else {
        // the marker is found. Not an issue.

        var s = s1Turn ? s1.substring(0, k1) : s2.substring(0, k2);
        s1 = s1.substring(k1 + i.length);
        s2 = s2.substring(k2 + i.length);
        s1Turn = !s1Turn;
        buf.write(s);
        buf.write(i);
      }
    }

    // Writes out the remaining text.
    buf.write(s1Turn ? s1 : s2);

    return buf.toString();
  }
}
