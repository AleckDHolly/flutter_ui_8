import 'package:flutter/material.dart';
import 'package:flutter_ui_12/components/sub_category.dart';
import 'package:google_fonts/google_fonts.dart';

//How one grid item should look like.
// ignore: must_be_immutable
class SingleGridItem extends StatelessWidget {
  SingleGridItem({super.key, required this.subCategory});
  SubCategory subCategory;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Container(
        height: 400,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: AssetImage(subCategory.image),
            fit: BoxFit.cover,
          ),
        ),
        child: AspectRatio(
          aspectRatio: 3 / 4,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${subCategory.subCatName} Radio",
                  style: GoogleFonts.poppins(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
                Text(
                  subCategory.nowPlaying,
                  style: GoogleFonts.poppins(
                    color: Colors.blueGrey,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
