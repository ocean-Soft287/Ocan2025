import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:theonemaintenancetechnician/Feature/Auth/presentation/view/widget/custom_text_field.dart';
import 'package:theonemaintenancetechnician/Feature/home/data/models/search_result_model.dart';
import 'package:theonemaintenancetechnician/Feature/home/presentation/cubit/home_cubit.dart';
import 'package:theonemaintenancetechnician/Feature/home/presentation/cubit/home_state.dart';
import 'package:theonemaintenancetechnician/Feature/home/presentation/view/widget/plus_minus_values.dart';
import 'package:theonemaintenancetechnician/core/Font/font.dart';
import 'package:theonemaintenancetechnician/core/color/colors.dart';


class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();

  Timer? _debounceTimer;

  @override
  void dispose() {
    _debounceTimer?.cancel(); // Cancel the debounce timer
    _searchController.dispose();
    super.dispose();
  }

  // Debounce function to delay requests
  void _debounceSearch(VoidCallback callback) {
    _debounceTimer?.cancel(); // Cancel any existing timer
    _debounceTimer = Timer(const Duration(milliseconds: 800), callback);
  }


  String? barcode;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: AppColors.kprimary,
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          ' اختيار الاصناف ',
          style: TextStyle(
            fontFamily: Font.inter,
            fontWeight: FontWeight.w600,
            fontSize: 16.sp,
            color: AppColors.white,
          ),
        ),
        centerTitle: true,
      ),

      body: Column(
        children: [
          SizedBox(height: 10.h),
            SizedBox(
            width: MediaQuery.sizeOf(context).width * .8,
            child: CustomTextField(

              textvaidation: '',
              controller: _searchController,
              margin: EdgeInsets.symmetric(horizontal: 1.w),
              onChanged: (text) {
                
_debounceSearch((){
  context.read<HomeCubit>().search(keyword: text);

});
              },

              hintText: 'البحث عن المنتج ',
            ),
          ),
       


               SizedBox(height: 10.h),

          BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              if (state is SearchLoading
               ) {
                return const Center(child: CircularProgressIndicator());
              }
              else if (state is SearchError) {
                return Center(child: Text(state.message));
              }
          else if (state is SearchSuccess){
              return search(state);
              }
              return  Container();

            },
          ),
     
       
        ],
      ),
    );
  }

  Expanded search(SearchSuccess state) {
    return Expanded(
              child:     ListView.builder(
                                  itemCount: state.data.length,
                                  itemBuilder: (context, index) {
                                    SearchResultModel product =
                                        state.data[index];
                                    return
                                     InkWell(
                                      onTap: () =>          context.read<HomeCubit>().  selectItem(),
                                       child: Card(
                                        color: Colors.white,
                                        elevation: 5,
                                        margin: const EdgeInsets.symmetric(
                                          horizontal: 16,
                                          vertical: 8,
                                        ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(12),
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            // Product Title
                                            Padding(
                                              padding: const EdgeInsets.all(12.0),
                                              child:     Text(
                                                    product.productEnName.isNotEmpty
                                                        ? product.productEnName
                                                        : product.productArName,
                                                    style: Theme.of(
                                                      context,
                                                    ).textTheme.titleMedium?.copyWith(
                                                      fontWeight: FontWeight.bold,
                                                    ),
                                                  ),
                                              
                                           
                                            ),
                                                               
                                            // SKU and Model No
                                            _buildRow("SKU", product.sku),
                                            _buildRow("Model", product.modelNo),
                                                               
                                            // Category Info
                                            _buildRow(
                                              "Category",
                                              "${product.categoryEnName} / ${product.categoryArName}",
                                            ),
                                            _buildRow(
                                              "Subcategory",
                                              "${product.subcategoryEnName} / ${product.subcategoryArName}",
                                            ),
                                                               
                                            // Price
                                            _buildRow(
                                              "Price",
                                              "${product.price.toStringAsFixed(2)} EGP",
                                            ),
                                                               
                                            // Variant Products
                                            if (product
                                                .variantProducts
                                                .isNotEmpty)
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                      horizontal: 12.0,
                                                      vertical: 8,
                                                    ),
                                                child: Text(
                                                  "Variants ",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyMedium
                                                      ?.copyWith(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                ),
                                              ),
                                                               
                                            // Loop over variants
                                            ...product.variantProducts.map(
                                              (variant) =>(variant.stockQuantity<=0) ?SizedBox() :Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                      horizontal: 16.0,
                                                      vertical: 4,
                                                    ),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                               Row(
                                                children: [
                                                  ProductItemCard(
                                                    variant: variant,
                                                    product: product,
                                                    
                                                  ),
                                              
                                                ],
                                              ),
                                           
                                                    _buildRow(
                                                      "Barcode",
                                                      variant.barCode,
                                                    ),
                                                    _buildRow(
                                                      "Color",
                                                      "${variant.colorEnName} / ${variant.colorArName}",
                                                    ),
                                                    // _buildRow(
                                                    //   "Branch Name",
                                                    //   variant.branchName,
                                                    // ),
                                                    _buildRow(
                                                      "Size",
                                                      variant.sizeName,
                                                    ),
                                                    _buildRow(
                                                      "Stock",
                                                      variant.stockQuantity
                                                          .toString(),
                                                    ),
                                          product.variantProducts.length>1?
                                            const Divider(height: 16):SizedBox(),
                                                  ],
                                                ),
                                              ),
                                            ),
                                                               
                                            const SizedBox(height: 8),
                                       
                                          ],
                                        ),
                                                                           ),
                                     );
                                 
                                  },
                                ),
                     
            
            );
  }

  Widget _buildRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4),
      child: Row(
        children: [
          Text("$label: ", style: const TextStyle(fontWeight: FontWeight.bold)),
          Text(value),
        ],
      ),
    );
  }

}
