import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:theonemaintenancetechnician/Feature/home/data/models/add_employee_sales_invoice.dart';
import 'package:theonemaintenancetechnician/Feature/home/data/models/search_result_model.dart';
import 'package:theonemaintenancetechnician/Feature/home/presentation/cubit/home_cubit.dart';


class ProductItemCard extends StatefulWidget {
  final SearchResultModel product;
  final VariantProduct variant;

  const ProductItemCard({super.key, required this.product, required this.variant});

  @override
  State<ProductItemCard> createState() => _ProductItemCardState();
}

class _ProductItemCardState extends State<ProductItemCard> {
  int _quantity = 0;
  bool _oldQuantity = false;

  void _increment() {
    setState(() {
      _quantity++;
      _oldQuantity = false;
    context.read<HomeCubit>().total += widget.product.price * _quantity;
    });
  }

  void _decrement() {
    if (_quantity > 0) {
      setState(() {
        _quantity--;
              _oldQuantity = false;


    
   context.read<HomeCubit>().total +=   widget.product.price * _quantity;
     
      });
    }
  }

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
                 ClipRRect(
                   borderRadius: BorderRadius.circular(10),
                   child: ColoredBox(
                    
                     color: _quantity >0&& !_oldQuantity ? Colors.green :Colors.grey,
                     child: TextButton(onPressed:_quantity>0 && !_oldQuantity? (){
                     final item = collectItemData();
                           setState(() {
                           _oldQuantity = true;
                             
                           });

                     addingItemToList(context, item);
                        
                    
                      log( context.read<HomeCubit>().productList.length.toString());
                      }:null, child:  Text( _quantity >0&& !_oldQuantity ? "اضافة":"تم الاضافة",style: TextStyle(color: Colors.white),)),
                   ),
                 ),
                  
                ],
              ),
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Price: \$${widget.product.price.toStringAsFixed(2)}"),
               SizedBox(width: 20,),
                Row(
                  children: [
                   ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: ColoredBox(
                        color: Color(0xFFFAFAFA),
                        child: IconButton(
                          iconSize: 30,
                          icon: const Icon(Icons.remove),
                          onPressed:_quantity>0?  _decrement:null,
                          color: Colors.red,
                        ),
                      ),
                    ),
                   SizedBox(width: 10,),
                    Text('$_quantity',style: TextStyle(fontSize: 20),),
                   SizedBox(width: 10,),
                       ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: ColoredBox(
                        color: Colors.blue,
                      child: IconButton(
                        iconSize: 30,
                        icon: const Icon(Icons.add),
                        onPressed:      (widget.variant.stockQuantity! > _quantity)?  _increment:null,
                        color: Colors.white,
                      )),
                    ),
                  ],
                )
              ],
            ),
            if (_quantity > 0 )
              Text(
                "Total: \$${(widget.product.price * _quantity).toStringAsFixed(2)}",
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
          ],
        ),
      ),
    );
  }

  void addingItemToList(BuildContext context, SalesInvoiceItem item) {
    
    bool found = false;
    
    for (int i = 0; i < context.read<HomeCubit>().productList.length; i++) {
      final element = context.read<HomeCubit>().productList[i];
    
      if (element.branchID == item.branchID &&
          element.notes == item.notes &&
          element.state == item.state &&
          element.barCode == item.barCode) {
    
        // Found matching item
        found = true;
    
        if (element.quantity != item.quantity) {
          // Quantity differs → Remove old, add updated
          removeItem(context, i);
          addItem(context, item);
        }
    
        break;
      }
    }
    
    if (!found) {
      addItem(context, item);
     context.read<HomeCubit>().items.add(widget.product);
    }
  }
SalesInvoiceItem collectItemData(){
         return    SalesInvoiceItem(
                              
    barCode: widget.variant.barCode,
    isOutput: true,
    itemID: int.parse(widget.variant.sizeID),
    quantity: _quantity,
    price: widget.product.price,
    cost: 0,
    branchID: widget.variant.branchID,
    employeeID:null,
    notes: widget.variant.colorArName,
    discountVal: 0,
    priceType: 0,
    profits:widget.product.price,
    giftQuantity: 0,
    currencyID:0,
    currencyRate: 0,
    sku: widget.product.sku,
    finalPrice: widget.product.price,
    retrenQuantity: 0,
    currentPrice: widget.product.price,
    state: widget.variant.sizeID,
     salesInvoiceNo: 0, 
     salesInvoiceID: 0,
           salesOldInvoiceNo: 0, 
           salesOldInvoiceID: 0, 
           salesOldInvoiceQty: 0,
    
                              );
  
}
  void addItem(BuildContext context,SalesInvoiceItem item) {
  
  
            context.read<HomeCubit>().productList.add(
  item
                              );

                         
                              
          
  }
void removeItem(BuildContext context,int index) {
  
  
            context.read<HomeCubit>().productList.removeAt(
  index
                              );
                        
  
  }
}