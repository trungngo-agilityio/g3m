part of g3.util;

void printWarn(Object s) {
  color(s, front: Styles.YELLOW);
}

void printError(Object s) {
  color(s, front: Styles.RED);
}

void printSuccess(Object s) {
  color(s, front: Styles.GREEN);
}

void printInfo(Object s) {
  color(s, front: Styles.BLUE);
}
