class FoodDetailModel {
  FoodDetailModel({
      List<FoodDetailMeals>? meals,}){
    _meals = meals;
}

  FoodDetailModel.fromJson(dynamic json) {
    if (json['meals'] != null) {
      _meals = [];
      json['meals'].forEach((v) {
        _meals?.add(FoodDetailMeals.fromJson(v));
      });
    }
  }
  List<FoodDetailMeals>? _meals;
FoodDetailModel copyWith({  List<FoodDetailMeals>? meals,
}) => FoodDetailModel(  meals: meals ?? _meals,
);
  List<FoodDetailMeals>? get meals => _meals;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_meals != null) {
      map['meals'] = _meals?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class FoodDetailMeals {
  FoodDetailMeals({
      String? idMeal, 
      String? strMeal, 
      dynamic strMealAlternate, 
      String? strCategory, 
      String? strArea, 
      String? strInstructions, 
      String? strMealThumb, 
      String? strTags, 
      String? strYoutube, 
      String? strIngredient1, 
      String? strIngredient2, 
      String? strIngredient3, 
      String? strIngredient4, 
      String? strIngredient5, 
      String? strIngredient6, 
      String? strIngredient7, 
      String? strIngredient8, 
      String? strIngredient9, 
      String? strIngredient10, 
      String? strIngredient11, 
      String? strIngredient12, 
      String? strIngredient13, 
      String? strIngredient14, 
      String? strIngredient15, 
      String? strIngredient16, 
      String? strIngredient17, 
      String? strIngredient18, 
      String? strIngredient19, 
      String? strIngredient20, 
      String? strMeasure1, 
      String? strMeasure2, 
      String? strMeasure3, 
      String? strMeasure4, 
      String? strMeasure5, 
      String? strMeasure6, 
      String? strMeasure7, 
      String? strMeasure8, 
      String? strMeasure9, 
      String? strMeasure10, 
      String? strMeasure11, 
      String? strMeasure12, 
      String? strMeasure13, 
      String? strMeasure14, 
      String? strMeasure15, 
      String? strMeasure16, 
      String? strMeasure17, 
      String? strMeasure18, 
      String? strMeasure19, 
      String? strMeasure20, 
      String? strSource, 
      dynamic strImageSource, 
      dynamic strCreativeCommonsConfirmed, 
      dynamic dateModified,}){
    _idMeal = idMeal;
    _strMeal = strMeal;
    _strMealAlternate = strMealAlternate;
    _strCategory = strCategory;
    _strArea = strArea;
    _strInstructions = strInstructions;
    _strMealThumb = strMealThumb;
    _strTags = strTags;
    _strYoutube = strYoutube;
    _strIngredient1 = strIngredient1;
    _strIngredient2 = strIngredient2;
    _strIngredient3 = strIngredient3;
    _strIngredient4 = strIngredient4;
    _strIngredient5 = strIngredient5;
    _strIngredient6 = strIngredient6;
    _strIngredient7 = strIngredient7;
    _strIngredient8 = strIngredient8;
    _strIngredient9 = strIngredient9;
    _strIngredient10 = strIngredient10;
    _strIngredient11 = strIngredient11;
    _strIngredient12 = strIngredient12;
    _strIngredient13 = strIngredient13;
    _strIngredient14 = strIngredient14;
    _strIngredient15 = strIngredient15;
    _strIngredient16 = strIngredient16;
    _strIngredient17 = strIngredient17;
    _strIngredient18 = strIngredient18;
    _strIngredient19 = strIngredient19;
    _strIngredient20 = strIngredient20;
    _strMeasure1 = strMeasure1;
    _strMeasure2 = strMeasure2;
    _strMeasure3 = strMeasure3;
    _strMeasure4 = strMeasure4;
    _strMeasure5 = strMeasure5;
    _strMeasure6 = strMeasure6;
    _strMeasure7 = strMeasure7;
    _strMeasure8 = strMeasure8;
    _strMeasure9 = strMeasure9;
    _strMeasure10 = strMeasure10;
    _strMeasure11 = strMeasure11;
    _strMeasure12 = strMeasure12;
    _strMeasure13 = strMeasure13;
    _strMeasure14 = strMeasure14;
    _strMeasure15 = strMeasure15;
    _strMeasure16 = strMeasure16;
    _strMeasure17 = strMeasure17;
    _strMeasure18 = strMeasure18;
    _strMeasure19 = strMeasure19;
    _strMeasure20 = strMeasure20;
    _strSource = strSource;
    _strImageSource = strImageSource;
    _strCreativeCommonsConfirmed = strCreativeCommonsConfirmed;
    _dateModified = dateModified;
}

  FoodDetailMeals.fromJson(dynamic json) {
    _idMeal = json['idMeal'];
    _strMeal = json['strMeal'];
    _strMealAlternate = json['strMealAlternate'];
    _strCategory = json['strCategory'];
    _strArea = json['strArea'];
    _strInstructions = json['strInstructions'];
    _strMealThumb = json['strMealThumb'];
    _strTags = json['strTags'];
    _strYoutube = json['strYoutube'];
    _strIngredient1 = json['strIngredient1'];
    _strIngredient2 = json['strIngredient2'];
    _strIngredient3 = json['strIngredient3'];
    _strIngredient4 = json['strIngredient4'];
    _strIngredient5 = json['strIngredient5'];
    _strIngredient6 = json['strIngredient6'];
    _strIngredient7 = json['strIngredient7'];
    _strIngredient8 = json['strIngredient8'];
    _strIngredient9 = json['strIngredient9'];
    _strIngredient10 = json['strIngredient10'];
    _strIngredient11 = json['strIngredient11'];
    _strIngredient12 = json['strIngredient12'];
    _strIngredient13 = json['strIngredient13'];
    _strIngredient14 = json['strIngredient14'];
    _strIngredient15 = json['strIngredient15'];
    _strIngredient16 = json['strIngredient16'];
    _strIngredient17 = json['strIngredient17'];
    _strIngredient18 = json['strIngredient18'];
    _strIngredient19 = json['strIngredient19'];
    _strIngredient20 = json['strIngredient20'];
    _strMeasure1 = json['strMeasure1'];
    _strMeasure2 = json['strMeasure2'];
    _strMeasure3 = json['strMeasure3'];
    _strMeasure4 = json['strMeasure4'];
    _strMeasure5 = json['strMeasure5'];
    _strMeasure6 = json['strMeasure6'];
    _strMeasure7 = json['strMeasure7'];
    _strMeasure8 = json['strMeasure8'];
    _strMeasure9 = json['strMeasure9'];
    _strMeasure10 = json['strMeasure10'];
    _strMeasure11 = json['strMeasure11'];
    _strMeasure12 = json['strMeasure12'];
    _strMeasure13 = json['strMeasure13'];
    _strMeasure14 = json['strMeasure14'];
    _strMeasure15 = json['strMeasure15'];
    _strMeasure16 = json['strMeasure16'];
    _strMeasure17 = json['strMeasure17'];
    _strMeasure18 = json['strMeasure18'];
    _strMeasure19 = json['strMeasure19'];
    _strMeasure20 = json['strMeasure20'];
    _strSource = json['strSource'];
    _strImageSource = json['strImageSource'];
    _strCreativeCommonsConfirmed = json['strCreativeCommonsConfirmed'];
    _dateModified = json['dateModified'];
  }
  String? _idMeal;
  String? _strMeal;
  dynamic _strMealAlternate;
  String? _strCategory;
  String? _strArea;
  String? _strInstructions;
  String? _strMealThumb;
  String? _strTags;
  String? _strYoutube;
  String? _strIngredient1;
  String? _strIngredient2;
  String? _strIngredient3;
  String? _strIngredient4;
  String? _strIngredient5;
  String? _strIngredient6;
  String? _strIngredient7;
  String? _strIngredient8;
  String? _strIngredient9;
  String? _strIngredient10;
  String? _strIngredient11;
  String? _strIngredient12;
  String? _strIngredient13;
  String? _strIngredient14;
  String? _strIngredient15;
  String? _strIngredient16;
  String? _strIngredient17;
  String? _strIngredient18;
  String? _strIngredient19;
  String? _strIngredient20;
  String? _strMeasure1;
  String? _strMeasure2;
  String? _strMeasure3;
  String? _strMeasure4;
  String? _strMeasure5;
  String? _strMeasure6;
  String? _strMeasure7;
  String? _strMeasure8;
  String? _strMeasure9;
  String? _strMeasure10;
  String? _strMeasure11;
  String? _strMeasure12;
  String? _strMeasure13;
  String? _strMeasure14;
  String? _strMeasure15;
  String? _strMeasure16;
  String? _strMeasure17;
  String? _strMeasure18;
  String? _strMeasure19;
  String? _strMeasure20;
  String? _strSource;
  dynamic _strImageSource;
  dynamic _strCreativeCommonsConfirmed;
  dynamic _dateModified;
FoodDetailMeals copyWith({  String? idMeal,
  String? strMeal,
  dynamic strMealAlternate,
  String? strCategory,
  String? strArea,
  String? strInstructions,
  String? strMealThumb,
  String? strTags,
  String? strYoutube,
  String? strIngredient1,
  String? strIngredient2,
  String? strIngredient3,
  String? strIngredient4,
  String? strIngredient5,
  String? strIngredient6,
  String? strIngredient7,
  String? strIngredient8,
  String? strIngredient9,
  String? strIngredient10,
  String? strIngredient11,
  String? strIngredient12,
  String? strIngredient13,
  String? strIngredient14,
  String? strIngredient15,
  String? strIngredient16,
  String? strIngredient17,
  String? strIngredient18,
  String? strIngredient19,
  String? strIngredient20,
  String? strMeasure1,
  String? strMeasure2,
  String? strMeasure3,
  String? strMeasure4,
  String? strMeasure5,
  String? strMeasure6,
  String? strMeasure7,
  String? strMeasure8,
  String? strMeasure9,
  String? strMeasure10,
  String? strMeasure11,
  String? strMeasure12,
  String? strMeasure13,
  String? strMeasure14,
  String? strMeasure15,
  String? strMeasure16,
  String? strMeasure17,
  String? strMeasure18,
  String? strMeasure19,
  String? strMeasure20,
  String? strSource,
  dynamic strImageSource,
  dynamic strCreativeCommonsConfirmed,
  dynamic dateModified,
}) => FoodDetailMeals(  idMeal: idMeal ?? _idMeal,
  strMeal: strMeal ?? _strMeal,
  strMealAlternate: strMealAlternate ?? _strMealAlternate,
  strCategory: strCategory ?? _strCategory,
  strArea: strArea ?? _strArea,
  strInstructions: strInstructions ?? _strInstructions,
  strMealThumb: strMealThumb ?? _strMealThumb,
  strTags: strTags ?? _strTags,
  strYoutube: strYoutube ?? _strYoutube,
  strIngredient1: strIngredient1 ?? _strIngredient1,
  strIngredient2: strIngredient2 ?? _strIngredient2,
  strIngredient3: strIngredient3 ?? _strIngredient3,
  strIngredient4: strIngredient4 ?? _strIngredient4,
  strIngredient5: strIngredient5 ?? _strIngredient5,
  strIngredient6: strIngredient6 ?? _strIngredient6,
  strIngredient7: strIngredient7 ?? _strIngredient7,
  strIngredient8: strIngredient8 ?? _strIngredient8,
  strIngredient9: strIngredient9 ?? _strIngredient9,
  strIngredient10: strIngredient10 ?? _strIngredient10,
  strIngredient11: strIngredient11 ?? _strIngredient11,
  strIngredient12: strIngredient12 ?? _strIngredient12,
  strIngredient13: strIngredient13 ?? _strIngredient13,
  strIngredient14: strIngredient14 ?? _strIngredient14,
  strIngredient15: strIngredient15 ?? _strIngredient15,
  strIngredient16: strIngredient16 ?? _strIngredient16,
  strIngredient17: strIngredient17 ?? _strIngredient17,
  strIngredient18: strIngredient18 ?? _strIngredient18,
  strIngredient19: strIngredient19 ?? _strIngredient19,
  strIngredient20: strIngredient20 ?? _strIngredient20,
  strMeasure1: strMeasure1 ?? _strMeasure1,
  strMeasure2: strMeasure2 ?? _strMeasure2,
  strMeasure3: strMeasure3 ?? _strMeasure3,
  strMeasure4: strMeasure4 ?? _strMeasure4,
  strMeasure5: strMeasure5 ?? _strMeasure5,
  strMeasure6: strMeasure6 ?? _strMeasure6,
  strMeasure7: strMeasure7 ?? _strMeasure7,
  strMeasure8: strMeasure8 ?? _strMeasure8,
  strMeasure9: strMeasure9 ?? _strMeasure9,
  strMeasure10: strMeasure10 ?? _strMeasure10,
  strMeasure11: strMeasure11 ?? _strMeasure11,
  strMeasure12: strMeasure12 ?? _strMeasure12,
  strMeasure13: strMeasure13 ?? _strMeasure13,
  strMeasure14: strMeasure14 ?? _strMeasure14,
  strMeasure15: strMeasure15 ?? _strMeasure15,
  strMeasure16: strMeasure16 ?? _strMeasure16,
  strMeasure17: strMeasure17 ?? _strMeasure17,
  strMeasure18: strMeasure18 ?? _strMeasure18,
  strMeasure19: strMeasure19 ?? _strMeasure19,
  strMeasure20: strMeasure20 ?? _strMeasure20,
  strSource: strSource ?? _strSource,
  strImageSource: strImageSource ?? _strImageSource,
  strCreativeCommonsConfirmed: strCreativeCommonsConfirmed ?? _strCreativeCommonsConfirmed,
  dateModified: dateModified ?? _dateModified,
);
  String? get idMeal => _idMeal;
  String? get strMeal => _strMeal;
  dynamic get strMealAlternate => _strMealAlternate;
  String? get strCategory => _strCategory;
  String? get strArea => _strArea;
  String? get strInstructions => _strInstructions;
  String? get strMealThumb => _strMealThumb;
  String? get strTags => _strTags;
  String? get strYoutube => _strYoutube;
  String? get strIngredient1 => _strIngredient1;
  String? get strIngredient2 => _strIngredient2;
  String? get strIngredient3 => _strIngredient3;
  String? get strIngredient4 => _strIngredient4;
  String? get strIngredient5 => _strIngredient5;
  String? get strIngredient6 => _strIngredient6;
  String? get strIngredient7 => _strIngredient7;
  String? get strIngredient8 => _strIngredient8;
  String? get strIngredient9 => _strIngredient9;
  String? get strIngredient10 => _strIngredient10;
  String? get strIngredient11 => _strIngredient11;
  String? get strIngredient12 => _strIngredient12;
  String? get strIngredient13 => _strIngredient13;
  String? get strIngredient14 => _strIngredient14;
  String? get strIngredient15 => _strIngredient15;
  String? get strIngredient16 => _strIngredient16;
  String? get strIngredient17 => _strIngredient17;
  String? get strIngredient18 => _strIngredient18;
  String? get strIngredient19 => _strIngredient19;
  String? get strIngredient20 => _strIngredient20;
  String? get strMeasure1 => _strMeasure1;
  String? get strMeasure2 => _strMeasure2;
  String? get strMeasure3 => _strMeasure3;
  String? get strMeasure4 => _strMeasure4;
  String? get strMeasure5 => _strMeasure5;
  String? get strMeasure6 => _strMeasure6;
  String? get strMeasure7 => _strMeasure7;
  String? get strMeasure8 => _strMeasure8;
  String? get strMeasure9 => _strMeasure9;
  String? get strMeasure10 => _strMeasure10;
  String? get strMeasure11 => _strMeasure11;
  String? get strMeasure12 => _strMeasure12;
  String? get strMeasure13 => _strMeasure13;
  String? get strMeasure14 => _strMeasure14;
  String? get strMeasure15 => _strMeasure15;
  String? get strMeasure16 => _strMeasure16;
  String? get strMeasure17 => _strMeasure17;
  String? get strMeasure18 => _strMeasure18;
  String? get strMeasure19 => _strMeasure19;
  String? get strMeasure20 => _strMeasure20;
  String? get strSource => _strSource;
  dynamic get strImageSource => _strImageSource;
  dynamic get strCreativeCommonsConfirmed => _strCreativeCommonsConfirmed;
  dynamic get dateModified => _dateModified;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['idMeal'] = _idMeal;
    map['strMeal'] = _strMeal;
    map['strMealAlternate'] = _strMealAlternate;
    map['strCategory'] = _strCategory;
    map['strArea'] = _strArea;
    map['strInstructions'] = _strInstructions;
    map['strMealThumb'] = _strMealThumb;
    map['strTags'] = _strTags;
    map['strYoutube'] = _strYoutube;
    map['strIngredient1'] = _strIngredient1;
    map['strIngredient2'] = _strIngredient2;
    map['strIngredient3'] = _strIngredient3;
    map['strIngredient4'] = _strIngredient4;
    map['strIngredient5'] = _strIngredient5;
    map['strIngredient6'] = _strIngredient6;
    map['strIngredient7'] = _strIngredient7;
    map['strIngredient8'] = _strIngredient8;
    map['strIngredient9'] = _strIngredient9;
    map['strIngredient10'] = _strIngredient10;
    map['strIngredient11'] = _strIngredient11;
    map['strIngredient12'] = _strIngredient12;
    map['strIngredient13'] = _strIngredient13;
    map['strIngredient14'] = _strIngredient14;
    map['strIngredient15'] = _strIngredient15;
    map['strIngredient16'] = _strIngredient16;
    map['strIngredient17'] = _strIngredient17;
    map['strIngredient18'] = _strIngredient18;
    map['strIngredient19'] = _strIngredient19;
    map['strIngredient20'] = _strIngredient20;
    map['strMeasure1'] = _strMeasure1;
    map['strMeasure2'] = _strMeasure2;
    map['strMeasure3'] = _strMeasure3;
    map['strMeasure4'] = _strMeasure4;
    map['strMeasure5'] = _strMeasure5;
    map['strMeasure6'] = _strMeasure6;
    map['strMeasure7'] = _strMeasure7;
    map['strMeasure8'] = _strMeasure8;
    map['strMeasure9'] = _strMeasure9;
    map['strMeasure10'] = _strMeasure10;
    map['strMeasure11'] = _strMeasure11;
    map['strMeasure12'] = _strMeasure12;
    map['strMeasure13'] = _strMeasure13;
    map['strMeasure14'] = _strMeasure14;
    map['strMeasure15'] = _strMeasure15;
    map['strMeasure16'] = _strMeasure16;
    map['strMeasure17'] = _strMeasure17;
    map['strMeasure18'] = _strMeasure18;
    map['strMeasure19'] = _strMeasure19;
    map['strMeasure20'] = _strMeasure20;
    map['strSource'] = _strSource;
    map['strImageSource'] = _strImageSource;
    map['strCreativeCommonsConfirmed'] = _strCreativeCommonsConfirmed;
    map['dateModified'] = _dateModified;
    return map;
  }

}