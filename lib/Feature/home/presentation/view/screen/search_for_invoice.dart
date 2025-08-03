import 'dart:async';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:simple_barcode_scanner/simple_barcode_scanner.dart';
import 'package:theonemaintenancetechnician/Feature/Auth/presentation/view/widget/custom_text_field.dart';
import 'package:theonemaintenancetechnician/Feature/home/data/models/get_product_color_model.dart';
import 'package:theonemaintenancetechnician/Feature/home/data/models/search_product_by_sku._or_barCode.dart';
import 'package:theonemaintenancetechnician/Feature/home/data/models/search_result_model.dart';
import 'package:theonemaintenancetechnician/Feature/home/presentation/cubit/home_cubit.dart';
import 'package:theonemaintenancetechnician/Feature/home/presentation/cubit/home_state.dart';
import 'package:theonemaintenancetechnician/Feature/home/presentation/view/screen/search_by_code.dart';
import 'package:theonemaintenancetechnician/Feature/home/presentation/view/widget/plus_minus_values.dart';
import 'package:theonemaintenancetechnician/core/Font/font.dart';
import 'package:theonemaintenancetechnician/core/color/colors.dart';
import 'package:theonemaintenancetechnician/core/customwidget/custombutton.dart';
import '../../../data/models/get_size_model.dart';

class SearchForInvoice extends StatefulWidget {
  const SearchForInvoice({super.key});

  @override
  State<SearchForInvoice> createState() => _SearchForInvoiceState();
}

class _SearchForInvoiceState extends State<SearchForInvoice> {
  final TextEditingController _searchbySKUForProductController = TextEditingController();
  final TextEditingController _getSKUForColorController = TextEditingController();
  final TextEditingController _searchBySKUColorForController = TextEditingController();
  final TextEditingController _searchBySKUColorsizeController = TextEditingController();
  bool isSelected =false;

  Timer? _debounceTimer;

  @override
  void dispose() {
    _debounceTimer?.cancel(); // Cancel the debounce timer
    _searchbySKUForProductController.dispose();
    _getSKUForColorController.dispose();
    _searchBySKUColorForController.dispose();
    super.dispose();
  }

  // Debounce function to delay requests
  void _debounceSearch(VoidCallback callback) {
    _debounceTimer?.cancel(); // Cancel any existing timer
    _debounceTimer = Timer(const Duration(milliseconds: 1100), callback);
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
          'البحث عن المنتج',
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: Row(
                children: [
                  SizedBox(
                  width: MediaQuery.sizeOf(context).width * .8,
                  child: CustomTextField(

                    textvaidation: '',
                    controller: _searchbySKUForProductController,
                    margin: EdgeInsets.symmetric(horizontal: 1.w),
                    onChanged: (text) {

                  _debounceSearch((){
                    context.read<HomeCubit>().sarchProductBySKU(keyword: text);

                  });
                    },
                    onFieldSubmitted: (item){

                    },
                    hintText: 'ادخل رقم المنتج ',
                  ),
                            ),
                  Spacer(),
                  IconButton(
                    icon: const Icon(Icons.qr_code_scanner),
                    onPressed: () async {
                      String? barcode = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (
                              context) => const SimpleBarcodeScannerPage(),
                        ),
                      );

                      if (barcode != null && barcode != '-1' && barcode
                          .trim()
                          .isNotEmpty) {
                        String trimmedBarcode = barcode.trim();

                        context.read<HomeCubit>().searchProductByBarCode(
                            keyword: trimmedBarcode);

                        print('Gamal');
                      }
                    }
                  ),
                ],
              ),
            ),



               SizedBox(height: 10.h),

          BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              if (state is SearchLoading ||state is SearchBySKUColorsizerLoading || state is SearchProductBySKUOrByBarCodeLoading ||state is  SearchBySKUColorLoading) {
                return const Center(child: CircularProgressIndicator());
              }
              else if (state is SearchError) {
                return Center(child: Text(state.message));
              }


    else if (state is SearchProductBySKUOrByBarCodeSucess) {
                return sarchProductBySKU(state);
              }

     else if (state is GetProductColorsBySKUSucess){
                return getProductColorsBySKU(state);
}    else if (state is SearchBySKUColorSuccess){
                return searchBySKUColorForSize(state);
}
     else if(state is SearchBySKUColorsizerSuccess){
       return showInovice(state);
              }
           
              return  Container();
            },
          ),


        ],
      ),
    );
  }


  Expanded getProductColorsBySKU(GetProductColorsBySKUSucess state) {
    return Expanded(
              child:     ListView.builder(
                                  itemCount: state.data.length,
                                  itemBuilder: (context, index) {
                                    GetProductColorModel product =
                                        state.data[index];
                                    return
                                     Card(
                                      color: Colors.white,
                                      elevation: 5,
                                      margin: const EdgeInsets.symmetric(
                                        horizontal: 16,
                                        vertical: 8,
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child:
                                      Container(
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(20),
                                            border: Border.all(color: AppColors.kprimary)
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [

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
                                                  "Variants ${product.variantProducts.length} ",
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
                                              (variant) =>Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                      horizontal: 16.0,
                                                      vertical: 10,
                                                    ),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [

                                              //  Row(
                                              //   children: [
                                              //     ProductItemColorCard(
                                              //       variant: variant ,
                                              //       product: product, onColorSelected: (String color) {
                                              //       context.read<HomeCubit>().  selectItem();
                                              //       },

                                              //     ),

                                              //   ],
                                              // ),

                                                    // _buildRow(
                                                    //   "ColorID",
                                                    //   variant.colorID.toString(),
                                                    // ),
                                                    _buildRow(
                                                      "Color",
                                                      "${variant.colorEnName} / ${variant.colorArName}",
                                                    ),
                                                    // _buildRow(
                                                    //   "Branch Name",
                                                    //   variant.branchName,
                                                    // ),
                                                    // _buildRow(
                                                    //   "colorOnlineName",
                                                    //   variant.colorOnlineName!,
                                                    // ),
                                                    // _buildRow(
                                                    //   "Stock",
                                                    //   variant.stockQuantity
                                                    //       .toString(),
                                                    // ),
                                                    const SizedBox(height: 20),

                                                    Row(
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      children: [
                                                        CustomButton(
                                                          name: 'اختيار',
                                                        width: .8 * MediaQuery.of(context).size.width,
                                                        height: 50,
                                                          onTap: (){
                                                        _getSKUForColorController.text = variant.colorArName.toString();
                                                        FocusScope.of(context).unfocus();

                                                        context.read<HomeCubit>().selectItem();
                                                        context.read<HomeCubit>().searchBySKUColor(searchKey:     _searchbySKUForProductController.text, color:     _getSKUForColorController.text);

                                                                                                          }, ),
                                                      ],
                                                    )


                                                  ],
                                                ),
                                              ),
                                            ),

                                            const SizedBox(height: 10),
                                          ],
                                        ),
                                      ),
                                    );

                                  },
                                ),


            );
  }
  Expanded sarchProductBySKU(SearchProductBySKUOrByBarCodeSucess state) {
    return Expanded(
              child:   state.data.isEmpty? Center(child: Text('لا يوجد منتجات'),):  ListView.builder(
                                  itemCount: state.data.length,
                                  itemBuilder: (context, index) {
                                    SearchProductBySkuORBarCode product =
                                        state.data[index];
                                    return
                                     Card(
                                      color: Colors.white,
                                      elevation: 5,

                                      margin: const EdgeInsets.symmetric(
                                        horizontal: 16,
                                        vertical: 10,
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child:
                                      Container(
decoration: BoxDecoration(
  borderRadius: BorderRadius.circular(20),
  border: Border.all(color: AppColors.kprimary)
),
                                        padding: const EdgeInsets.all(10.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            // Product Title
                                            Padding(
                                              padding: const EdgeInsets.all(12.0),
                                              child:     Text(
                                               product.sku! ,
                                                    style: Theme.of(
                                                      context,
                                                    ).textTheme.titleMedium?.copyWith(
                                                      fontWeight: FontWeight.bold,
                                                    ),
                                                  ),


                                            ),

                                            // SKU and Model No
                                            _buildRow("SKU", product.sku!),
                                          //  _buildRow("Model", product.modelNo.toString()),
                                         SizedBox(height: 20,),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                CustomButton(
                                                    name: 'اختيار',
                                                  width: .8 * MediaQuery.of(context).size.width,
                                                  height: 50,
                                                    onTap: (){
                                                  _searchbySKUForProductController.text = product.sku.toString();
                                                  FocusScope.of(context).unfocus();

                                                  context.read<HomeCubit>().selectItem();
                                                  context.read<HomeCubit>()
                                                      .getProductColorsBySKU(keyword:
                                                  _searchbySKUForProductController.text );

                                                },

                                                    ),
                                              ],
                                            )

,                                            SizedBox(height: 10,),

                                          ],
                                        ),
                                      ),
                                                                         );

                                  },
                                ),


            );
  }
  Expanded searchBySKUColorForSize(SearchBySKUColorSuccess state) {
    return Expanded(
              child:     ListView.builder(
                                  itemCount: state.data.length,
                                  itemBuilder: (context, index) {
                                    GetSizeModel product =
                                        state.data[index];
                                    return
                                     Card(
                                      color: Colors.white,
                                      elevation: 5,
                                      margin: const EdgeInsets.symmetric(
                                        horizontal: 16,
                                        vertical: 10,
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child:
                                      Container(
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(20),
                                            border: Border.all(color: AppColors.kprimary)
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            // Product Title
                                            Padding(
                                              padding: const EdgeInsets.all(12.0),
                                              child:     Text(
                                               product.sku! ,
                                                    style: Theme.of(
                                                      context,
                                                    ).textTheme.titleMedium?.copyWith(
                                                      fontWeight: FontWeight.bold,
                                                    ),
                                                  ),


                                            ),

                                            ...product.variantProducts.map(
                                                  (variant) =>Padding(
                                                padding:
                                                const EdgeInsets.symmetric(
                                                  horizontal: 16.0,
                                                  vertical: 4,
                                                ),
                                                child: Column(
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                                  children: [

                                                    // _buildRow(
                                                    //   "Size ID",
                                                    //   variant.sizeId.toString(),
                                                    // ),
                                                    _buildRow(
                                                      "Size Name",
                                                      "${variant.sizeName} ",
                                                    ),

SizedBox(height: 20,),
                                                    Row(
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      children: [
                                                        CustomButton(
                                                          width: .8 * MediaQuery.of(context).size.width,
                                                          height: 50,
                                                            name: 'اختيار',


                                                            onTap: (){
                                                          _searchBySKUColorsizeController.text =
                                                              variant.sizeName.toString();
                                                          FocusScope.of(context).unfocus();

                                                          context.read<HomeCubit>().selectItem();
                                                          context.read<HomeCubit>()
                                                              .searchBySKUColorsize(searchKey:
                                                          _searchbySKUForProductController.text,
                                                              color:
                                                          _getSKUForColorController.text,
                                                              size:   _searchBySKUColorsizeController.text);

                                                        },),
                                                      ],
                                                    )
                                                 ,   SizedBox(height: 20,),

                                                  ],
                                                ),
                                              ),
                                            ),

                                          ],
                                        ),
                                      ),
                                                                         );

                                  },
                                ),


            );
  }
  Expanded showInovice(SearchBySKUColorsizerSuccess state) {
    return
      Expanded(
      child:
      ListView.builder(
        itemCount: state.data.length,
        itemBuilder: (context, index) {
          SearchResultModel product = state.data[index];
          return Card(
            color: Colors.white,
            elevation: 5,
            margin: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 8,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child:
            Container(

              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: AppColors.kprimary)
              ),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Invoice Details
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      'Total Result'
                       ,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                     // Variant Products
                                            if (product
                                                .variantProducts
                                                .isNotEmpty)
                                               Column(children: [
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
                                               ...product.variantProducts!.map(
                                                     (variant) =>(variant.stockQuantity!<=0) ?SizedBox() :Padding(
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

                                                     ],
                                                   ),
                                                 ),
                                               ),
                                             ],),

                                                               
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
