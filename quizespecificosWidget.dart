import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'quizes_especificos_model.dart';
export 'quizes_especificos_model.dart';

class QuizesEspecificosWidget extends StatefulWidget {
  const QuizesEspecificosWidget({
    Key? key,
    required this.livro,
  }) : super(key: key);

  final String? livro;

  @override
  _QuizesEspecificosWidgetState createState() =>
      _QuizesEspecificosWidgetState();
}

class _QuizesEspecificosWidgetState extends State<QuizesEspecificosWidget> {
  late QuizesEspecificosModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => QuizesEspecificosModel());

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
                          padding: EdgeInsetsDirectional.fromSTEB(0, 45, 0, 0),
                          child: StreamBuilder<List<QuizzSetRecord>>(
                            stream: queryQuizzSetRecord(
                              queryBuilder: (quizzSetRecord) =>
                                  quizzSetRecord.where(
                                'livro',
                                isEqualTo: widget.livro,
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
                              return ListView.builder(
                                padding: EdgeInsets.zero,
                                scrollDirection: Axis.vertical,
                                itemCount: listViewQuizzSetRecordList.length,
                                itemBuilder: (context, listViewIndex) {
                                  final listViewQuizzSetRecord =
                                      listViewQuizzSetRecordList[listViewIndex];
                                  return Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        15, 0, 15, 15),
                                    child: StreamBuilder<UserRecord>(
                                      stream: UserRecord.getDocument(
                                          listViewQuizzSetRecord.userId!),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: SizedBox(
                                              width: 50,
                                              height: 50,
                                              child: CircularProgressIndicator(
                                                valueColor:
                                                    AlwaysStoppedAnimation<
                                                        Color>(
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                                ),
                                              ),
                                            ),
                                          );
                                        }
                                        final containerUserRecord =
                                            snapshot.data!;
                                        return InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            context.pushNamed(
                                              'VerQuiz',
                                              queryParameters: {
                                                'quizDuracao': serializeParam(
                                                  listViewQuizzSetRecord
                                                      .duracao,
                                                  ParamType.int,
                                                ),
                                                'quizSet': serializeParam(
                                                  listViewQuizzSetRecord
                                                      .reference,
                                                  ParamType.DocumentReference,
                                                ),
                                                'nomeAutor': serializeParam(
                                                  listViewQuizzSetRecord
                                                      .nomeAutor,
                                                  ParamType.String,
                                                ),
                                                'titulo': serializeParam(
                                                  listViewQuizzSetRecord
                                                      .quizName,
                                                  ParamType.String,
                                                ),
                                                'totalQuestions':
                                                    serializeParam(
                                                  listViewQuizzSetRecord
                                                      .totalQuestoes,
                                                  ParamType.int,
                                                ),
                                                'ft': serializeParam(
                                                  containerUserRecord.photoUrl,
                                                  ParamType.String,
                                                ),
                                                'userId': serializeParam(
                                                  listViewQuizzSetRecord.userId,
                                                  ParamType.DocumentReference,
                                                ),
                                                'livro': serializeParam(
                                                  widget.livro,
                                                  ParamType.String,
                                                ),
                                              }.withoutNulls,
                                            );
                                          },
                                          child: Container(
                                            width: 470,
                                            height: 116,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .menuSelecionado,
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
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(15, 0, 5, 0),
                                              child: ListTile(
                                                title: Text(
                                                  listViewQuizzSetRecord
                                                      .quizName
                                                      .maybeHandleOverflow(
                                                    maxChars: 20,
                                                    replacement: '…',
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .titleLarge
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .lineColor,
                                                        fontSize: 18,
                                                      ),
                                                ),
                                                subtitle: Text(
                                                  'Questões:${listViewQuizzSetRecord.totalQuestoes.toString()}'
                                                      .maybeHandleOverflow(
                                                    maxChars: 30,
                                                    replacement: '…',
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .lineColor,
                                                      ),
                                                ),
                                                trailing: Icon(
                                                  Icons.arrow_forward_ios,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .lineColor,
                                                  size: 20,
                                                ),
                                                dense: false,
                                                contentPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(0, 0, 0, 0),
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(-0.74, -0.78),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Align(
                                alignment: AlignmentDirectional(0.00, 0.00),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    context.safePop();
                                  },
                                  child: Icon(
                                    Icons.chevron_left_outlined,
                                    color: FlutterFlowTheme.of(context)
                                        .menuSelecionado,
                                    size: 30,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(-0.07, -0.79),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                        child: ClipRRect(
                          child: Container(
                            width: 250,
                            height: 40,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                            child: Align(
                              alignment: AlignmentDirectional(0.00, 0.00),
                              child: AutoSizeText(
                                widget.livro!,
                                textAlign: TextAlign.center,
                                maxLines: 1,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Poppins',
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                    ),
                                minFontSize: 6,
                              ),
                            ),
                          ),
                        ),
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
