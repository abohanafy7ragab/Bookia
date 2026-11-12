import 'package:bloc/bloc.dart';
import 'package:bookia/core/networking/dio_exeption_handler.dart';
import 'package:bookia/features/home/data/models/Books_model.dart';
import 'package:bookia/features/home/data/repo/home_repo.dart';
import 'package:dio/dio.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  Future<void> getBestSellerBooks() async {
    emit(GetBestSellerLaoding());
    try {
      final response = await HomeRepo.getBestSellerBooks();
      if (response is BooksModel) {
        emit(GetBestSellersuccess(products: response.data?.products));
      }
    } on DioException catch (e) {
      final error = DioExceptionHandler.handleDioException(e);
      emit(GetBestSellerError(error: error));
    } catch (e) {
      emit(GetBestSellerError(error: e.toString()));
    }
  }

  Future<void> search(String text) async {
    emit(SearchLaoding());
    final data = await HomeRepo.search(text);
    if (data is List<Products>?) {
      emit(SearchSuccess(products: data));
    } else {
      emit(SearchError());
    }
  }
}
