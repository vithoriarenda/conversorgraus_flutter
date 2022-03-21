class TransformaCF {
  late double gc, gf;

  double cf() {
    return gc * 1.8 + 32.0;
  }

  double fc() {
    return (gf - 32) / 1.8;
  }
}
