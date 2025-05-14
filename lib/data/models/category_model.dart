class CategoryModel {
  CategoryModel({
    List<Categories>? categories,
  }) {
    _categories = categories;
  }

  CategoryModel.fromJson(dynamic json) {
    if (json['categories'] != null) {
      _categories = [];
      json['categories'].forEach((v) {
        _categories?.add(Categories.fromJson(v));
      });
    }
  }

  List<Categories>? _categories;

  CategoryModel copyWith({
    List<Categories>? categories,
  }) =>
      CategoryModel(
        categories: categories ?? _categories,
      );

  List<Categories>? get categories => _categories;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_categories != null) {
      map['categories'] = _categories?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class Categories {
  Categories({
    String? idCategory,
    String? strCategory,
    String? strCategoryThumb,
    String? strCategoryDescription,
  }) {
    _idCategory = idCategory;
    _strCategory = strCategory;
    _strCategoryThumb = strCategoryThumb;
    _strCategoryDescription = strCategoryDescription;
  }

  Categories.fromJson(dynamic json) {
    _idCategory = json['idCategory'];
    _strCategory = json['strCategory'];
    _strCategoryThumb = json['strCategoryThumb'];
    _strCategoryDescription = json['strCategoryDescription'];
  }

  String? _idCategory;
  String? _strCategory;
  String? _strCategoryThumb;
  String? _strCategoryDescription;

  Categories copyWith({
    String? idCategory,
    String? strCategory,
    String? strCategoryThumb,
    String? strCategoryDescription,
  }) =>
      Categories(
        idCategory: idCategory ?? _idCategory,
        strCategory: strCategory ?? _strCategory,
        strCategoryThumb: strCategoryThumb ?? _strCategoryThumb,
        strCategoryDescription:
            strCategoryDescription ?? _strCategoryDescription,
      );

  String? get idCategory => _idCategory;

  String? get strCategory => _strCategory;

  String? get strCategoryThumb => _strCategoryThumb;

  String? get strCategoryDescription => _strCategoryDescription;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['idCategory'] = _idCategory;
    map['strCategory'] = _strCategory;
    map['strCategoryThumb'] = _strCategoryThumb;
    map['strCategoryDescription'] = _strCategoryDescription;
    return map;
  }
}
