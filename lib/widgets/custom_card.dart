import 'package:boumedstore/models/product_model.dart';
import 'package:boumedstore/views/update_product_view.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomCard extends StatefulWidget {
  const CustomCard({super.key, required this.product});
  final ProductModel product;

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  bool ontap = false;
  @override
  void initState() {
    ontap = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return UpdateProductView(
            product: widget.product,
          );
        }));
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            // height: 130,
            // width: 210,
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(.2),
                spreadRadius: 0,
                blurRadius: 40,
                offset: const Offset(10, 10),
              ),
            ]),
            child: Card(
              elevation: 10,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.product.title.substring(0, 11),
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          r'$' ' ${widget.product.price}',
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            ontap = !ontap;
                            setState(() {});
                          },
                          child: Icon(
                            ontap ? Icons.favorite : Icons.favorite_border,
                            color: Colors.red,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            right: 30,
            bottom: 75,
            child: CachedNetworkImage(
              width: 100,
              height: 100,
              imageUrl: widget.product.image,
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  Center(
                      child: CircularProgressIndicator(
                          value: downloadProgress.progress)),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
        ],
      ),
    ));
  }
}
