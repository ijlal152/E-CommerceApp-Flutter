import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import '../../data/repositories/auth_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;
  AuthBloc({required this.authRepository}) : super(UnAuthenticatedState()) {
    on<SignInRequested>((event, emit) async{
      emit(LoadingState());
      try{
        await authRepository.signIn(
            email: event.email,
            password: event.password
        );
        emit(AuthenticatedState());
      }catch(e){
        emit(AuthErrorState(e.toString()));
        emit(UnAuthenticatedState());
      }
    });

    // When User Presses the SignUp Button,
    // we will send the SignUpRequest Event to the
    // AuthBloc to handle it and emit the Authenticated
    // State if the user is authenticated
    on<SignUpRequested>((event, emit) async {
      emit(LoadingState());
      try {
        await authRepository.signUp(
            email: event.email, password: event.password);
        emit(AuthenticatedState());
      } catch (e) {
        emit(AuthErrorState(e.toString()));
        emit(UnAuthenticatedState());
      }
    });

    // When User Presses the SignOut Button,
    // we will send the SignOutRequested Event to
    // the AuthBloc to handle it and emit the
    // UnAuthenticated State
    on<SignOutRequested>((event, emit) async {
      emit(LoadingState());
      await authRepository.signOut();
      emit(UnAuthenticatedState());
    });

  }
}
