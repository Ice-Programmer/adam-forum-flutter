class PageModel<T> {
  final List<T> records;
  final String total;
  final String size;
  final String current;
  final String pages;

  PageModel({
    required this.records,
    required this.total,
    required this.size,
    required this.current,
    required this.pages,
  });

  factory PageModel.fromJson(
      Map<String, dynamic> json,
      T Function(Map<String, dynamic>) fromJson,
      ) {
    return PageModel<T>(
      records: (json['records'] as List).map((item) => fromJson(item)).toList(),
      total: json['total'],
      size: json['size'],
      current: json['current'],
      pages: json['pages'],
    );
  }
}
