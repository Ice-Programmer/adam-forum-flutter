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

  static String formatDateTime(String dateTimeStr) {
    try {
      final DateTime parsedDate = DateTime.parse(dateTimeStr).toLocal();
      final DateTime now = DateTime.now().toLocal();
      final Duration difference = now.difference(parsedDate).abs();

      final int minutes = difference.inMinutes;
      final int hours = difference.inHours;
      final int days = difference.inDays;

      if (days >= 3 || parsedDate.year != now.year) {
        // 超过3天或不在当前年份，显示具体日期
        if (parsedDate.year != now.year) {
          return DateFormat('yyyy年MM月dd日').format(parsedDate);
        } else {
          return DateFormat('MM月dd日').format(parsedDate);
        }
      } else if (days >= 2) {
        // 超过48小时，显示几天前
        return '$days天前';
      } else if (days >= 1) {
        // 超过24小时，显示“昨天 几小时前”
        return '昨天 ${hours % 24}小时前';
      } else if (hours >= 1) {
        // 超过1小时，显示几小时前
        return '$hours小时前';
      } else if (minutes >= 5) {
        // 超过5分钟，显示几分钟前
        return '$minutes分钟前';
      } else {
        // 5分钟内显示“刚刚”
        return '刚刚';
      }
    } catch (e) {
      return '无效时间';
    }
  }
}
