
import 'package:go_router/go_router.dart';


abstract class AppRouter {
  static const kLoginview = '/loginView';
  static const kforgetView = '/forgetView';
  static const kPasswordResetScreen = '/PasswordResetScreen';
  static const kchangepassword = 'resetPassword';
  static const bottomnav = '/bottomnav';
  static const invtation = '/invtation';
  static const invtationuser = '/invtationuser';
  static const account = '/account';
  static const chat = '/chat';
  static const kmember = "/member";
  static const vilaaccount = "/VilaAccount";
  static const pastinvitaion = "/PastInvitations";
  static final router = GoRouter(
    routes: [
      // GoRoute(path: '/', builder: (context, state) => const Splashscreen()),
      // GoRoute(
      //   path: kLoginview,
      //   builder: (context, state) => const LoginScreen(),
      // ),


    ],
  );
}
