import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'login_model.dart';
export 'login_model.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({Key? key}) : super(key: key);

  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  late LoginModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LoginModel());

    _model.emailTextController ??= TextEditingController();
    _model.textFieldFocusNode1 ??= FocusNode();

    _model.passwordTextController ??= TextEditingController();
    _model.textFieldFocusNode2 ??= FocusNode();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white,
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              width: MediaQuery.sizeOf(context).width,
              height: 299,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
              ),
              child: Stack(
                children: [
                  Align(
                    alignment: AlignmentDirectional(-0.02, -0.25),
                    child: Container(
                      width: MediaQuery.sizeOf(context).width * 2,
                      height: MediaQuery.sizeOf(context).height * 1.16,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: Image.asset(
                            'assets/images/LivrosLogin(com_sombra).png',
                          ).image,
                        ),
                        borderRadius: BorderRadius.circular(0),
                        shape: BoxShape.rectangle,
                      ),
                      child: Align(
                        alignment: AlignmentDirectional(-0.01, 0.60),
                        child: Material(
                          color: Colors.transparent,
                          elevation: 5,
                          shape: const CircleBorder(),
                          child: Container(
                            width: 150,
                            height: 150,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              shape: BoxShape.circle,
                              border: Border.all(
                                width: 0.3,
                              ),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.asset(
                                'assets/images/imagem_2023-08-26_105512191.png',
                                width: 287,
                                height: 200,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 50, 0, 0),
                child: Container(
                  width: MediaQuery.sizeOf(context).width,
                  height: 100,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).primaryBtnText,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(50, 0, 50, 0),
                              child: Container(
                                width: 300,
                                child: TextFormField(
                                  controller: _model.emailTextController,
                                  focusNode: _model.textFieldFocusNode1,
                                  onFieldSubmitted: (_) async {
                                    GoRouter.of(context).prepareAuthEvent();

                                    final user =
                                        await authManager.signInWithEmail(
                                      context,
                                      _model.emailTextController.text,
                                      _model.passwordTextController.text,
                                    );
                                    if (user == null) {
                                      return;
                                    }

                                    context.goNamedAuth(
                                        'Home', context.mounted);
                                  },
                                  autofocus: true,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    isDense: true,
                                    hintText: 'Email',
                                    hintStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Poppins',
                                          color: Colors.white,
                                          fontSize: 18,
                                        ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00FFFFFF),
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xFF172253),
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xFFF80101),
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xFFF80101),
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    filled: true,
                                    fillColor: Color(0xFF3C3FC8),
                                    prefixIcon: Icon(
                                      Icons.alternate_email,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBtnText,
                                      size: 32,
                                    ),
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Roboto',
                                        color: Colors.white,
                                        fontSize: 18,
                                        letterSpacing: 2,
                                      ),
                                  textAlign: TextAlign.start,
                                  keyboardType: TextInputType.emailAddress,
                                  validator: _model.emailTextControllerValidator
                                      .asValidator(context),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    50, 20, 50, 0),
                                child: Container(
                                  width: 300,
                                  child: TextFormField(
                                    controller: _model.passwordTextController,
                                    focusNode: _model.textFieldFocusNode2,
                                    obscureText: !_model.passwordVisibility,
                                    decoration: InputDecoration(
                                      isDense: true,
                                      hintText: 'Senha',
                                      hintStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Poppins',
                                            color: Colors.white,
                                            fontSize: 18,
                                          ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00FFFFFF),
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xFF172253),
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xFFF80101),
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xFFF80101),
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      filled: true,
                                      fillColor: Color(0xFF3C3FC8),
                                      prefixIcon: Icon(
                                        Icons.lock_sharp,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBtnText,
                                        size: 32,
                                      ),
                                      suffixIcon: InkWell(
                                        onTap: () => setState(
                                          () => _model.passwordVisibility =
                                              !_model.passwordVisibility,
                                        ),
                                        focusNode:
                                            FocusNode(skipTraversal: true),
                                        child: Icon(
                                          _model.passwordVisibility
                                              ? Icons.visibility_outlined
                                              : Icons.visibility_off_outlined,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                          size: 22,
                                        ),
                                      ),
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Roboto',
                                          color: Colors.white,
                                          fontSize: 18,
                                          letterSpacing: 2,
                                        ),
                                    textAlign: TextAlign.start,
                                    keyboardType: TextInputType.visiblePassword,
                                    validator: _model
                                        .passwordTextControllerValidator
                                        .asValidator(context),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 50, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                context.pushNamed(
                                  'EsqueciSenha',
                                  extra: <String, dynamic>{
                                    kTransitionInfoKey: TransitionInfo(
                                      hasTransition: true,
                                      transitionType:
                                          PageTransitionType.rightToLeft,
                                      duration: Duration(milliseconds: 300),
                                    ),
                                  },
                                );
                              },
                              child: Text(
                                'Esqueci minha senha',
                                textAlign: TextAlign.end,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Roboto',
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                      decoration: TextDecoration.underline,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 80, 0, 0),
                        child: Container(
                          height: 50,
                          child: Stack(
                            children: [
                              Align(
                                alignment: AlignmentDirectional(0.00, 0.29),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    GoRouter.of(context).prepareAuthEvent();

                                    final user =
                                        await authManager.signInWithEmail(
                                      context,
                                      _model.emailTextController.text,
                                      _model.passwordTextController.text,
                                    );
                                    if (user == null) {
                                      return;
                                    }

                                    context.goNamedAuth(
                                        'Home', context.mounted);
                                  },
                                  text: 'Entrar',
                                  options: FFButtonOptions(
                                    height: 40,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        40, 0, 60, 0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 1000, 0),
                                    color: Color(0xFF172253),
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleLarge
                                        .override(
                                          fontFamily: 'Roboto',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w300,
                                        ),
                                    elevation: 3,
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  showLoadingIndicator: false,
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(0.30, 0.50),
                                child: FlutterFlowIconButton(
                                  borderColor: Colors.transparent,
                                  borderRadius: 0,
                                  borderWidth: 0,
                                  buttonSize: 45,
                                  icon: FaIcon(
                                    FontAwesomeIcons.chevronCircleRight,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    size: 25,
                                  ),
                                  onPressed: () {
                                    print('IconButton pressed ...');
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          context.pushNamed(
                            'CadastroUsuario',
                            extra: <String, dynamic>{
                              kTransitionInfoKey: TransitionInfo(
                                hasTransition: true,
                                transitionType: PageTransitionType.rightToLeft,
                                duration: Duration(milliseconds: 300),
                              ),
                            },
                          );
                        },
                        child: Text(
                          'Cadastrar-se',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Roboto',
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    decoration: TextDecoration.underline,
                                  ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
