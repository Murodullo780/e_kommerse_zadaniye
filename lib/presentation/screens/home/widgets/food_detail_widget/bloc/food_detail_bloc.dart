import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:e_commerse_zadaniye/core/services/api_services.dart';
import 'package:e_commerse_zadaniye/data/models/food_detail_model.dart';
import 'package:dio/dio.dart';

part 'food_detail_event.dart';
part 'food_detail_state.dart';

class FoodDetailBloc extends Bloc<FoodDetailEvent, FoodDetailState> {
  FoodDetailBloc() : super(FoodDetailInitial()) {
    on<FoodDetailStartedEvent>((event, emit) async {
      emit(FoodDetailLoading());
      final repo = ApiService();

      try {
        final response = await repo.get('lookup.php?i=${event.id}');
        final FoodDetailModel foodDetailModel =
        FoodDetailModel.fromJson(response.data);
        emit(FoodDetailLoaded(foodDetailModel: foodDetailModel));
      } on DioException catch (e) {
        print('API xatosi: $e');
        emit(FoodDetailError(message: e.response?.statusMessage ?? 'API so\'rovida xato'));
      } catch (e) {
        print('Kutilmagan xato: $e');
        emit(FoodDetailError(message: 'Ma\'lumotni yuklashda kutilmagan xato: ${e.toString()}'));
      }
    });
  }
}