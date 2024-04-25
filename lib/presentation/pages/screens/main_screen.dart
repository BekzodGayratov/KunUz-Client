import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:kunuzclient/domain/constants/constants.dart';
import 'package:kunuzclient/presentation/blocs/news_cubit.dart';
import 'package:kunuzclient/presentation/widgets/padding.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  @override
  void initState() {
    context.read<NewsCubit>().getNews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocBuilder<NewsCubit, NewsState>(builder: (context, state) {
      return state.when(
          initial: () => const SizedBox.shrink(),
          loading: () =>
              const Center(child: CircularProgressIndicator.adaptive()),
          error: (err) => Center(child: Text(err ?? 'Unknown error')),
          success: (data) {
            if (data.data!.isEmpty) {
              return const Center(child: Text("Yangiliklar mavjud emas"));
            }
            return ListView.builder(
                itemCount: data.data!.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(
                        top: 10.h,
                        bottom: data.data!.length - 1 == index ? 10.h : 0),
                    child: StandartPadding(
                      child: InkWell(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 200.h,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: Colors.white12,
                                  borderRadius: BorderRadius.circular(12.0),
                                  image: data.data![index].img != null
                                      ? DecorationImage(
                                          image: NetworkImage(
                                              "${Constants.currentServer}${data.data![index].img!.url ?? ''}"),
                                          fit: BoxFit.cover)
                                      : null),
                            ),
                            Gap(10.h),
                            Text(data.data![index].title.toString(),
                                style: const TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w600))
                          ],
                        ),
                      ),
                    ),
                  );
                });
          });
    });
  }
}
