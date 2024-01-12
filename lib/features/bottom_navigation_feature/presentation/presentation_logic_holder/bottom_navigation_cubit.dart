import 'package:esm/features/account_feature/presentation/screens/account_screen.dart';
import 'package:esm/features/categories_feature/presentation/screens/user_categories_screen.dart';
import 'package:esm/features/price_feature/presentation/screens/home_company_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bottom_navigation_state.dart';

class BottomNavigationCubit extends Cubit<BottomNavigationStats> {
  BottomNavigationCubit() : super(BottomNavigationInitial());
  static BottomNavigationCubit getObject(BuildContext context) => BlocProvider.of(context);
  int currentIndex = 0;
  List<Widget> screens =const  [
    // HomeScreen(),
    // AllCategoriesScreen(),
    // CartScreen(),
    HomeCompanyScreen(),
    UserCategoriesScreen(fromCompany: true,),
    AccountScreen(),
  ];
  void changeCurrent(int index)
  {
    currentIndex = index;
    emit(ChangeBottomNavigationIndex());
  }
}
