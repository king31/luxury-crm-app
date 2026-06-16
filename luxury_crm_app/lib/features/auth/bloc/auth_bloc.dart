import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../services/auth_service.dart';
import '../../../core/models/user_model.dart';

// Events
abstract class AuthEvent extends Equatable {
  const AuthEvent();
  @override
  List<Object?> get props => [];
}

class AppStarted extends AuthEvent {}

class LoginRequested extends AuthEvent {
  final String email;
  final String password;
  const LoginRequested({required this.email, required this.password});
  @override
  List<Object?> get props => [email, password];
}

class RegisterRequested extends AuthEvent {
  final String email;
  final String password;
  final String fullName;
  final String phone;
  const RegisterRequested({
    required this.email,
    required this.password,
    required this.fullName,
    required this.phone,
  });
  @override
  List<Object?> get props => [email, password, fullName, phone];
}

class LogoutRequested extends AuthEvent {}

class UpdateUserProfile extends AuthEvent {
  final User user;
  const UpdateUserProfile({required this.user});
  @override
  List<Object?> get props => [user];
}

class ChangePassword extends AuthEvent {
  final String currentPassword;
  final String newPassword;
  const ChangePassword({required this.currentPassword, required this.newPassword});
  @override
  List<Object?> get props => [currentPassword, newPassword];
}

class ResetPasswordRequested extends AuthEvent {
  final String email;
  const ResetPasswordRequested({required this.email});
  @override
  List<Object?> get props => [email];
}

class ToggleBiometricAuth extends AuthEvent {
  final bool enabled;
  const ToggleBiometricAuth({required this.enabled});
  @override
  List<Object?> get props => [enabled];
}

// States
abstract class AuthState extends Equatable {
  const AuthState();
  @override
  List<Object?> get props => [];
}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthAuthenticated extends AuthState {
  final User user;
  const AuthAuthenticated({required this.user});
  @override
  List<Object?> get props => [user];
}

class AuthUnauthenticated extends AuthState {}

class AuthError extends AuthState {
  final String message;
  const AuthError(this.message);
  @override
  List<Object?> get props => [message];
}

class AuthPasswordResetSent extends AuthState {}

class AuthBiometricEnabled extends AuthState {
  final bool enabled;
  const AuthBiometricEnabled({required this.enabled});
  @override
  List<Object?> get props => [enabled];
}

// BLoC
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthService _authService;

  AuthBloc(this._authService) : super(AuthInitial()) {
    on<AppStarted>(_onAppStarted);
    on<LoginRequested>(_onLoginRequested);
    on<RegisterRequested>(_onRegisterRequested);
    on<LogoutRequested>(_onLogoutRequested);
    on<UpdateUserProfile>(_onUpdateUserProfile);
    on<ChangePassword>(_onChangePassword);
    on<ResetPasswordRequested>(_onResetPasswordRequested);
    on<ToggleBiometricAuth>(_onToggleBiometricAuth);
  }

  Future<void> _onAppStarted(AppStarted event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      final user = await _authService.getCurrentUser();
      if (user != null) {
        emit(AuthAuthenticated(user: user));
      } else {
        emit(AuthUnauthenticated());
      }
    } catch (e) {
      emit(AuthUnauthenticated());
    }
  }

  Future<void> _onLoginRequested(LoginRequested event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      final user = await _authService.login(event.email, event.password);
      emit(AuthAuthenticated(user: user));
    } catch (e) {
      emit(AuthError('فشل تسجيل الدخول: ${e.toString()}'));
    }
  }

  Future<void> _onRegisterRequested(RegisterRequested event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      final user = await _authService.register(
        email: event.email,
        password: event.password,
        fullName: event.fullName,
        phone: event.phone,
      );
      emit(AuthAuthenticated(user: user));
    } catch (e) {
      emit(AuthError('فشل إنشاء الحساب: ${e.toString()}'));
    }
  }

  Future<void> _onLogoutRequested(LogoutRequested event, Emitter<AuthState> emit) async {
    await _authService.logout();
    emit(AuthUnauthenticated());
  }

  Future<void> _onUpdateUserProfile(UpdateUserProfile event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      await _authService.updateUserProfile(event.user);
      emit(AuthAuthenticated(user: event.user));
    } catch (e) {
      emit(AuthError('فشل تحديث الملف الشخصي: ${e.toString()}'));
    }
  }

  Future<void> _onChangePassword(ChangePassword event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      await _authService.changePassword(event.currentPassword, event.newPassword);
      emit(AuthAuthenticated(user: (state as AuthAuthenticated).user));
    } catch (e) {
      emit(AuthError('فشل تغيير كلمة المرور: ${e.toString()}'));
    }
  }

  Future<void> _onResetPasswordRequested(ResetPasswordRequested event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      await _authService.resetPassword(event.email);
      emit(AuthPasswordResetSent());
    } catch (e) {
      emit(AuthError('فشل إرسال رابط إعادة التعيين: ${e.toString()}'));
    }
  }

  Future<void> _onToggleBiometricAuth(ToggleBiometricAuth event, Emitter<AuthState> emit) async {
    try {
      await _authService.toggleBiometricAuth(event.enabled);
      emit(AuthBiometricEnabled(enabled: event.enabled));
    } catch (e) {
      emit(AuthError('فشل تفعيل المصادقة البيومترية: ${e.toString()}'));
    }
  }
}
