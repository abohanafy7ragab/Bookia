import 'package:bloc/bloc.dart';
import 'package:bookia/features/home/data/models/Books_model.dart';
import 'package:bookia/features/home/data/repo/home_repo.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  getBestSellerBooks() async {
    emit(GetBestSellerLaoding());
    final response = await HomeRepo.getBestSellerBooks();
    if (response is BooksModel) {
      emit(GetBestSellersuccess(products: response.data?.products));
    } else {
      emit(GetBestSellerError());
    }
  }

  search(String text) async {
    emit(SearchLaoding());
    final data = await HomeRepo.search(text);
    if (data is List<Products>?) {
      emit(SearchSuccess(products: data));
      
    } else {
      emit(SearchError());
    }
  }
}
