class PaddingHelper {
  static double calculatePadding(double top) {
    if (top > 170.0) {
      return 25.0;
    } else if (top < 180.0 && top > 170.0) {
      return 27.5;
    } else if (top < 170.0 && top > 160.0) {
      return 30.0;
    } else if (top < 160.0 && top > 150.0) {
      return 32.5;
    } else if (top < 150.0 && top > 140.0) {
      return 35.0;
    } else if (top < 140.0 && top > 130.0) {
      return 37.5;
    } else if (top < 130.0 && top > 120.0) {
      return 40.0;
    } else if (top < 120.0 && top > 110.0) {
      return 42.5;
    } else {
      return 45.0;
    }
  }
}