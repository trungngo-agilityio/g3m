part of g3.stimpack.core;


typedef StimSymbolScanCallback1<T1 extends StimSymbol> = Function(
    StimSymbolScanMatch match, T1 e1);

typedef StimSymbolScanCallback2<T1 extends StimSymbol, T2 extends StimSymbol>
    = Function(StimSymbolScanMatch match, T1 e1, T2 e2);

typedef StimSymbolScanCallback3<T1 extends StimSymbol, T2 extends StimSymbol,
        T3 extends StimSymbol>
    = Function(StimSymbolScanMatch match, T1 e1, T2 e2, T3 e3);

typedef StimSymbolScanCallback4<T1 extends StimSymbol, T2 extends StimSymbol,
        T3 extends StimSymbol, T4 extends StimSymbol>
    = Function(StimSymbolScanMatch match, T1 e1, T2 e2, T3 e3, T4 e4);


class StimSymbolScanMatch {
  /// This is the full path that leads to the result.
  final List<StimSymbol> path;

  /// This is the match sequence.
  final List<StimSymbol> match;

  StimSymbolScanMatch._(this.path, this.match);
}

class StimSymbolScanner {
  final StimSymbol symbol;

  StimSymbolScanner(this.symbol);

  // ---------------------------------------------------------------------------

  bool scan1<T1 extends StimSymbol>(StimSymbolScanCallback1<T1> func) {
    return _doScan(
        query: [T1],
        callback: (context) {
          final m = context.match;
          func.call(context, m[0] as T1);
        });
  }

  // ---------------------------------------------------------------------------

  bool scan2<T1 extends StimSymbol, T2 extends StimSymbol>(
      StimSymbolScanCallback2<T1, T2> func) {
    return _doScan(
        query: [T1, T2],
        callback: (context) {
          final m = context.match;
          func.call(context, m[0] as T1, m[1] as T2);
        });
  }

  // ---------------------------------------------------------------------------

  bool scan3<T1 extends StimSymbol, T2 extends StimSymbol,
      T3 extends StimSymbol>(StimSymbolScanCallback3<T1, T2, T3> func) {
    return _doScan(
        query: [T1, T2, T3],
        callback: (context) {
          final m = context.match;
          func.call(context, m[0] as T1, m[1] as T2, m[2] as T3);
        });
  }

  // ---------------------------------------------------------------------------

  bool scan4<
      T1 extends StimSymbol,
      T2 extends StimSymbol,
      T3 extends StimSymbol,
      T4 extends StimSymbol>(StimSymbolScanCallback4<T1, T2, T3, T4> func) {
    return _doScan(
        query: [T1, T2, T3, T4],
        callback: (context) {
          final m = context.match;
          func.call(context, m[0] as T1, m[1] as T2, m[2] as T3, m[3] as T4);
        });
  }

  // ---------------------------------------------------------------------------

  bool _doScan({
    List<Type> query,
    void Function(StimSymbolScanMatch) callback,
  }) {
    // The original list of expected types, parent goes first.
    final expectedTypes = query.map((e) => reflectType(e)).toList();

    var found = false;

    _breadthFirstSearch((job) {
      final s = job.item;
      job.symbolMirror = reflect(s).type;

      final expected = expectedTypes[job.matchCount];
      if (job.symbolMirror.isAssignableTo(expected)) {
        // another match discovered
        job.matched = true;
        job.matchCount++;
        if (job.matchCount == expectedTypes.length) {
          found = true;

          // A full match has been discovered
          final result = _buildResult(job);
          callback(result);

          // Notifies that a match has been found and the breath first
          // search should not goes any deeper.
          return true;
        }
      }

      // Notifies that a match has not been found and need to go deeper.
      return false;
    });

    return found;
  }

  StimSymbolScanMatch _buildResult(_ScanJob job) {
    // first need to collect the path.
    var path = <StimSymbol>[];
    var result = <StimSymbol>[];
    while (job != null) {
      if (job.isSymbol) {
        final symbol = job.item;
        path.add(symbol);
        if (job.matched) result.add(symbol);
      }
      job = job.parent;
    }

    // Builds the final path.
    path = path.reversed.toList();
    result = result.reversed.toList();

    return StimSymbolScanMatch._(path, result);
  }

  void _breadthFirstSearch(bool Function(_ScanJob job) handler) {
    final processed = <dynamic>{};

    final start = _ScanJob(null, symbol, 0);

    final queue = Queue<_ScanJob>()..add(start);

    while (queue.isNotEmpty) {
      final job = queue.removeFirst();

      // The current symbol has been visited before.
      if (processed.contains(job.item)) continue;

      processed.add(job.item);

      if (job.item is Iterable) {
        final iterable = job.item as Iterable;
        // If the symbol is set, list, .... then just
        // visit all of the items.
        for (final i in iterable) {
          queue.add(_ScanJob(job, i, job.matchCount));
        }
        continue;
      }

      if (job.item is StimSymbol) {
        job.isSymbol = true;
      } else {
        // Skips this item.
        continue;
      }

      // Stops go deeper if the handler returns true.
      if (handler(job)) continue;

      // Gets the mirror of the symbol.
      final ms = reflect(job.item);

      // Uses reflection to visit all child fields
      final members = ms.type.instanceMembers.values;
      for (final i in members) {
        // Only visit public field.
        if (!i.isGetter || i.isPrivate) continue;

        // This is the field'job mirror
        final mf = ms.getField(i.simpleName);

        // This is the field'job value
        final f = mf.reflectee;

        // Ignore null value.
        if (f == null) continue;

        // If the field is a symbol then enqueue it for processing later.
        queue.addLast(_ScanJob(job, f, job.matchCount));
      }
    }
  }
}

class _ScanJob {
  final _ScanJob parent;
  final dynamic item;

  TypeMirror symbolMirror;
  int matchCount = 0;
  bool isSymbol = false;
  bool matched = false;

  _ScanJob(this.parent, this.item, this.matchCount);
}
