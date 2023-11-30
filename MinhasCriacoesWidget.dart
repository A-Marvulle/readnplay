import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/quiz_sets_new_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'minhas_criacoes_model.dart';
export 'minhas_criacoes_model.dart';

class MinhasCriacoesWidget extends StatefulWidget {
  const MinhasCriacoesWidget({Key? key}) : super(key: key);

  @override
  _MinhasCriacoesWidgetState createState() => _MinhasCriacoesWidgetState();
}

class _MinhasCriacoesWidgetState extends State<MinhasCriacoesWidget> {
  late MinhasCriacoesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MinhasCriacoesModel());

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
        body: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                'assets/images/Fundo_-_Atualizado.png',
                width: MediaQuery.sizeOf(context).width,
                height: MediaQuery.sizeOf(context).height * 1,
                fit: BoxFit.cover,
              ),
            ),
            Align(
              alignment: AlignmentDirectional(0.00, -1.00),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 130, 0, 0),
                child: Container(
                  width: MediaQuery.sizeOf(context).width * 0.8,
                  height: MediaQuery.sizeOf(context).height * 0.3,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: FlutterFlowTheme.of(context).primaryText,
                      width: 2,
                    ),
                  ),
                  child: Stack(
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 50, 0, 0),
                        child: StreamBuilder<List<ReviewRecord>>(
                          stream: queryReviewRecord(
                            queryBuilder: (reviewRecord) => reviewRecord.where(
                              'user_id',
                              isEqualTo: currentUserReference,
                            ),
                          ),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return Center(
                                child: SizedBox(
                                  width: 50,
                                  height: 50,
                                  child: CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      FlutterFlowTheme.of(context).primary,
                                    ),
                                  ),
                                ),
                              );
                            }
                            List<ReviewRecord> listViewReviewRecordList =
                                snapshot.data!;
                            return ListView.separated(
                              padding: EdgeInsets.fromLTRB(
                                0,
                                10,
                                0,
                                15,
                              ),
                              scrollDirection: Axis.vertical,
                              itemCount: listViewReviewRecordList.length,
                              separatorBuilder: (_, __) => SizedBox(height: 50),
                              itemBuilder: (context, listViewIndex) {
                                final listViewReviewRecord =
                                    listViewReviewRecordList[listViewIndex];
                                return Align(
                                  alignment: AlignmentDirectional(0.00, 0.00),
                                  child: Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.7,
                                    height: 120,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBtnText,
                                      boxShadow: [
                                        BoxShadow(
                                          blurRadius: 4,
                                          color: Color(0xA5000000),
                                          offset: Offset(0, 2),
                                          spreadRadius: 1,
                                        )
                                      ],
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        context.pushNamed(
                                          'VerReview',
                                          queryParameters: {
                                            'reviewEscolhida': serializeParam(
                                              listViewReviewRecord.reference,
                                              ParamType.DocumentReference,
                                            ),
                                            'reviewTitulo': serializeParam(
                                              listViewReviewRecord.titulo,
                                              ParamType.String,
                                            ),
                                            'reviewLivro': serializeParam(
                                              listViewReviewRecord.livro,
                                              ParamType.String,
                                            ),
                                            'reviewTexto': serializeParam(
                                              listViewReviewRecord.texto,
                                              ParamType.String,
                                            ),
                                            'userID': serializeParam(
                                              currentUserReference,
                                              ParamType.DocumentReference,
                                            ),
                                            'nomeAutor': serializeParam(
                                              currentUserDisplayName,
                                              ParamType.String,
                                            ),
                                            'ft': serializeParam(
                                              currentUserPhoto,
                                              ParamType.String,
                                            ),
                                          }.withoutNulls,
                                        );
                                      },
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 5, 0, 5),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          -0.75, -0.47),
                                                  child: Container(
                                                    width: 80,
                                                    height: 80,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      shape: BoxShape.circle,
                                                      border: Border.all(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        width: 2,
                                                      ),
                                                    ),
                                                    child: AuthUserStreamWidget(
                                                      builder: (context) =>
                                                          InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          context.pushNamed(
                                                            'VerReview',
                                                            queryParameters: {
                                                              'reviewEscolhida':
                                                                  serializeParam(
                                                                listViewReviewRecord
                                                                    .reference,
                                                                ParamType
                                                                    .DocumentReference,
                                                              ),
                                                              'reviewTitulo':
                                                                  serializeParam(
                                                                '',
                                                                ParamType
                                                                    .String,
                                                              ),
                                                              'reviewLivro':
                                                                  serializeParam(
                                                                '',
                                                                ParamType
                                                                    .String,
                                                              ),
                                                              'reviewTexto':
                                                                  serializeParam(
                                                                '',
                                                                ParamType
                                                                    .String,
                                                              ),
                                                              'userID':
                                                                  serializeParam(
                                                                listViewReviewRecord
                                                                    .userId,
                                                                ParamType
                                                                    .DocumentReference,
                                                              ),
                                                              'nomeAutor':
                                                                  serializeParam(
                                                                listViewReviewRecord
                                                                    .nomeAutor,
                                                                ParamType
                                                                    .String,
                                                              ),
                                                              'ft':
                                                                  serializeParam(
                                                                currentUserPhoto,
                                                                ParamType
                                                                    .String,
                                                              ),
                                                            }.withoutNulls,
                                                          );
                                                        },
                                                        child: Hero(
                                                          tag: valueOrDefault<
                                                              String>(
                                                            currentUserPhoto,
                                                            'https://images.unsplash.com/photo-1511367461989-f85a21fda167?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwxfHxwcm9maWxlfGVufDB8fHx8MTY5NDM2NTYyMXww&ixlib=rb-4.0.3&q=80&w=400' +
                                                                '$listViewIndex',
                                                          ),
                                                          transitionOnUserGestures:
                                                              true,
                                                          child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        50),
                                                            child:
                                                                Image.network(
                                                              valueOrDefault<
                                                                  String>(
                                                                currentUserPhoto,
                                                                'https://images.unsplash.com/photo-1511367461989-f85a21fda167?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwxfHxwcm9maWxlfGVufDB8fHx8MTY5NDM2NTYyMXww&ixlib=rb-4.0.3&q=80&w=400',
                                                              ),
                                                              width: 50,
                                                              height: 50,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          -0.88, 0.84),
                                                  child: AuthUserStreamWidget(
                                                    builder: (context) => Text(
                                                      currentUserDisplayName
                                                          .maybeHandleOverflow(
                                                        maxChars: 15,
                                                        replacement: '…',
                                                      ),
                                                      maxLines: 1,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                fontSize: 12,
                                                              ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Expanded(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 10, 0, 0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.49, -0.83),
                                                        child: Text(
                                                          listViewReviewRecord
                                                              .titulo
                                                              .maybeHandleOverflow(
                                                            maxChars: 25,
                                                            replacement: '…',
                                                          ),
                                                          textAlign:
                                                              TextAlign.center,
                                                          maxLines: 1,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                fontSize: 12,
                                                              ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 0, 0, 35),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.54, 0.67),
                                                        child: Text(
                                                          listViewReviewRecord
                                                              .livro
                                                              .maybeHandleOverflow(
                                                            maxChars: 27,
                                                            replacement: '…',
                                                          ),
                                                          textAlign:
                                                              TextAlign.center,
                                                          maxLines: 1,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                fontSize: 12,
                                                              ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(-0.50, -0.90),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            context.pushNamed('MinhasReviews');
                          },
                          child: Text(
                            'Minhas Reviews',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Poppins',
                                  fontSize: 18,
                                ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(-0.89, -0.89),
                        child: Icon(
                          Icons.bookmark_sharp,
                          color: FlutterFlowTheme.of(context).menuSelecionado,
                          size: 24,
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(0.95, -0.90),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            context.pushNamed('MinhasReviews');
                          },
                          child: Icon(
                            Icons.navigate_next,
                            color: FlutterFlowTheme.of(context).menuSelecionado,
                            size: 24,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Align(
              alignment: AlignmentDirectional(0.00, 1.00),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 130),
                child: Container(
                  width: MediaQuery.sizeOf(context).width * 0.8,
                  height: MediaQuery.sizeOf(context).height * 0.3,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: FlutterFlowTheme.of(context).primaryText,
                      width: 2,
                    ),
                  ),
                  child: Align(
                    alignment: AlignmentDirectional(0.00, 0.00),
                    child: Stack(
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 50, 0, 0),
                          child: StreamBuilder<List<QuizzSetRecord>>(
                            stream: queryQuizzSetRecord(
                              queryBuilder: (quizzSetRecord) =>
                                  quizzSetRecord.where(
                                'user_id',
                                isEqualTo: currentUserReference,
                              ),
                            ),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                  child: SizedBox(
                                    width: 50,
                                    height: 50,
                                    child: CircularProgressIndicator(
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                        FlutterFlowTheme.of(context).primary,
                                      ),
                                    ),
                                  ),
                                );
                              }
                              List<QuizzSetRecord> listViewQuizzSetRecordList =
                                  snapshot.data!;
                              return ListView.separated(
                                padding: EdgeInsets.fromLTRB(
                                  0,
                                  10,
                                  0,
                                  15,
                                ),
                                scrollDirection: Axis.vertical,
                                itemCount: listViewQuizzSetRecordList.length,
                                separatorBuilder: (_, __) =>
                                    SizedBox(height: 50),
                                itemBuilder: (context, listViewIndex) {
                                  final listViewQuizzSetRecord =
                                      listViewQuizzSetRecordList[listViewIndex];
                                  return InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      context.pushNamed(
                                        'VerQuiz',
                                        queryParameters: {
                                          'nomeAutor': serializeParam(
                                            listViewQuizzSetRecord.nomeAutor,
                                            ParamType.String,
                                          ),
                                          'titulo': serializeParam(
                                            listViewQuizzSetRecord.quizName,
                                            ParamType.String,
                                          ),
                                          'totalQuestions': serializeParam(
                                            listViewQuizzSetRecord
                                                .totalQuestoes,
                                            ParamType.int,
                                          ),
                                          'quizDuracao': serializeParam(
                                            listViewQuizzSetRecord.duracao,
                                            ParamType.int,
                                          ),
                                          'quizSet': serializeParam(
                                            listViewQuizzSetRecord.reference,
                                            ParamType.DocumentReference,
                                          ),
                                          'ft': serializeParam(
                                            currentUserPhoto,
                                            ParamType.String,
                                          ),
                                          'userId': serializeParam(
                                            listViewQuizzSetRecord.userId,
                                            ParamType.DocumentReference,
                                          ),
                                          'livro': serializeParam(
                                            listViewQuizzSetRecord.livro,
                                            ParamType.String,
                                          ),
                                        }.withoutNulls,
                                      );
                                    },
                                    child: QuizSetsNewWidget(
                                      key: Key(
                                          'Keyqah_${listViewIndex}_of_${listViewQuizzSetRecordList.length}'),
                                      titulo: listViewQuizzSetRecord.quizName,
                                      descricao:
                                          listViewQuizzSetRecord.descricao,
                                      totalQuestoes:
                                          listViewQuizzSetRecord.totalQuestoes,
                                      quizDuracao:
                                          listViewQuizzSetRecord.duracao /
                                              60000,
                                      livro: listViewQuizzSetRecord.livro,
                                      quizSet: listViewQuizzSetRecord.reference,
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(-0.45, -0.92),
                          child: Text(
                            'Meus Quizzes',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Poppins',
                                  fontSize: 18,
                                ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(-0.89, -0.90),
                          child: FaIcon(
                            FontAwesomeIcons.gamepad,
                            color: FlutterFlowTheme.of(context).menuSelecionado,
                            size: 24,
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(0.94, -0.89),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              context.pushNamed('MeusQuizzes');
                            },
                            child: Icon(
                              Icons.navigate_next,
                              color:
                                  FlutterFlowTheme.of(context).menuSelecionado,
                              size: 24,
                            ),
                          ),
                        ),
                      ],
                    ),
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
                      onPressed: () async {
                        context.pushNamed(
                          'Home',
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
                        Icons.home_rounded,
                        color: Color(0xFF3C3FC8),
                        size: 44,
                      ),
                      options: FFButtonOptions(
                        width: 70,
                        height: 55,
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                        iconPadding: EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
                        color: FlutterFlowTheme.of(context).primaryBtnText,
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  fontFamily: 'Poppins',
                                  color: Colors.white,
                                ),
                        borderSide: BorderSide(
                          color: Color(0xFFA8A8A8),
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
                        color: FlutterFlowTheme.of(context).menuSelecionado,
                        size: 38,
                      ),
                      options: FFButtonOptions(
                        width: 70,
                        height: 55,
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                        iconPadding: EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
                        color: Color(0xFFF0F0F0),
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
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
                      onPressed: () {
                        print('Button pressed ...');
                      },
                      text: '',
                      icon: FaIcon(
                        FontAwesomeIcons.solidBookmark,
                        color: FlutterFlowTheme.of(context).primaryBtnText,
                        size: 38,
                      ),
                      options: FFButtonOptions(
                        width: 70,
                        height: 70,
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                        iconPadding: EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
                        color: Color(0xFF3C3FC8),
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  fontFamily: 'Poppins',
                                  color: Colors.white,
                                ),
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).primaryText,
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
                      color: FlutterFlowTheme.of(context).menuSelecionado,
                      size: 38,
                    ),
                    options: FFButtonOptions(
                      width: 70,
                      height: 55,
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                      iconPadding: EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
                      color: Color(0xFFF0F0F0),
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
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
    );
  }
}
