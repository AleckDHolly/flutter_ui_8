import 'package:flutter/material.dart';

import '../components/sub_category.dart';
import 'single_grid_item.dart';

//Places image in the center of left over space in column
class GridItemPlacement extends StatelessWidget {
  const GridItemPlacement({
    super.key,
    required this.categories,
    required this.index,
    required this.image,
  });

  final List<String> categories;
  final int index;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Align(
        alignment: Alignment.center,
        child: SingleGridItem(
          subCategory: SubCategory(
            subCatName: categories[index],
            image: image,
            nowPlaying: "",
          ),
        ),
      ),
    );
  }
}
