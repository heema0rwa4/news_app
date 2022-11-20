import 'package:expandable_widgets/expandable_widgets.dart';
import 'package:flutter/material.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/news_app/cubit/cubit.dart';
import 'package:news_app/layout/news_app/cubit/states.dart';
import 'package:news_app/shared/components/components.dart';

class SportsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var listTobuild = NewsCubit.get(context).sports;
        return ConditionalBuilder(
            condition: listTobuild.length > 0,
            builder: (context) => ListView.separated(
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) =>
                      buildArticleItem(listTobuild[index],context),
                  separatorBuilder: (context, index) => Container(
                    height: 0.1,
                  ),
                  itemCount: listTobuild.length,
                ),
            fallback: (context) => Center(child: CircularProgressIndicator()));
      },
    );
  }
}
