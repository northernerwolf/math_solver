import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:math_solver_app/screens/solver/list_solver.dart';
import 'package:math_solver_app/src/core/app_assets.dart';
import 'package:math_solver_app/src/core/app_constant.dart';
import 'package:math_solver_app/src/core/color_scheme.dart';
import 'package:math_solver_app/src/ui/app/theme_provider.dart';
import 'package:package_info/package_info.dart';
import 'package:provider/provider.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key});

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: InkWell(
                  onTap: () {
                    context.read<ThemeProvider>().changeTheme();
                  },
                  // borderRadius: BorderRadius.only(
                  //   topRight: Radius.circular(12),
                  //   bottomRight: Radius.circular(12),
                  // ),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.infoDialogBgColor,
                        borderRadius: BorderRadius.circular(12)),
                    padding: const EdgeInsets.only(
                        right: 12, top: 12, bottom: 12, left: 8),
                    child: SvgPicture.asset(
                      Theme.of(context).brightness == Brightness.light
                          ? AppAssets.icDarkMode
                          : AppAssets.icLightMode,
                      width: 24,
                      height: 24,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 40),
            child: SizedBox(
                height: 200,
                width: 200,
                child: Image.asset('assets/images/logo1.png')),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => MathSolverListTypes(),
                  ),
                );
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: LinearGradient(
                    colors: [Color(0xff4895EF), Color(0xff3f37c9)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: Center(
                    child: Text(
                  'Math Solver',
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      fontSize: 24,
                      color: Colors.white,
                      fontWeight: FontWeight.w400),
                )),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, KeyUtil.dashboard);
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: LinearGradient(
                    colors: [Color(0xff9f2beb), Color(0xff560bad)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: Center(
                  child: Text("Math Train",
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          fontSize: 24,
                          color: Colors.white,
                          fontWeight: FontWeight.w400)),
                ),
              ),
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.all(15.0),
          //   child: InkWell(
          //     onTap: () {
          //       Navigator.of(context).push(
          //         MaterialPageRoute(
          //           builder: (context) => HomeScreen(),
          //         ),
          //       );
          //     },
          //     child: Container(
          //       width: MediaQuery.of(context).size.width,
          //       height: 80,
          //       decoration: BoxDecoration(
          //         borderRadius: BorderRadius.circular(10),
          //         gradient: LinearGradient(
          //           colors: [Color(0xfff72585), Color(0xffb5179e)],
          //           begin: Alignment.topCenter,
          //           end: Alignment.bottomCenter,
          //         ),
          //       ),
          //       child: Center(
          //           child: Text(
          //         'Generate Quiz',
          //         style: Theme.of(context).textTheme.titleSmall!.copyWith(
          //             fontSize: 24,
          //             color: Colors.white,
          //             fontWeight: FontWeight.w400),
          //       )),
          //     ),
          //   ),
          // ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.infoDialogBgColor,
                  borderRadius: BorderRadius.circular(18)),
              padding: const EdgeInsets.all(12.0),
              margin: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    child: Text("Oguzhan Math Solver App",
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(fontWeight: FontWeight.normal)),
                  ),
                  SizedBox(width: 12),
                  FutureBuilder<PackageInfo>(
                    future: PackageInfo.fromPlatform(),
                    builder: (context, snapshot) => Text(
                        "v${snapshot.data?.version}",
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .copyWith(fontSize: 14)),
                  ),
                ],
              ),
            ),
          ),
        ],
      )),
    );
  }
}
