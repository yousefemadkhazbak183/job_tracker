abstract final class DateFormatter {
  static String formatDate(DateTime time) {
    const month = [
      "Jan",
      "Feb",
      "Mar",
      "Apr",
      "May",
      "Jun",
      "Jul",
      "Aug",
      "Sep",
      "Oct",
      "Nov",
      "Dec",
    ];

    return " ${time.day} ${month[time.month - 1]}, ${time.year}";
  }
}
