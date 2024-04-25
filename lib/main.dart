import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kunuzclient/presentation/blocs/news_cubit.dart';
import 'package:kunuzclient/presentation/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      designSize: const Size(393, 852),
      builder: (context, child) => MaterialApp(
          debugShowCheckedModeBanner: false,
          home: MultiBlocProvider(
              providers: [BlocProvider(create: (context) => NewsCubit())],
              child: const HomePage())),
    );
  }
}
