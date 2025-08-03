import 'package:flutter/material.dart';
import 'package:theonemaintenancetechnician/Feature/home/data/models/get_product_color_model.dart';
import 'package:theonemaintenancetechnician/core/utils/services/navigation_service.dart';

class ProductItemColorCard extends StatefulWidget {
  final GetProductColorModel product;
  final VariantProduct variant;
  final Function(String color) onColorSelected;

  const ProductItemColorCard({super.key, required this.product, required this.variant, required this.onColorSelected});

  @override
  State<ProductItemColorCard> createState() => _ProductItemColorCardState();
}

class _ProductItemColorCardState extends State<ProductItemColorCard> {
String get getColorName =>
  NavigationService.getCurrentLocale() == Locale("en")?
                   widget.variant.colorEnName??"" : widget.variant.colorArName??"";

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[200],
    //  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 236,
              child: Row(
                       
                children: [
                 
                  Text(
                    "Branch: ${widget.variant.branchName}",
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                       Spacer(),
                InkWell(
                  onTap: () => widget.onColorSelected(getColorName),
                  child: Text("Item Color ${NavigationService.getCurrentLocale() == Locale("en")?
                   widget.variant.colorEnName : widget.variant.colorArName}"),
                ),
                ],
              ),
            ),
            const SizedBox(height: 40),
          
          ],
        ),
      ),
    );
  }

}