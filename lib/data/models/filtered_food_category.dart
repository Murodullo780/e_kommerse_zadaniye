class FilteredFoodCategory {
  FilteredFoodCategory({
    List<Meals>? meals,
  }) {
    _meals = meals;
  }

  FilteredFoodCategory.fromJson(dynamic json) {
    if (json['meals'] != null) {
      _meals = [];
      json['meals'].forEach((v) {
        _meals?.add(Meals.fromJson(v));
      });
    }
  }

  List<Meals>? _meals;

  FilteredFoodCategory copyWith({
    List<Meals>? meals,
  }) =>
      FilteredFoodCategory(
        meals: meals ?? _meals,
      );

  List<Meals>? get meals => _meals;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_meals != null) {
      map['meals'] = _meals?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class Meals {
  Meals({
    String? strMeal,
    String? strMealThumb,
    String? idMeal,
  }) {
    _strMeal = strMeal;
    _strMealThumb = strMealThumb;
    _idMeal = idMeal;
  }

  Meals.fromJson(dynamic json) {
    _strMeal = json['strMeal'];
    _strMealThumb = json['strMealThumb'];
    _idMeal = json['idMeal'];
  }

  String? _strMeal;
  String? _strMealThumb;
  String? _idMeal;

  Meals copyWith({
    String? strMeal,
    String? strMealThumb,
    String? idMeal,
  }) =>
      Meals(
        strMeal: strMeal ?? _strMeal,
        strMealThumb: strMealThumb ?? _strMealThumb,
        idMeal: idMeal ?? _idMeal,
      );

  String? get strMeal => _strMeal;

  String? get strMealThumb => _strMealThumb;

  String? get idMeal => _idMeal;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['strMeal'] = _strMeal;
    map['strMealThumb'] = _strMealThumb;
    map['idMeal'] = _idMeal;
    return map;
  }
}
