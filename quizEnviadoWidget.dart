import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'quizz_enviado_model.dart';
export 'quizz_enviado_model.dart';

class QuizzEnviadoWidget extends StatefulWidget {
  const QuizzEnviadoWidget({
    Key? key,
    this.scoreAchieved,
    this.totalQuestions,
  }) : super(key: key);

  final int? scoreAchieved;
  final int? totalQuestions;

  @override
  _QuizzEnviadoWidgetState createState() => _QuizzEnviadoWidgetState();
}

class _QuizzEnviadoWidgetState extends State<QuizzEnviadoWidget>
    with TickerProviderStateMixin {
  late QuizzEnviadoModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'iconOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0,
          end: 1,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0, 60),
          end: Offset(0, 0),
        ),
      ],
    ),
    'richTextOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 50.ms,
          duration: 600.ms,
          begin: 0,
          end: 1,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 50.ms,
          duration: 600.ms,
          begin: Offset(0, 60),
          end: Offset(0, 0),
        ),
      ],
    ),
    'richTextOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 900.ms,
          duration: 600.ms,
          begin: 0,
          end: 1,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 900.ms,
          duration: 600.ms,
          begin: Offset(0, 60),
          end: Offset(0, 0),
        ),
      ],
    ),
    'iconButtonOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 1800.ms,
          duration: 600.ms,
          begin: 0,
          end: 1,
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => QuizzEnviadoModel());

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
                            child: Icon(
                              Icons.check_rounded,
                              color:
                                  FlutterFlowTheme.of(context).menuSelecionado,
                              size: 150,
                            ).animateOnPageLoad(
                                animationsMap['iconOnPageLoadAnimation']!),
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
                  child: StreamBuilder<List<UserRecord>>(
                    stream: queryUserRecord(
                      queryBuilder: (userRecord) => userRecord.where(
                        'uid',
                        isEqualTo: currentUserUid,
                      ),
                      singleRecord: true,
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
                      List<UserRecord> columnUserRecordList = snapshot.data!;
                      // Return an empty Container when the item does not exist.
                      if (snapshot.data!.isEmpty) {
                        return Container();
                      }
                      final columnUserRecord = columnUserRecordList.isNotEmpty
                          ? columnUserRecordList.first
                          : null;
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Align(
                            alignment: AlignmentDirectional(0.00, 0.00),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RichText(
                                  textScaleFactor:
                                      MediaQuery.of(context).textScaleFactor,
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: 'Você conseguiu  ',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Poppins',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                      TextSpan(
                                        text: valueOrDefault<String>(
                                          (widget.scoreAchieved! * 50)
                                              .toString(),
                                          '0',
                                        ),
                                        style: TextStyle(),
                                      ),
                                      TextSpan(
                                        text: '  pontos',
                                        style: TextStyle(),
                                      )
                                    ],
                                    style:
                                        FlutterFlowTheme.of(context).bodyMedium,
                                  ),
                                ).animateOnPageLoad(animationsMap[
                                    'richTextOnPageLoadAnimation1']!),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    100, 0, 0, 0),
                                child: RichText(
                                  textScaleFactor:
                                      MediaQuery.of(context).textScaleFactor,
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: valueOrDefault<String>(
                                          widget.scoreAchieved?.toString(),
                                          '0',
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Poppins',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                      TextSpan(
                                        text: '  de  ',
                                        style: TextStyle(),
                                      ),
                                      TextSpan(
                                        text: valueOrDefault<String>(
                                          widget.totalQuestions?.toString(),
                                          '0',
                                        ),
                                        style: TextStyle(),
                                      ),
                                      TextSpan(
                                        text: ' estão corretas',
                                        style: TextStyle(),
                                      )
                                    ],
                                    style:
                                        FlutterFlowTheme.of(context).bodyMedium,
                                  ),
                                ).animateOnPageLoad(animationsMap[
                                    'richTextOnPageLoadAnimation2']!),
                              ),
                            ],
                          ),
                          FlutterFlowIconButton(
                            borderColor: FlutterFlowTheme.of(context).primary,
                            borderRadius: 20,
                            borderWidth: 1,
                            buttonSize: 40,
                            fillColor: FlutterFlowTheme.of(context).primary,
                            icon: Icon(
                              Icons.close,
                              color:
                                  FlutterFlowTheme.of(context).primaryBtnText,
                              size: 24,
                            ),
                            onPressed: () async {
                              await currentUserReference!.update({
                                ...mapToFirestore(
                                  {
                                    'ponto': FieldValue.increment(
                                        FFAppState().score),
                                  },
                                ),
                              });

                              context.goNamed(
                                'Home',
                                extra: <String, dynamic>{
                                  kTransitionInfoKey: TransitionInfo(
                                    hasTransition: true,
                                    transitionType: PageTransitionType.fade,
                                  ),
                                },
                              );
                            },
                          ).animateOnPageLoad(
                              animationsMap['iconButtonOnPageLoadAnimation']!),
                        ].divide(SizedBox(height: 14)),
                      );
                    },
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
