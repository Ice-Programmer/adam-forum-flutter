/// 图片工具类
class ImageUtil {
  /// 计算目标长宽比
  static double calculateAspectRatio(double width, double height) {
    final double originalAspectRatio = width / height;

    // 如果原始比例大于 16:9，则裁剪为 16:9
    if (originalAspectRatio > 16 / 9) {
      return 16 / 9;
    }
    // 否则裁剪为 3:4
    else {
      return 3 / 4;
    }
  }
}
