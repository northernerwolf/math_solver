import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:math_solver_app/screens/initial_screen.dart';
import 'package:math_solver_app/screens/solver/basic_integral.dart';
import 'package:math_solver_app/screens/solver/basic_integralnew.dart';
import 'package:math_solver_app/screens/solver/integral.dart';
import 'package:math_solver_app/screens/solver/integral_trigo.dart';
import 'package:math_solver_app/screens/solver/log_integral.dart';
import 'package:math_solver_app/screens/solver/quadratic_equation.dart';
import 'package:math_solver_app/src/core/app_constant.dart';
import 'package:math_solver_app/src/core/color_scheme.dart';
import 'package:math_solver_app/src/ui/dashboard/dashboard_button_view.dart';
import 'package:tuple/tuple.dart';

class IntegralListTypes extends StatefulWidget {
  @override
  _IntegralListTypesState createState() => _IntegralListTypesState();
}

class _IntegralListTypesState extends State<IntegralListTypes>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetLeftEnter;
  late Animation<Offset> _offsetRightEnter;
  late bool isHomePageOpen;

  @override
  void initState() {
    super.initState();
    isHomePageOpen = false;
    _controller = AnimationController(
      duration: Duration(milliseconds: 700),
      vsync: this,
    );
    _offsetLeftEnter = Tween<Offset>(
      begin: Offset(2.0, 0.0),
      end: Offset.zero,
    ).animate(_controller);

    _offsetRightEnter = Tween<Offset>(
      begin: Offset(-2.0, 0.0),
      end: Offset.zero,
    ).animate(_controller);
    _controller.forward();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        systemNavigationBarColor: Theme.of(context).scaffoldBackgroundColor,
        systemNavigationBarIconBrightness: Theme.of(context).brightness,
      ),
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 0,
          elevation: 0,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        ),
        body: SafeArea(
          bottom: true,
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(
                        left: 15,
                      ),
                      child: Card(
                        color: Theme.of(context).colorScheme.crossColor,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(12))),
                        child: InkWell(
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: SizedBox(
                            height: 42,
                            width: 42,
                            child: Icon(
                              Icons.arrow_back_ios_new_rounded,
                              color: Theme.of(context).colorScheme.baseColor,
                              size: 20,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(width: 12),

                        // Container(
                        //   decoration: BoxDecoration(
                        //     color:
                        //         Theme.of(context).colorScheme.infoDialogBgColor,
                        //     borderRadius: BorderRadius.circular(12),
                        //   ),
                        //   padding: const EdgeInsets.all(12.0),
                        //   child: Row(
                        //     children: [
                        //       SvgPicture.asset(
                        //         AppAssets.icTrophy,
                        //         width: 24,
                        //         height: 24,
                        //       ),
                        //       // SizedBox(width: 5),
                        //       // Consumer<DashboardProvider>(
                        //       //   builder: (context, model, child) => Text(
                        //       //       model.overallScore.toString(),
                        //       //       style: Theme.of(context)
                        //       //           .textTheme
                        //       //           .titleMedium),
                        //       // ),
                        //     ],
                        //   ),
                        // ),
                        // SizedBox(width: 12),
                        //TODO Remove this when ios version of Math Riddle is live on App Store.
                        // if (Platform.isAndroid)
                        //   InkWell(
                        //     borderRadius: BorderRadius.circular(12),
                        //     onTap: () {
                        //       showDialog<bool>(
                        //         context: context,
                        //         builder: (newContext) {
                        //           return CommonAlertDialog(
                        //             child: MathRiddleView(),
                        //           );
                        //         },
                        //       );
                        //     },
                        //     child: Container(
                        //       decoration: BoxDecoration(
                        //         color: Theme.of(context)
                        //             .colorScheme
                        //             .infoDialogBgColor,
                        //         borderRadius: BorderRadius.circular(12),
                        //       ),
                        //       padding: const EdgeInsets.all(12.0),
                        //       child: RepaintBoundary(
                        //         child: Image.asset(
                        //           AppAssets.icAppMathRiddle,
                        //           width: 24,
                        //           height: 24,
                        //         )
                        //             .animate(
                        //               onPlay: (controller) =>
                        //                   controller.repeat(reverse: true),
                        //             )
                        //             .scaleXY(begin: 1.5, end: 0.8),
                        //       ),
                        //     ),
                        //   ),
                      ],
                    ),
                    Spacer(),
                    // InkWell(
                    //   onTap: () {
                    //     showDialog<bool>(
                    //       context: context,
                    //       builder: (newContext) {
                    //         final model = Provider.of<ThemeProvider>(context,
                    //             listen: true);
                    //         return CommonAlertDialog(
                    //           child: ChangeNotifierProvider.value(
                    //             value: model,
                    //             child: CommonDifficultyView(
                    //               selectedDifficulty: model.difficultyType,
                    //             ),
                    //           ),
                    //         );
                    //       },
                    //       barrierDismissible: false,
                    //     ).then((value) {});
                    //   },
                    //   borderRadius: BorderRadius.only(
                    //     topLeft: Radius.circular(12),
                    //     bottomLeft: Radius.circular(12),
                    //   ),
                    //   child: Container(
                    //     decoration: BoxDecoration(
                    //         color:
                    //             Theme.of(context).colorScheme.infoDialogBgColor,
                    //         borderRadius: BorderRadius.circular(12)),
                    //     padding: const EdgeInsets.only(
                    //         left: 12, top: 12, bottom: 12, right: 8),
                    //     child: SvgPicture.asset(
                    //       Theme.of(context).brightness == Brightness.light
                    //           ? AppAssets.ic3dStairsDark
                    //           : AppAssets.ic3dStairsLight,
                    //       width: 24,
                    //       height: 24,
                    //     ),
                    //   ),
                    // ),
                    SizedBox(width: 12),
                  ],
                ),
                SizedBox(height: 24),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(height: 36),
                        Text(
                          "Integrals",
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(
                                  fontSize: 28, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 12),
                        // Text(
                        //   "Train Your Brain, Improve Your Math Skill",
                        //   style: Theme.of(context)
                        //       .textTheme
                        //       .bodySmall!
                        //       .copyWith(fontSize: 14),
                        // ),
                        SizedBox(height: 36),
                        DashboardButtonView(
                          dashboard: KeyUtil.dashboardItems[6],
                          position: _offsetLeftEnter,
                          onTab: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) =>
                                    BasicIntegralCalculatorScreen(),
                              ),
                            );
                          },
                        ),
                        SizedBox(height: 20),
                        DashboardButtonView(
                          dashboard: KeyUtil.dashboardItems[7],
                          position: _offsetRightEnter,
                          onTab: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) =>
                                    IntegralCalculatorScreen(),
                              ),
                            );
                          },
                        ),
                        SizedBox(height: 20),
                        DashboardButtonView(
                          dashboard: KeyUtil.dashboardItems[8],
                          position: _offsetLeftEnter,
                          onTab: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) =>
                                    LogIntegralCalculatorScreen(),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 24),
                // Container(
                //   decoration: BoxDecoration(
                //       color: Theme.of(context).colorScheme.infoDialogBgColor,
                //       borderRadius: BorderRadius.circular(18)),
                //   padding: const EdgeInsets.all(12.0),
                //   margin: const EdgeInsets.symmetric(horizontal: 12),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     crossAxisAlignment: CrossAxisAlignment.start,
                //     children: <Widget>[
                //       // Expanded(
                //       //   child: Text("Math Matrix by Nividata",
                //       //       style: Theme.of(context)
                //       //           .textTheme
                //       //           .bodyMedium!
                //       //           .copyWith(fontWeight: FontWeight.normal)),
                //       // ),
                //       SizedBox(width: 12),
                //       FutureBuilder<PackageInfo>(
                //         future: PackageInfo.fromPlatform(),
                //         builder: (context, snapshot) => Text(
                //             "v${snapshot.data?.version}",
                //             style: Theme.of(context)
                //                 .textTheme
                //                 .bodySmall!
                //                 .copyWith(fontSize: 14)),
                //       ),
                //     ],
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
