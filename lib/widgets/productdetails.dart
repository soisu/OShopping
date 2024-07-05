import 'package:flutter/material.dart';
import 'package:online_shopping/CartPage.dart';
import 'package:online_shopping/models/Product_Data.dart';
import 'package:online_shopping/widgets/containerbuttonmodel.dart';

class ProductDetails extends StatelessWidget {
  final ItemData itemData;

  ProductDetails({required this.itemData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Product Full Details",
          style: TextStyle(
            color: Color(0xFF4C53A5),
            fontWeight: FontWeight.w600,
            fontSize: 25,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            size: 20,
            color: Color(0xFF4C53A5),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                height: 200,
                child: Image.asset(
                  itemData.images.isNotEmpty ? itemData.images[0] : 'assets/images/placeholder.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 10),
            _buildDetailRow(Icons.label, "Name", itemData.name),
            _buildDetailRow(Icons.category, "Category", itemData.category),
            _buildDetailRow(Icons.branding_watermark, "Brand", itemData.brand),
            _buildDetailRow(Icons.description, "Description", itemData.description),
            _buildDetailRow(Icons.format_size, "Sizes", itemData.sizes.join(', ')),
            _buildDetailRow(Icons.color_lens, "Color", itemData.color),
            _buildDetailRow(Icons.price_check, "Price", "${itemData.price} MMK"),
            _buildDetailRow(Icons.store, "Available", itemData.available.toString()),
            _buildDetailRow(Icons.star, "Rating", itemData.rating.toString()),
            _buildDetailRow(Icons.update, "Update Status", itemData.updateStatus),


            InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CartPage()),
                    );
                  },
                  child: ContainerButtonModel(
                    containerWidth: MediaQuery.of(context).size.width,
                    itext: "Add to Cart",
                    bgColor: Color(0xFF4C53A5),
                  ),
                ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(
            icon,
            color: Color(0xFF4C53A5),
          ),
          SizedBox(width: 10),
          Text(
            "$label: ",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Colors.black,
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[700],
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          
        ],
      ),
    );
  }
}
