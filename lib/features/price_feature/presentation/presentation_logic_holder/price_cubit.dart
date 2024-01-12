import 'package:esm/app/model/price_list_model.dart';
import 'package:esm/features/price_feature/presentation/presentation_logic_holder/price_states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PriceCubit extends Cubit<PriceSates>{
  PriceCubit():super(PriceInitialState());
  static PriceCubit getObject({required BuildContext context}) => BlocProvider.of(context);
  List<PriceListModel> myPriceList =[];

  void addNewPriceList({
    required String category,
    required String subCategory,
    required String product,
    required String price,
}){
    myPriceList.add(PriceListModel(
         category: category,
         subCategory: subCategory,
         product: product,
         price: price,
     ));
    emit(AddPriceSuccessState());
  }
}