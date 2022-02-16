import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:vbt_camp_widget/feature/login/view/login_view.dart';
import 'package:vbt_camp_widget/feature/onboard/model/onboard_model.dart';
import 'package:vbt_camp_widget/product/companents/text/app_text_strings.dart';

class OnBoardScreen extends StatefulWidget {
  OnBoardScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardScreen> createState() => _OnBoardScreenState();
}

class _OnBoardScreenState extends State<OnBoardScreen> {
  int currentIndex = 0;
  PageController? _controller;

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: _buildPageViewController(context),
          ),
          _navigationItemsRow(),
          _buttonPageNavigiton(context)
        ],
      ),
    );
  }

  PageView _buildPageViewController(BuildContext context) {
    return PageView.builder(
        controller: _controller,
        onPageChanged: (int index) {
          setState(() {
            currentIndex = index;
          });
        },
        itemCount: models.length,
        itemBuilder: (_, i) {
          return Padding(
            padding: context.paddingMedium,
            child: _buildMainText(i, context),
          );
        });
  }

  Column _buildMainText(int i, BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          models[i].title,
          textAlign: TextAlign.center,
          style:
              context.textTheme.headline4?.copyWith(fontWeight: FontWeight.bold, color: context.appTheme.primaryColor),
        ),
        SizedBox(
          height: context.dynamicHeight(0.06),
        ),
        FittedBox(
          fit: BoxFit.fill,
          child: Text(models[i].description,
              style: context.textTheme.bodyText2?.copyWith(
                color: context.appTheme.primaryColor.withOpacity(0.6),
              )),
        ),
        SizedBox(
          width: context.dynamicWidth(0.2),
          height: context.dynamicHeight(0.06),
        ),
        Image.asset(models[i].image)
      ],
    );
  }

  Container _navigationItemsRow() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(models.length, (index) => _buildItemsPage(index)),
      ),
    );
  }

  Container _buttonPageNavigiton(BuildContext context) {
    return Container(
      height: context.dynamicHeight(0.06),
      margin: const EdgeInsets.all(40),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(primary: context.appTheme.primaryColor),
        onPressed: () {
          if (currentIndex == models.length - 1) {
            Navigator.push(context, MaterialPageRoute(builder: (_) => LoginView()));
          }
          _controller?.nextPage(duration: context.durationNormal, curve: Curves.bounceIn);
        },
        child: Text(currentIndex == models.length - 1
            ? AppString().buttonContuniew.toString()
            : AppString().buttonTextExample.toString()),
      ),
      color: Theme.of(context).primaryColor,
    );
  }

  Container _buildItemsPage(int index) {
    return Container(
      height: context.dynamicHeight(0.015),
      width: currentIndex == index ? 15 : 10,
      margin: const EdgeInsets.only(right: 3),
      decoration: BoxDecoration(
          color: Colors.green,
          border: Border.all(color: context.appTheme.primaryColor),
          borderRadius: const BorderRadius.all(Radius.circular(20))),
    );
  }
}
