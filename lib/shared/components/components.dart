import 'dart:convert';

import 'package:expandable_widgets/expandable_widgets.dart';
import 'package:flutter/material.dart';

Widget buildArticleItem(article,context) => Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 5.0,
        horizontal: 8.0,
      ),
      child: Expandable(
        backgroundColor: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(13.0),
        firstChild: Row(

          children: [
            Container(
              width: 120.0,
              height: 120.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(13.0),
                image: DecorationImage(
                  image: NetworkImage('${article['urlToImage']}'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              width: 20.0,
            ),
            Expanded(
              child: Container(

                height: 120.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        '${article['title']}  ',
                        style: Theme.of(context).textTheme.bodyText1,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        '${article['publishedAt']}',
                        style: Theme.of(context).textTheme.bodyText2
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
        secondChild: Row(
          children: [
            Expanded(
              child: Container(
                height: 200,
                width: 120.0,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        '${article['description']} ',
                        style: Theme.of(context).textTheme.headline6
                      ),
                    ),
                    // Text(
                    //   '${article['url']} ',
                    //   style: TextStyle(
                    //       fontSize: 10.0,
                    //    fontWeight: FontWeight.w200,
                    //    fontStyle: FontStyle.italic,
                    //       color: Colors.blue),
                    // ),
                  ],
                ),
              ),
            )
          ],
        ),
        subChild: Text(
          'Read more',
        ),
      ),
    );
