import 'dart:async';

import 'package:flutter/material.dart';
import 'package:simple_barcode_scanner/simple_barcode_scanner.dart';

class SearchUsingBarCode extends StatefulWidget {
 final void Function({required String barcode})? onSearch;
  const SearchUsingBarCode({super.key,required this.onSearch});

  @override
  State<SearchUsingBarCode> createState() => _SearchUsingBarCodeState();
}

class _SearchUsingBarCodeState extends State<SearchUsingBarCode> {
    String? barcode;
     final TextEditingController _searchController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return TextFormField(
                  onTap: () async{
                        barcode = await SimpleBarcodeScanner.scanBarcode(
                          context,
                          barcodeAppBar: const BarcodeAppBar(
                            appBarTitle: 'Test',
                            centerTitle: false,
                            enableBackButton: true,
                            backButtonIcon: Icon(Icons.arrow_back_ios),
                          ),
                          isShowFlashIcon: true,
                          delayMillis: 500,
                          cameraFace: CameraFace.back,
                          scanFormat: ScanFormat.ONLY_BARCODE,
                        );
                        setState(() {
                          _searchController.text = barcode ?? "";
                        });

                        if (barcode != '-1' && barcode != null && mounted) {
                          setState(() {
                            _searchController.text = barcode!;
                          });
                          String trimmedBarcode = barcode!.trim();
                          widget.onSearch!(barcode: trimmedBarcode);

                      //   context.read<SearchCubit>().getSearch(search: trimmedBarcode);
                       
                        } else {
                          setState(() {
                            _searchController.text = "الباركود غير صحيح";
                          });
                        }
                     
                    
                  },
                  controller: _searchController,
                  onChanged: (text) {
                    Timer(const Duration (seconds: 1), (){
                       // context.read<SearchCubit>() .getSearch(search: text);
                       
                    });
                  },
                
                  decoration: InputDecoration(
                  suffixIcon:_searchController.text.isNotEmpty?  IconButton(onPressed: (){
                    _searchController.clear();
                    setState(() {
                      _searchController.text = "";
                    });
                  }, icon: const Icon(Icons.close)):null,
                   
               
                    hintText:'ابحث عن المنتج',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    contentPadding:
                        const EdgeInsets.symmetric(vertical: 2, horizontal: 5),
                  ),
                );
       
  }
}

 