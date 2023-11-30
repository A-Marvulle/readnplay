import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'home_model.dart';
export 'home_model.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  late HomeModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomeModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
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
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              child: Container(
                width: MediaQuery.sizeOf(context).width,
                height: MediaQuery.sizeOf(context).height * 0.9,
                child: Stack(
                  children: [
                    Align(
                      alignment: AlignmentDirectional(-0.63, -0.86),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          'assets/images/Fundo_-_Atualizado.png',
                          width: MediaQuery.sizeOf(context).width,
                          height: MediaQuery.sizeOf(context).height * 1,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.00, 0.00),
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 0.8,
                        height: MediaQuery.sizeOf(context).height * 0.8,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
                          child: ListView(
                            padding: EdgeInsets.fromLTRB(
                              0,
                              10,
                              0,
                              10,
                            ),
                            scrollDirection: Axis.vertical,
                            children: [
                              AuthUserStreamWidget(
                                builder: (context) => Builder(
                                  builder: (context) {
                                    final item = (currentUserDocument?.genFav
                                                ?.toList() ??
                                            [])
                                        .toList();
                                    return Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: List.generate(item.length,
                                          (itemIndex) {
                                        final itemItem = item[itemIndex];
                                        return Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 0, 0, 15),
                                          child: Container(
                                            width: 470,
                                            height: 100,
                                            decoration: BoxDecoration(
                                              color: () {
                                                if (itemItem ==
                                                    'Ação e aventura') {
                                                  return Color(0xFF8C0F0F);
                                                } else if (itemItem ==
                                                    'Agricultura') {
                                                  return Color(0xFF3E9411);
                                                } else if (itemItem ==
                                                    'Autoajuda') {
                                                  return Color(0xFF136189);
                                                } else if (itemItem ==
                                                    'Biografias') {
                                                  return Color(0xFF136189);
                                                } else if (itemItem ==
                                                    'Casa e jardim') {
                                                  return Color(0xFF3E9411);
                                                } else if (itemItem ==
                                                    'Chegando à maioridade') {
                                                  return Color(0xFF136189);
                                                } else if (itemItem ==
                                                    'Clássicos') {
                                                  return Color(0xFF092472);
                                                } else if (itemItem ==
                                                    'Contos') {
                                                  return Color(0xFF092472);
                                                } else if (itemItem ==
                                                    'Crime Verdadeiro') {
                                                  return Color(0xFF333333);
                                                } else if (itemItem ==
                                                    'Culinária') {
                                                  return Color(0xFF641674);
                                                } else if (itemItem ==
                                                    'Cultural e étnico') {
                                                  return Color(0xFF641674);
                                                } else if (itemItem ==
                                                    'Educação e Referência') {
                                                  return Color(0xFF641674);
                                                } else if (itemItem ==
                                                    'Esportes e atividades ao ar livre') {
                                                  return Color(0xFF641674);
                                                } else if (itemItem ==
                                                    'Fantasia') {
                                                  return Color(0xFF8C0F0F);
                                                } else if (itemItem ==
                                                    'Ficção') {
                                                  return Color(0xFF8C0F0F);
                                                } else if (itemItem ==
                                                    'Mistério e crime') {
                                                  return Color(0xFF333333);
                                                } else if (itemItem ==
                                                    'Natureza') {
                                                  return Color(0xFF3E9411);
                                                } else if (itemItem ==
                                                    'Romance') {
                                                  return Color(0xFFD00782);
                                                } else if (itemItem ==
                                                    'Sexo e Relacionamentos') {
                                                  return Color(0xFFD00782);
                                                } else if (itemItem ==
                                                    'Thriller e Suspense') {
                                                  return Color(0xFF333333);
                                                } else if (itemItem ==
                                                    'Fotografia') {
                                                  return Color(0xFF1DB984);
                                                } else if (itemItem ==
                                                    'Livros Didáticos') {
                                                  return Color(0xFF092472);
                                                } else if (itemItem ==
                                                    'Nova era') {
                                                  return Color(0xFFD00782);
                                                } else if (itemItem ==
                                                    'Paternidade e famílias') {
                                                  return Color(0xFF641674);
                                                } else if (itemItem ==
                                                    'Peças e roteiros') {
                                                  return Color(0xFF092472);
                                                } else if (itemItem ==
                                                    'Poesia') {
                                                  return Color(0xFF092472);
                                                } else if (itemItem ==
                                                    'Projeto') {
                                                  return Color(0xFF1DB984);
                                                } else if (itemItem ==
                                                    'Quadrinhos e romances gráficos') {
                                                  return Color(0xFF8C0F0F);
                                                } else if (itemItem ==
                                                    'Religião e Espiritualidade') {
                                                  return Color(0xFF641674);
                                                } else if (itemItem ==
                                                    'Saúde e Bem-Estar') {
                                                  return Color(0xFFE5CE2F);
                                                } else if (itemItem ==
                                                    'Tecnologia') {
                                                  return Color(0xFF641674);
                                                } else if (itemItem ==
                                                    'Temáticas e motivações') {
                                                  return Color(0xFF136189);
                                                } else if (itemItem ==
                                                    'Faça você mesmo e artesanato') {
                                                  return Color(0xFF136189);
                                                } else if (itemItem ==
                                                    'Inspirador') {
                                                  return Color(0xFF136189);
                                                } else {
                                                  return FlutterFlowTheme.of(
                                                          context)
                                                      .menuSelecionado;
                                                }
                                              }(),
                                              boxShadow: [
                                                BoxShadow(
                                                  blurRadius: 4,
                                                  color: Color(0xFF333333),
                                                  offset: Offset(1, 5),
                                                  spreadRadius: 1,
                                                )
                                              ],
                                              borderRadius: BorderRadius.only(
                                                bottomLeft: Radius.circular(2),
                                                bottomRight:
                                                    Radius.circular(25),
                                                topLeft: Radius.circular(2),
                                                topRight: Radius.circular(25),
                                              ),
                                              border: Border.all(
                                                color: Colors.transparent,
                                              ),
                                            ),
                                            alignment: AlignmentDirectional(
                                                0.00, 0.00),
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                context.pushNamed(
                                                  'GenerosFav',
                                                  queryParameters: {
                                                    'gen': serializeParam(
                                                      itemItem,
                                                      ParamType.String,
                                                    ),
                                                  }.withoutNulls,
                                                );
                                              },
                                              onLongPress: () async {
                                                ScaffoldMessenger.of(context)
                                                    .clearSnackBars();
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  SnackBar(
                                                    content: Text(
                                                      itemItem,
                                                      style: TextStyle(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                      ),
                                                    ),
                                                    duration: Duration(
                                                        milliseconds: 4000),
                                                    backgroundColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .secondary,
                                                  ),
                                                );
                                              },
                                              child: ListTile(
                                                leading: FaIcon(
                                                  FontAwesomeIcons.book,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBtnText,
                                                  size: 30,
                                                ),
                                                title: Text(
                                                  itemItem,
                                                  textAlign: TextAlign.start,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .headlineSmall
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryBtnText,
                                                        fontSize: 15,
                                                        lineHeight: 2,
                                                      ),
                                                ),
                                                trailing: Icon(
                                                  Icons
                                                      .arrow_forward_ios_rounded,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBtnText,
                                                  size: 20,
                                                ),
                                                dense: false,
                                                contentPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(10, 0, 10, 0),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(0),
                                                ),
                                              ),
                                            ),
                                          ),
                                        );
                                      }),
                                    );
                                  },
                                ),
                              ),
                            ].divide(SizedBox(height: 50)),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.00, 1.00),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 5, 0),
                            child: FFButtonWidget(
                              onPressed: () {
                                print('Button pressed ...');
                              },
                              text: '',
                              icon: Icon(
                                Icons.home_rounded,
                                size: 44,
                              ),
                              options: FFButtonOptions(
                                width: 70,
                                height: 70,
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                iconPadding:
                                    EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
                                color: Color(0xFF3C3FC8),
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Poppins',
                                      color: Colors.white,
                                    ),
                                borderSide: BorderSide(
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  width: 3,
                                ),
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(8),
                                  bottomRight: Radius.circular(8),
                                  topLeft: Radius.circular(50),
                                  topRight: Radius.circular(50),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 5, 0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                context.pushNamed(
                                  'PesquisarReview',
                                  extra: <String, dynamic>{
                                    kTransitionInfoKey: TransitionInfo(
                                      hasTransition: true,
                                      transitionType: PageTransitionType.fade,
                                      duration: Duration(milliseconds: 0),
                                    ),
                                  },
                                );
                              },
                              text: '',
                              icon: Icon(
                                Icons.search,
                                color: Color(0xFF3C3FC8),
                                size: 38,
                              ),
                              options: FFButtonOptions(
                                width: 70,
                                height: 55,
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                iconPadding:
                                    EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
                                color: Color(0xFFF0F0F0),
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Poppins',
                                      color: Colors.white,
                                    ),
                                borderSide: BorderSide(
                                  color: Color(0xFF9D9D9D),
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(8),
                                  bottomRight: Radius.circular(8),
                                  topLeft: Radius.circular(50),
                                  topRight: Radius.circular(50),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 5, 0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                context.pushNamed(
                                  'MinhasCriacoes',
                                  extra: <String, dynamic>{
                                    kTransitionInfoKey: TransitionInfo(
                                      hasTransition: true,
                                      transitionType: PageTransitionType.fade,
                                      duration: Duration(milliseconds: 0),
                                    ),
                                  },
                                );
                              },
                              text: '',
                              icon: FaIcon(
                                FontAwesomeIcons.solidBookmark,
                                color: Color(0xFF3C3FC8),
                                size: 38,
                              ),
                              options: FFButtonOptions(
                                width: 70,
                                height: 55,
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                iconPadding:
                                    EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
                                color: Color(0xFFF0F0F0),
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Poppins',
                                      color: Colors.white,
                                    ),
                                borderSide: BorderSide(
                                  color: Color(0xFF9D9D9D),
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(8),
                                  bottomRight: Radius.circular(8),
                                  topLeft: Radius.circular(50),
                                  topRight: Radius.circular(50),
                                ),
                              ),
                            ),
                          ),
                          FFButtonWidget(
                            onPressed: () async {
                              context.pushNamed(
                                'Perfil',
                                extra: <String, dynamic>{
                                  kTransitionInfoKey: TransitionInfo(
                                    hasTransition: true,
                                    transitionType: PageTransitionType.fade,
                                    duration: Duration(milliseconds: 0),
                                  ),
                                },
                              );
                            },
                            text: '',
                            icon: FaIcon(
                              FontAwesomeIcons.userAlt,
                              color: Color(0xFF3C3FC8),
                              size: 38,
                            ),
                            options: FFButtonOptions(
                              width: 70,
                              height: 55,
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                              iconPadding:
                                  EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
                              color: Color(0xFFF0F0F0),
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: Colors.white,
                                  ),
                              borderSide: BorderSide(
                                color: Color(0xFF9D9D9D),
                                width: 1,
                              ),
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(8),
                                bottomRight: Radius.circular(8),
                                topLeft: Radius.circular(50),
                                topRight: Radius.circular(50),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
