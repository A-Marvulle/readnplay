import '/backend/backend.dart';
import '/components/quiz_option_new_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/instant_timer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

import 'responder_quizz_model.dart';
export 'responder_quizz_model.dart';

class ResponderQuizzWidget extends StatefulWidget {
  const ResponderQuizzWidget({
    Key? key,
    this.quizSetRef,
    this.quizDuracao,
    this.nomeLivro,
    this.quizSet,
  }) : super(key: key);

  final DocumentReference? quizSetRef;
  final int? quizDuracao;
  final String? nomeLivro;
  final DocumentReference? quizSet;

  @override
  _ResponderQuizzWidgetState createState() => _ResponderQuizzWidgetState();
}

class _ResponderQuizzWidgetState extends State<ResponderQuizzWidget> {
  late ResponderQuizzModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ResponderQuizzModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.instantTimer = InstantTimer.periodic(
        duration: Duration(milliseconds: 1000),
        callback: (timer) async {
          _model.timerController.onStartTimer();
        },
        startImmediately: true,
      );
    });

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

    return FutureBuilder<int>(
      future: queryQuizRecordCount(
        queryBuilder: (quizRecord) => quizRecord.where(
          'quiz_set',
          isEqualTo: widget.quizSetRef,
        ),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            body: Center(
              child: SizedBox(
                width: 50,
                height: 50,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        int responderQuizzCount = snapshot.data!;
        return GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            body: Container(
              width: MediaQuery.sizeOf(context).width,
              height: MediaQuery.sizeOf(context).height * 1,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: Image.asset(
                    'assets/images/Livros.jpeg',
                  ).image,
                ),
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(30, 150, 30, 50),
                child: Container(
                  width: MediaQuery.sizeOf(context).width,
                  height: MediaQuery.sizeOf(context).height * 1,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                if (FFAppState().completedQuestions > 0)
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        5, 0, 0, 0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        await _model.pageViewController
                                            ?.previousPage(
                                          duration: Duration(milliseconds: 300),
                                          curve: Curves.ease,
                                        );
                                        setState(() {
                                          _model.pageNavigate =
                                              _model.pageNavigate + -1;
                                        });
                                      },
                                      child: Icon(
                                        Icons.chevron_left,
                                        color: FlutterFlowTheme.of(context)
                                            .menuSelecionado,
                                        size: 40,
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(15, 10, 15, 10),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: 80,
                                  height: 27,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(
                                      width: 1,
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Icon(
                                        Icons.timer_sharp,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        size: 24,
                                      ),
                                      FlutterFlowTimer(
                                        initialTime: widget.quizDuracao!,
                                        getDisplayTime: (value) =>
                                            StopWatchTimer.getDisplayTime(
                                          value,
                                          hours: false,
                                          milliSecond: false,
                                        ),
                                        controller: _model.timerController,
                                        updateStateInterval:
                                            Duration(milliseconds: 1000),
                                        onChanged:
                                            (value, displayTime, shouldUpdate) {
                                          _model.timerMilliseconds = value;
                                          _model.timerValue = displayTime;
                                          if (shouldUpdate) setState(() {});
                                        },
                                        textAlign: TextAlign.start,
                                        style: FlutterFlowTheme.of(context)
                                            .headlineSmall
                                            .override(
                                              fontFamily: 'Poppins',
                                              fontSize: 16,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 50, 0),
                                  child: RichText(
                                    textScaleFactor:
                                        MediaQuery.of(context).textScaleFactor,
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: 'Q',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Poppins',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                fontWeight: FontWeight.bold,
                                              ),
                                        ),
                                        TextSpan(
                                          text: valueOrDefault<String>(
                                            (_model.pageNavigate + 1)
                                                .toString(),
                                            '0',
                                          ),
                                          style: TextStyle(),
                                        )
                                      ],
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium,
                                    ),
                                  ),
                                ),
                                Icon(
                                  Icons.grid_view_outlined,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  size: 24,
                                ),
                              ],
                            ),
                          ),
                          LinearPercentIndicator(
                            percent: valueOrDefault<double>(
                              FFAppState().completedQuestions /
                                  responderQuizzCount,
                              0.0,
                            ),
                            lineHeight: 9,
                            animation: true,
                            animateFromLastPercent: true,
                            progressColor: FlutterFlowTheme.of(context).primary,
                            backgroundColor:
                                FlutterFlowTheme.of(context).accent4,
                            barRadius: Radius.circular(0),
                            padding: EdgeInsets.zero,
                          ),
                        ],
                      ),
                      Expanded(
                        child: StreamBuilder<List<QuizRecord>>(
                          stream: queryQuizRecord(
                            queryBuilder: (quizRecord) => quizRecord.where(
                              'quiz_set',
                              isEqualTo: widget.quizSetRef,
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
                            List<QuizRecord> pageViewQuizRecordList =
                                snapshot.data!;
                            return Container(
                              width: double.infinity,
                              height: 500,
                              child: Stack(
                                children: [
                                  PageView.builder(
                                    controller: _model.pageViewController ??=
                                        PageController(
                                            initialPage: min(
                                                0,
                                                pageViewQuizRecordList.length -
                                                    1)),
                                    scrollDirection: Axis.horizontal,
                                    itemCount: pageViewQuizRecordList.length,
                                    itemBuilder: (context, pageViewIndex) {
                                      final pageViewQuizRecord =
                                          pageViewQuizRecordList[pageViewIndex];
                                      return Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 5, 0, 0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.00, 1.00),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    5, 0, 0, 0),
                                                        child: Container(
                                                          width: 316,
                                                          height: 100,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10),
                                                            border: Border.all(
                                                              width: 2,
                                                            ),
                                                          ),
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.00, 0.00),
                                                          child: Text(
                                                            pageViewQuizRecord
                                                                .questao,
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              ListView(
                                                padding: EdgeInsets.zero,
                                                shrinkWrap: true,
                                                scrollDirection: Axis.vertical,
                                                children: [
                                                  StreamBuilder<
                                                      List<QuestaoARecord>>(
                                                    stream: queryQuestaoARecord(
                                                      parent: pageViewQuizRecord
                                                          .reference,
                                                      singleRecord: true,
                                                    ),
                                                    builder:
                                                        (context, snapshot) {
                                                      // Customize what your widget looks like when it's loading.
                                                      if (!snapshot.hasData) {
                                                        return Center(
                                                          child: SizedBox(
                                                            width: 50,
                                                            height: 50,
                                                            child:
                                                                CircularProgressIndicator(
                                                              valueColor:
                                                                  AlwaysStoppedAnimation<
                                                                      Color>(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                              ),
                                                            ),
                                                          ),
                                                        );
                                                      }
                                                      List<QuestaoARecord>
                                                          quizOptionNewQuestaoARecordList =
                                                          snapshot.data!;
                                                      // Return an empty Container when the item does not exist.
                                                      if (snapshot
                                                          .data!.isEmpty) {
                                                        return Container();
                                                      }
                                                      final quizOptionNewQuestaoARecord =
                                                          quizOptionNewQuestaoARecordList
                                                                  .isNotEmpty
                                                              ? quizOptionNewQuestaoARecordList
                                                                  .first
                                                              : null;
                                                      return QuizOptionNewWidget(
                                                        key: Key(
                                                            'Keyblv_${pageViewIndex}_of_${pageViewQuizRecordList.length}'),
                                                        questionNum: 'A',
                                                        questionName:
                                                            quizOptionNewQuestaoARecord
                                                                ?.questao,
                                                        isTrue:
                                                            quizOptionNewQuestaoARecord
                                                                ?.isTrue,
                                                      );
                                                    },
                                                  ),
                                                  StreamBuilder<
                                                      List<QuestaoBRecord>>(
                                                    stream: queryQuestaoBRecord(
                                                      parent: pageViewQuizRecord
                                                          .reference,
                                                      singleRecord: true,
                                                    ),
                                                    builder:
                                                        (context, snapshot) {
                                                      // Customize what your widget looks like when it's loading.
                                                      if (!snapshot.hasData) {
                                                        return Center(
                                                          child: SizedBox(
                                                            width: 50,
                                                            height: 50,
                                                            child:
                                                                CircularProgressIndicator(
                                                              valueColor:
                                                                  AlwaysStoppedAnimation<
                                                                      Color>(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                              ),
                                                            ),
                                                          ),
                                                        );
                                                      }
                                                      List<QuestaoBRecord>
                                                          quizOptionNewQuestaoBRecordList =
                                                          snapshot.data!;
                                                      // Return an empty Container when the item does not exist.
                                                      if (snapshot
                                                          .data!.isEmpty) {
                                                        return Container();
                                                      }
                                                      final quizOptionNewQuestaoBRecord =
                                                          quizOptionNewQuestaoBRecordList
                                                                  .isNotEmpty
                                                              ? quizOptionNewQuestaoBRecordList
                                                                  .first
                                                              : null;
                                                      return QuizOptionNewWidget(
                                                        key: Key(
                                                            'Keyhhs_${pageViewIndex}_of_${pageViewQuizRecordList.length}'),
                                                        questionNum: 'B',
                                                        questionName:
                                                            quizOptionNewQuestaoBRecord
                                                                ?.questao,
                                                        isTrue:
                                                            quizOptionNewQuestaoBRecord
                                                                ?.isTrue,
                                                      );
                                                    },
                                                  ),
                                                  StreamBuilder<
                                                      List<QuestaoCRecord>>(
                                                    stream: queryQuestaoCRecord(
                                                      parent: pageViewQuizRecord
                                                          .reference,
                                                      singleRecord: true,
                                                    ),
                                                    builder:
                                                        (context, snapshot) {
                                                      // Customize what your widget looks like when it's loading.
                                                      if (!snapshot.hasData) {
                                                        return Center(
                                                          child: SizedBox(
                                                            width: 50,
                                                            height: 50,
                                                            child:
                                                                CircularProgressIndicator(
                                                              valueColor:
                                                                  AlwaysStoppedAnimation<
                                                                      Color>(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                              ),
                                                            ),
                                                          ),
                                                        );
                                                      }
                                                      List<QuestaoCRecord>
                                                          quizOptionNewQuestaoCRecordList =
                                                          snapshot.data!;
                                                      // Return an empty Container when the item does not exist.
                                                      if (snapshot
                                                          .data!.isEmpty) {
                                                        return Container();
                                                      }
                                                      final quizOptionNewQuestaoCRecord =
                                                          quizOptionNewQuestaoCRecordList
                                                                  .isNotEmpty
                                                              ? quizOptionNewQuestaoCRecordList
                                                                  .first
                                                              : null;
                                                      return QuizOptionNewWidget(
                                                        key: Key(
                                                            'Keyzws_${pageViewIndex}_of_${pageViewQuizRecordList.length}'),
                                                        questionNum: 'C',
                                                        questionName:
                                                            quizOptionNewQuestaoCRecord
                                                                ?.questao,
                                                        isTrue:
                                                            quizOptionNewQuestaoCRecord
                                                                ?.isTrue,
                                                      );
                                                    },
                                                  ),
                                                  StreamBuilder<
                                                      List<QuestaoDRecord>>(
                                                    stream: queryQuestaoDRecord(
                                                      parent: pageViewQuizRecord
                                                          .reference,
                                                      singleRecord: true,
                                                    ),
                                                    builder:
                                                        (context, snapshot) {
                                                      // Customize what your widget looks like when it's loading.
                                                      if (!snapshot.hasData) {
                                                        return Center(
                                                          child: SizedBox(
                                                            width: 50,
                                                            height: 50,
                                                            child:
                                                                CircularProgressIndicator(
                                                              valueColor:
                                                                  AlwaysStoppedAnimation<
                                                                      Color>(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                              ),
                                                            ),
                                                          ),
                                                        );
                                                      }
                                                      List<QuestaoDRecord>
                                                          quizOptionNewQuestaoDRecordList =
                                                          snapshot.data!;
                                                      // Return an empty Container when the item does not exist.
                                                      if (snapshot
                                                          .data!.isEmpty) {
                                                        return Container();
                                                      }
                                                      final quizOptionNewQuestaoDRecord =
                                                          quizOptionNewQuestaoDRecordList
                                                                  .isNotEmpty
                                                              ? quizOptionNewQuestaoDRecordList
                                                                  .first
                                                              : null;
                                                      return QuizOptionNewWidget(
                                                        key: Key(
                                                            'Keynwa_${pageViewIndex}_of_${pageViewQuizRecordList.length}'),
                                                        questionNum: 'D',
                                                        questionName:
                                                            quizOptionNewQuestaoDRecord
                                                                ?.questao,
                                                        isTrue:
                                                            quizOptionNewQuestaoDRecord
                                                                ?.isTrue,
                                                      );
                                                    },
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      );
                                    },
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(0.00, 1.00),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 0, 30),
                                      child: smooth_page_indicator
                                          .SmoothPageIndicator(
                                        controller:
                                            _model.pageViewController ??=
                                                PageController(
                                                    initialPage: min(
                                                        0,
                                                        pageViewQuizRecordList
                                                                .length -
                                                            1)),
                                        count: pageViewQuizRecordList.length,
                                        axisDirection: Axis.horizontal,
                                        onDotClicked: (i) async {
                                          await _model.pageViewController!
                                              .animateToPage(
                                            i,
                                            duration:
                                                Duration(milliseconds: 500),
                                            curve: Curves.ease,
                                          );
                                        },
                                        effect: smooth_page_indicator
                                            .ExpandingDotsEffect(
                                          expansionFactor: 3,
                                          spacing: 8,
                                          radius: 16,
                                          dotWidth: 16,
                                          dotHeight: 8,
                                          dotColor: FlutterFlowTheme.of(context)
                                              .accent1,
                                          activeDotColor:
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                          paintStyle: PaintingStyle.fill,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 30),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if ((FFAppState().completedQuestions >= 0) &&
                                (FFAppState().completedQuestions <
                                    responderQuizzCount))
                              FFButtonWidget(
                                onPressed: () async {
                                  await _model.pageViewController?.nextPage(
                                    duration: Duration(milliseconds: 300),
                                    curve: Curves.ease,
                                  );
                                  if (responderQuizzCount !=
                                      _model.pageNavigate) {
                                    setState(() {
                                      _model.pageNavigate =
                                          _model.pageNavigate + 1;
                                    });
                                  }
                                },
                                text: 'Próximo',
                                options: FFButtonOptions(
                                  height: 40,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      24, 0, 24, 0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 0),
                                  color: FlutterFlowTheme.of(context).primary,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: Colors.white,
                                      ),
                                  elevation: 3,
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            if (FFAppState().completedQuestions ==
                                responderQuizzCount)
                              FFButtonWidget(
                                onPressed: () async {
                                  context.goNamed(
                                    'quizzEnviado',
                                    queryParameters: {
                                      'scoreAchieved': serializeParam(
                                        FFAppState().score,
                                        ParamType.int,
                                      ),
                                      'totalQuestions': serializeParam(
                                        responderQuizzCount,
                                        ParamType.int,
                                      ),
                                    }.withoutNulls,
                                  );

                                  FFAppState().update(() {
                                    FFAppState().completedQuestions = 0;
                                  });
                                },
                                text: 'Completar',
                                options: FFButtonOptions(
                                  height: 40,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      24, 0, 24, 0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 0),
                                  color: FlutterFlowTheme.of(context).primary,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: Colors.white,
                                      ),
                                  elevation: 3,
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
