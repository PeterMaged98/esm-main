import 'package:esm/features/auth_feature/presentation/presentation_logic_holder/auth_states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class AuthCubit extends Cubit<AuthStates> {
  AuthCubit() : super(AuthInitialState());
  static AuthCubit getObject({required BuildContext context}) => BlocProvider.of(context);
  bool passObscure = true;
  bool newPassObscure = true;
  bool oldPassObscure = true;
  void changeVisible(){
    passObscure = !passObscure;
    emit(AuthVisiablePasswordState());
  }
  void changeNewPassVisible(){
    newPassObscure = !newPassObscure;
    emit(AuthVisiableNewPasswordState());
  }
  void changeOldPassVisible(){
    oldPassObscure = !oldPassObscure;
    emit(AuthVisiableOldPasswordState());
  }
}
