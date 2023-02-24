//Screen 1
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_app/model/jhister_models.dart';
import 'package:learning_app/modules/auth_module/components/auth_app_bar_widget.dart';
import 'package:learning_app/modules/auth_module/components/form_text_input.dart';
import 'package:learning_app/modules/home_module/logic/vm/home_vm.dart';
import 'package:learning_app/theme/app_theme.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget build(BuildContext context) {
    final vm = Modular.get<HomeVM>();
    final theme = Modular.get<AppTheme>();
    final textStyles = theme.getTheme().extension<MyTextStyles>()!;
    final colors = theme.getTheme().extension<MyColors>()!;

    return Scaffold(
      appBar: const AppAppBar(titleText: 'Content'),
      backgroundColor: Colors.white,
      body: StreamBuilder<int>(
          stream: vm.bottomNavBarIndex,
          builder: (context, snapshot) {
            final currentIndex = snapshot.data ?? 0;
            return IndexedStack(
              index: currentIndex,
              children: <Widget>[
                const ContentScreen(),
                Container(
                  child: Center(child: Text("2")),
                ),
                Container(
                  child: Center(child: Text("3")),
                ),
                Container(
                  child: Center(child: Text("4")),
                ),
                Container(
                  child: Center(child: Text("5")),
                )
              ],
            );
          }),
      bottomNavigationBar: const BottomNaivgationBarComponent(),
    );
  }
}

class ContentScreen extends StatelessWidget {
  const ContentScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final vm = Modular.get<HomeVM>();

    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Column(
        children: [
          Container(
            height: 95,
            padding: const EdgeInsets.only(
              top: 26,
              right: 26,
              left: 26,
            ),
            child: FormTextInput(
              hintText: 'Search',
              textEditingController: TextEditingController(),
              validator: (str) => null,
              borderRaduis: 20,
            ),
          ),
          Expanded(
            child: StreamBuilder<List<ContentModel>>(
                stream: vm.contents,
                builder: (context, snapshot) {
                  final contents = snapshot.data ?? [];
                  return ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: contents.length,
                    itemBuilder: (ctx, i) {
                      final content = contents[i];
                      return Padding(
                        padding: const EdgeInsets.only(
                          left: 24,
                          right: 24,
                          bottom: 16,
                        ),
                        child: ContentBlockComponent(
                          title: content.title,
                          body: content.body,
                        ),
                      );
                    },
                  );
                }),
          ),
        ],
      ),
    );
  }
}

class ContentBlockComponent extends StatelessWidget {
  const ContentBlockComponent({
    super.key,
    this.title = 'Title',
    this.body =
        "He'll want to use your yacht, and I don't want this\nthing smelling like fish. He'll want to use your",
    this.date = '8m ago',
  });

  final String title;
  final String body;
  final String date;

  @override
  Widget build(BuildContext context) {
    final theme = Modular.get<AppTheme>();
    final textStyles = theme.getTheme().extension<MyTextStyles>()!;
    final colors = theme.getTheme().extension<MyColors>()!;

    return SizedBox(
      height: 348,
      width: 327,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 10,
            child: Container(
              decoration: BoxDecoration(
                color: colors.text100,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Text(
                    title,
                    style: textStyles.bodyMedium!.copyWith(
                      color: colors.text500,
                      fontWeight: FontWeight.w500,
                      height: 1.3,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Text(
                    body,
                    style: textStyles.bodySmall!.copyWith(
                      color: colors.text500,
                      height: 1.3,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Text(
                    date,
                    style: textStyles.bodySmall!.copyWith(
                      color: colors.text300,
                      height: 1.3,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class BottomNaivgationBarComponent extends StatelessWidget {
  const BottomNaivgationBarComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final vm = Modular.get<HomeVM>();
    final theme = Modular.get<AppTheme>();
    final textStyles = theme.getTheme().extension<MyTextStyles>()!;
    final colors = theme.getTheme().extension<MyColors>()!;

    return StreamBuilder<int>(
        stream: vm.bottomNavBarIndex,
        builder: (context, snapshot) {
          final currentIndex = snapshot.data ?? 0;

          return Container(
            height: 83.5,
            width: 100.w,
            padding: const EdgeInsets.symmetric(horizontal: 30),
            decoration: BoxDecoration(
              color: colors.white,
              border: Border(
                top: BorderSide(color: colors.text300, width: 0.5),
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: BottomNavBarItem(
                    index: 0,
                    currentIndex: currentIndex,
                  ),
                ),
                Expanded(
                  child: BottomNavBarItem(
                    index: 1,
                    currentIndex: currentIndex,
                  ),
                ),
                Expanded(
                  child: BottomNavBarItem(
                    index: 2,
                    currentIndex: currentIndex,
                  ),
                ),
                Expanded(
                  child: BottomNavBarItem(
                    index: 3,
                    currentIndex: currentIndex,
                  ),
                ),
                Expanded(
                  child: BottomNavBarItem(
                    index: 4,
                    currentIndex: currentIndex,
                  ),
                ),
              ],
            ),
          );
        });
  }
}

class BottomNavBarItem extends StatelessWidget {
  const BottomNavBarItem({
    super.key,
    required this.index,
    required this.currentIndex,
  });
  final int index;
  final int currentIndex;
  @override
  Widget build(BuildContext context) {
    final theme = Modular.get<AppTheme>();
    final colors = theme.getTheme().extension<MyColors>()!;
    final isActive = index == currentIndex;
    return IconButton(
      icon: Container(
        width: 21.33,
        height: 21.33,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isActive ? colors.primary500 : colors.text200,
        ),
      ),
      onPressed: () {
        if (!isActive) {
          final vm = Modular.get<HomeVM>();
          vm.bottomNavBarIndex.add(index);
        }
      },
    );
  }
}
