import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simpati/core/resources/app_color.dart';
import 'package:simpati/core/resources/app_text_style.dart';
import 'package:simpati/core/utils/form_utils.dart';
import 'package:simpati/presentation/auth/bloc.dart';

class AuthScreen extends StatelessWidget {
  final FocusNode nextNode = FocusNode();

  Widget createAppBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      iconTheme: IconThemeData(color: AppColor.primaryColor),
      titleSpacing: 0,
      backgroundColor: AppColor.appBackground,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (ctx) => AuthBloc(),
      child: BlocListener<AuthBloc, AuthState>(
        listener: (prev, next) {},
        child: Scaffold(
          appBar: createAppBar(context),
          backgroundColor: AppColor.appBackground,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: getContents(),
          ),
        ),
      ),
    );
  }

  List<Widget> getContents() {
    return [
      Expanded(
        child: Builder(
          builder: (ctx) => ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.only(left: 21, right: 21, bottom: 16),
            children: getForms(),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 21, right: 21, bottom: 16),
        child: Container(
          width: double.infinity,
          child: Builder(
            builder: (ctx) => FlatButton(
              color: AppColor.primaryColor,
              textColor: Colors.white,
              onPressed: () {
                BlocProvider.of<AuthBloc>(ctx).add(AuthEvent());
              },
              child: Text('Login'),
            ),
          ),
        ),
      )
    ];
  }

  String getEmailErrorText(AuthState state) {
    if (state == AuthState.EmailEmpty) {
      return 'Kolom email tidak boleh kosong';
    } else if (state == AuthState.EmailError) {
      return 'Format Email Salah';
    }
    return null;
  }

  String getPasswordErrorText(AuthState state) {
    if (state == AuthState.PasswordEmpty) {
      return 'Kolom password tidak boleh kosong';
    } else if (state == AuthState.PasswordError) {
      return 'Panjang password kurang';
    }
    return null;
  }

  List<Widget> getForms() {
    return [
      Text('Login', style: AppTextStyle.registerTitle),
      Text(
        'Gunakan email dan password yang telah diberikan',
        style: AppTextStyle.titleName.copyWith(fontSize: 12),
      ),
      Container(height: 24),
      BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
        final bloc = BlocProvider.of<AuthBloc>(context);
        return FormUtils.buildField(
          'Email',
          inputType: TextInputType.emailAddress,
          nextForm: NextForm(FocusScope.of(context), nextNode),
          onChanged: (data) => bloc.add(AuthEmailFillEvent(data)),
          errorText: getEmailErrorText(state),
        );
      }),
      Container(height: 8),
      BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
        final bloc = BlocProvider.of<AuthBloc>(context);
        return FormUtils.buildField(
          'Password',
          obscureText: true,
          focusNode: nextNode,
          onChanged: (data) => bloc.add(AuthEmailPasswordEvent(data)),
          errorText: getPasswordErrorText(state),
        );
      }),
    ];
  }
}
