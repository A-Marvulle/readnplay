import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'generos_fav_model.dart';
export 'generos_fav_model.dart';

class GenerosFavWidget extends StatefulWidget {
  const GenerosFavWidget({
    Key? key,
    required this.gen,
  }) : super(key: key);

  final String? gen;

  @override
  _GenerosFavWidgetState createState() => _GenerosFavWidgetState();
}

class _GenerosFavWidgetState extends State<GenerosFavWidget> {
  late GenerosFavModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GenerosFavModel());

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
                      child: StreamBuilder<List<LivrosRecord>>(
                        stream: queryLivrosRecord(
                          queryBuilder: (livrosRecord) => livrosRecord.where(
                            'genero',
                            isEqualTo: widget.gen,
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
                          List<LivrosRecord> containerLivrosRecordList =
                              snapshot.data!;
                          return Container(
                            width: MediaQuery.sizeOf(context).width * 0.8,
                            height: MediaQuery.sizeOf(context).height * 0.8,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 45, 0, 0),
                              child: Builder(
                                builder: (context) {
                                  final livro =
                                      containerLivrosRecordList.toList();
                                  return ListView.builder(
                                    padding: EdgeInsets.zero,
                                    scrollDirection: Axis.vertical,
                                    itemCount: livro.length,
                                    itemBuilder: (context, livroIndex) {
                                      final livroItem = livro[livroIndex];
                                      return Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            15, 0, 15, 15),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            context.pushNamed(
                                              'QuizesEspecificos',
                                              queryParameters: {
                                                'livro': serializeParam(
                                                  livroItem.nome,
                                                  ParamType.String,
                                                ),
                                              }.withoutNulls,
                                              extra: <String, dynamic>{
                                                kTransitionInfoKey:
                                                    TransitionInfo(
                                                  hasTransition: true,
                                                  transitionType:
                                                      PageTransitionType.fade,
                                                ),
                                              },
                                            );
                                          },
                                          child: Container(
                                            width: 470,
                                            height: 116,
                                            decoration: BoxDecoration(
                                              color: () {
                                                if (widget.gen ==
                                                    'Ação e aventura') {
                                                  return Color(0xFF8C0F0F);
                                                } else if (widget.gen ==
                                                    'Agricultura') {
                                                  return Color(0xFF3E9411);
                                                } else if (widget.gen ==
                                                    'Autoajuda') {
                                                  return Color(0xFF136189);
                                                } else if (widget.gen ==
                                                    'Biografias') {
                                                  return Color(0xFF136189);
                                                } else if (widget.gen ==
                                                    'Casa e jardim') {
                                                  return Color(0xFF3E9411);
                                                } else if (widget.gen ==
                                                    'Chegando à maioridade') {
                                                  return Color(0xFF136189);
                                                } else if (widget.gen ==
                                                    'Clássicos') {
                                                  return Color(0xFF092472);
                                                } else if (widget.gen ==
                                                    'Contos') {
                                                  return Color(0xFF092472);
                                                } else if (widget.gen ==
                                                    'Crime Verdadeiro') {
                                                  return Color(0xFF333333);
                                                } else if (widget.gen ==
                                                    'Culinária') {
                                                  return Color(0xFF641674);
                                                } else if (widget.gen ==
                                                    'Cultural e étnico') {
                                                  return Color(0xFF641674);
                                                } else if (widget.gen ==
                                                    'Educação e Referência') {
                                                  return Color(0xFF641674);
                                                } else if (widget.gen ==
                                                    'Esportes e atividades ao ar livre') {
                                                  return Color(0xFF641674);
                                                } else if (widget.gen ==
                                                    'Fantasia') {
                                                  return Color(0xFF8C0F0F);
                                                } else if (widget.gen ==
                                                    'Ficção') {
                                                  return Color(0xFF8C0F0F);
                                                } else if (widget.gen ==
                                                    'Mistério e crime') {
                                                  return Color(0xFF333333);
                                                } else if (widget.gen ==
                                                    'Natureza') {
                                                  return Color(0xFF3E9411);
                                                } else if (widget.gen ==
                                                    'Romance') {
                                                  return Color(0xFFD00782);
                                                } else if (widget.gen ==
                                                    'Sexo e Relacionamentos') {
                                                  return Color(0xFFD00782);
                                                } else if (widget.gen ==
                                                    'Thriller e Suspense') {
                                                  return Color(0xFF333333);
                                                } else if (widget.gen ==
                                                    'Faça você mesmo e artesanato') {
                                                  return Color(0xFF136189);
                                                } else if (widget.gen ==
                                                    'Fotografia') {
                                                  return Color(0xFF1DB984);
                                                } else if (widget.gen ==
                                                    'Inspirador') {
                                                  return Color(0xFF136189);
                                                } else if (widget.gen ==
                                                    'Livros Didáticos') {
                                                  return Color(0xFF092472);
                                                } else if (widget.gen ==
                                                    'Nova era') {
                                                  return Color(0xFFD00782);
                                                } else if (widget.gen ==
                                                    'Paternidade e famílias') {
                                                  return Color(0xFF641674);
                                                } else if (widget.gen ==
                                                    'Peças e roteiros') {
                                                  return Color(0xFF092472);
                                                } else if (widget.gen ==
                                                    'Poesia') {
                                                  return Color(0xFF092472);
                                                } else if (widget.gen ==
                                                    'Projeto') {
                                                  return Color(0xFF1DB984);
                                                } else if (widget.gen ==
                                                    'Quadrinhos e romances gráficos') {
                                                  return Color(0xFF8C0F0F);
                                                } else if (widget.gen ==
                                                    'Religião e Espiritualidade') {
                                                  return Color(0xFF641674);
                                                } else if (widget.gen ==
                                                    'Saúde e Bem-Estar') {
                                                  return Color(0xFFE5CE2F);
                                                } else if (widget.gen ==
                                                    'Tecnologia') {
                                                  return Color(0xFF641674);
                                                } else if (widget.gen ==
                                                    'Temáticas e motivações') {
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
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(15, 0, 5, 0),
                                              child: ListTile(
                                                title: Text(
                                                  livroItem.nome
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
                                                  livroItem.autor
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
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                          );
                        },
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
                                widget.gen!,
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
