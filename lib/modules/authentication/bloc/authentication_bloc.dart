import 'dart:async';

import 'package:ontari_app/providers/bloc_provider.dart';
import 'package:rxdart/rxdart.dart';

import '../enum/login_state.dart';
import '../wrapper/models/login_data.dart';
import '../wrapper/service/auth_service.dart';

class AuthenticationBloc extends BlocBase with Validators {
  final AuthService auth;

  AuthenticationBloc(this.auth);
  final _emailController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();

  Stream<String> get email => _emailController.stream.transform(validateEmail);
  Stream<String> get password =>
      _passwordController.stream.transform(validatePassword);

  Future<LoginState> _signIn(Future<LoginData?> signInMethod) async {
    try {
      final loginData = await signInMethod;
      if (loginData != null) {
        return LoginState.success;
      }
      return LoginState.fail;
    } catch (e) {
      rethrow;
    }
  }

  Future<LoginState> signInWithGmail() async {
    return _signIn(auth.loginWithGmail());
  }

  Future<LoginState> signInWithFacebook() async {
    return _signIn(auth.loginWithFacebook());
  }

  Future<LoginState> signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    return _signIn(
      auth.loginWithEmailAndPassword(
        _emailController.value,
        _passwordController.value,
      ),
    );
  }

  void updateEmail(String email) => _emailController.sink.add(email);
  void updatePassword(String password) => _passwordController.sink.add(password);

  @override
  void dispose() {
    _emailController.close();
    _passwordController.close();
  }
}

class Validators {
  final validateEmail =
      StreamTransformer<String, String>.fromHandlers(handleData: (email, sink) {
    if (email.contains('@')) {
      sink.add(email);
    } else {
      sink.addError('Enter a valid email');
    }
  });

  final validatePassword = StreamTransformer<String, String>.fromHandlers(
      handleData: (password, sink) {
    if (password.length > 6) {
      sink.add(password);
    } else {
      sink.addError('Invalid password, please enter more than 6 characters');
    }
  });
}
