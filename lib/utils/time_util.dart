import 'package:intl/intl.dart';

class TimeUtil {
  static String format(String dateTimeStr) {
    try {
      final DateTime parsedDate = DateTime.parse(dateTimeStr).toLocal();
      final DateTime now = DateTime.now().toLocal();
      final Duration difference = now.difference(parsedDate).abs();

      final int seconds = difference.inSeconds;
      final int minutes = difference.inMinutes;
      final int hours = difference.inHours;
      final int days = difference.inDays;

      if (days >= 10) {
        return DateFormat('yyyy-MM-dd HH:mm').format(parsedDate);
      } else if (days >= 7) {
        return '一周前';
      } else if (days >= 1) {
        return '${days}天前';
      } else if (hours >= 1) {
        return '${hours}小时前';
      } else if (minutes >= 1) {
        return '${minutes}分钟前';
      } else if (seconds >= 10) {
        return '$seconds秒前';
      } else {
        return '刚刚';
      }
    } catch (e) {
      return '无效时间';
    }
  }
}
