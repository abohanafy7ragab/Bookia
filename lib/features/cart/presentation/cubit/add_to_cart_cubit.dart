import 'package:bloc/bloc.dart';
import 'package:bookia/features/cart/data/repo/cart_repo.dart';
import 'package:meta/meta.dart';

part 'add_to_cart_state.dart';

class AddToCartCubit extends Cubit<AddToCartState> {
  AddToCartCubit() : super(AddToCartInitial());

  addToCart(int productId) async {
    emit(AddToCartLaoding());
    final response = await CartRepo.addToCart(productId);
    if (response) {
      emit(AddToCartSuccess());
    } else {
      emit(AddToCartError());
    }
  }
}
