extension DoubleExtension on double {
  double roundToTwo() {
    return (this * 100).round() / 100;
  }

  String get formatThousand {
    // Implement formatting logic here
    return this
        .toStringAsFixed(0)
        .replaceAllMapped(
          RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
          (Match m) => '${m[1]},',
        );
  }

  // format thousand with k for thousands, m for millions, b for billions
  String get formatThousandKMB {
    if (this >= 1e9) {
      return '${(this / 1e9).roundToTwo()}b'; // billions
    } else if (this >= 1e6) {
      return '${(this / 1e6).roundToTwo()}m'; // millions
    } else if (this >= 1e3) {
      return '${(this / 1e3).roundToTwo()}k'; // thousands
    } else {
      return this.toStringAsFixed(2);
    }
  }
}
