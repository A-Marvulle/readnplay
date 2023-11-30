import '/components/quiz_sets_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'meus_quizzes_model.dart';
export 'meus_quizzes_model.dart';

class MeusQuizzesWidget extends StatefulWidget {
  const MeusQuizzesWidget({Key? key}) : super(key: key);

  @override
  _MeusQuizzesWidgetState createState() => _MeusQuizzesWidgetState();
}

class _MeusQuizzesWidgetState extends State<MeusQuizzesWidget> {
  late MeusQuizzesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MeusQuizzesModel());

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
        body: wrapWithModel(
          model: _model.quizSetsModel,
          updateCallback: () => setState(() {}),
          child: QuizSetsWidget(),
        ),
      ),
    );
  }
}
