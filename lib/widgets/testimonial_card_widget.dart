import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'package:get/get.dart';
import 'package:trackify_tools/utils/custom_text_styles.dart';


class TestimonialCard extends StatelessWidget {
  final String name;
  final String imageUrl;
  final String review;
  final double rating;

  const TestimonialCard({
    Key? key,
    required this.name,
    required this.imageUrl,
    required this.review,
    required this.rating,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          margin: EdgeInsets.only(top: 35, bottom: 10), // Leave space for image
          padding: EdgeInsets.only(top: 16, bottom: 16, right: 20, left: 20),
          height: 300,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: Colors.blueAccent, width: 1),
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                spreadRadius: 3,
                blurRadius: 4,
                offset: Offset(3, 3), // Shadow position
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '-',
                    style: CustomTextStyles.f12W700(),
                  ),
                  Text(
                    name.tr,
                    style: CustomTextStyles.f12W700(),
                  ),
                ],
              ),
              SizedBox(height: 2),
              // Rating stars
              RatingBar.builder(
                initialRating: rating,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemSize: 16,
                itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
                itemBuilder: (context, _) => Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {},
              ),
              SizedBox(height: 10),
              Flexible(
                child: Text(
                  review.tr,
                  style: TextStyle(
                      fontSize: 12,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w400,
                      height: 1.8),
                  textAlign: TextAlign.justify,
                ),
              ),
            ],
          ),
        ),
        // Positioned image at the top-center
        Positioned(
          top: -0.1, // Controls how much the image overlaps
          left: 0,
          right: 0,
          child: CircleAvatar(
            radius: 45,
            //backgroundColor: Colors.white,
            child: ClipOval(
              child: Image.network(
                imageUrl,
                width: 92,
                height: 92,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ],
    );
  }
}