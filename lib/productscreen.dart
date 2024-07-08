import 'package:flutter/material.dart';
import 'package:flutter_pannable_rating_bar/flutter_pannable_rating_bar.dart';
import 'package:fan_carousel_image_slider/fan_carousel_image_slider.dart';
import 'package:online_shopping/models/Product_Data.dart';
import 'package:online_shopping/widgets/ButtonModel.dart';
import 'package:online_shopping/widgets/productdetails.dart';


class ProductScreen extends StatefulWidget {
  final ItemData itemData;

  const ProductScreen({Key? key, required this.itemData}) : super(key: key);

  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> { 
  double rating = 0.0;

  @override
  Widget build(BuildContext context) {
    final itemData = widget.itemData;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Product Overview",
          style: TextStyle(
            color: Color(0xFF4C53A5),
            fontWeight: FontWeight.w600,
            fontSize: 25,
          ),
        ),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back,
            size: 20,
            color: Color(0xFF4C53A5),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 450,
                  width: MediaQuery.of(context).size.width,
                  child: FanCarouselImageSlider.sliderType1(
                    sliderHeight: 430,
                    autoPlay: true,
                    imagesLink: itemData.images,
                    isAssets: true,
                  ),
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          itemData.name,
                          style: const TextStyle(
                            color: Color(0xFF4C53A5),
                            fontWeight: FontWeight.w800,
                            fontSize: 25,
                          ),
                        ),
                        Text(
                          "${itemData.price} MMK",
                          style: const TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 25,
                            color: Color(0xFF4C53A5),
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          "Category: ${itemData.category}",
                          style: const TextStyle(
                            color: Color(0xFF4C53A5),
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          "Brand: ${itemData.brand}",
                          style: const TextStyle(
                            color: Color(0xFF4C53A5),
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          "Sizes: ${itemData.sizes.join(', ')}",
                          style: const TextStyle(
                            color: Color(0xFF4C53A5),
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          "Color: ${itemData.color}",
                          style: const TextStyle(
                            color: Color(0xFF4C53A5),
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          "Available: ${itemData.available}",
                          style: const TextStyle(
                            color: Color(0xFF4C53A5),
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          "Update Status: ${itemData.updateStatus}",
                          style: const TextStyle(
                            color: Color(0xFF4C53A5),
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Align(
                  alignment: Alignment.centerLeft,
                  child: PannableRatingBar(
                    rate: rating,
                    items: List.generate(
                      5,
                      (index) => const RatingWidget(
                        selectedColor: Colors.yellow,
                        unSelectedColor: Colors.grey,
                        child: Icon(
                          Icons.star,
                          size: 25,
                        ),
                      ),
                    ),
                    onChanged: (value) {
                      setState(() {
                        rating = value;
                      });
                    },
                  ),
                ),
                const SizedBox(height: 5),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    itemData.description,
                    style: const TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 16,
                      color: Color(0xFF4C53A5),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductDetails(itemData: itemData),
                      ),
                    );
                  },
                  child: ButtonModel(
                    containerWidth: MediaQuery.of(context).size.width,
                    itext: "View Details",
                    bgColor: const Color(0xFF4C53A5),
                  ),

                 /* ContainerButtonModel(
            containerWidth: MediaQuery.of(context).size.width * 0.3,
            itext: "View Details",
            bgColor: Color(0xFF4C53A5),
            onTap: () {
              debugPrint('Buy Now button tapped');
              // Add your desired action here
            },
          )
*/


                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
