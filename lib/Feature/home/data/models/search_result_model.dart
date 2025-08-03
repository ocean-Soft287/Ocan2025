class SearchResultModel {
  final int totalResultCount;
  final int resultRowNumber;
  final String sku;
  final String modelNo;
  final String productArName;
  final String productEnName;
  final String categoryId;
  final String categoryArName;
  final String categoryEnName;
  final String subcategoryId;
  final String subcategoryArName;
  final String subcategoryEnName;
  final String leafcategoryId;
  final String leafcategoryArName;
  final String leafcategoryEnName;
  final String seasonID;
  final String seasonArName;
  final String seasonEnName;
  final String fabricID;
  final String fabricArName;
  final String fabricEnName;
  final String brandID;
  final String brandArName;
  final String brandEnName;
  final String countryID;
  final String countryArName;
  final String countryEnName;
  final int patternId;
  final String patternArName;
  final String patternEnName;
  final String itemYear;
  final String description;
  final double price;
  final double wholePrice;
  final double specialPrice;
  final double salePrice;
  final double clearancePrice;
  final double minPrice;
  final dynamic lastBuy;
  final dynamic localCost;
  final int specModificationDate;
  final dynamic itemImage;
  final int isFavorite;
  final dynamic details;
  final int imagesNo;
  final List<VariantProduct> variantProducts;
  final List<dynamic> itemPhotos;
  final List<dynamic> itemColors;

  SearchResultModel({
    required this.totalResultCount,
    required this.resultRowNumber,
    required this.sku,
    required this.modelNo,
    required this.productArName,
    required this.productEnName,
    required this.categoryId,
    required this.categoryArName,
    required this.categoryEnName,
    required this.subcategoryId,
    required this.subcategoryArName,
    required this.subcategoryEnName,
    required this.leafcategoryId,
    required this.leafcategoryArName,
    required this.leafcategoryEnName,
    required this.seasonID,
    required this.seasonArName,
    required this.seasonEnName,
    required this.fabricID,
    required this.fabricArName,
    required this.fabricEnName,
    required this.brandID,
    required this.brandArName,
    required this.brandEnName,
    required this.countryID,
    required this.countryArName,
    required this.countryEnName,
    required this.patternId,
    required this.patternArName,
    required this.patternEnName,
    required this.itemYear,
    required this.description,
    required this.price,
    required this.wholePrice,
    required this.specialPrice,
    required this.salePrice,
    required this.clearancePrice,
    required this.minPrice,
    this.lastBuy,
    this.localCost,
    required this.specModificationDate,
    this.itemImage,
    required this.isFavorite,
    this.details,
    required this.imagesNo,
    required this.variantProducts,
    required this.itemPhotos,
    required this.itemColors,
  });

factory SearchResultModel.fromJson(Map<String, dynamic> json) {
  var variantList = json['VariantProducts'] as List?;
  List<VariantProduct> variants = variantList != null
      ? variantList.map((i) => VariantProduct.fromJson(i)).toList()
      : [];

  return SearchResultModel(
    totalResultCount: json['TotalResultCount'] ?? 0,
    resultRowNumber: json['ResultRowNumber'] ?? 0,
    sku: json['SKU'].toString(),
    modelNo: json['ModelNo'].toString(),
    productArName: json['ProductArName'] ?? '',
    productEnName: json['ProductEnName'] ?? '',
    categoryId: json['CategoryId'].toString(),
    categoryArName: json['CategoryArName'] ?? '',
    categoryEnName: json['CategoryEnName'] ?? '',
    subcategoryId: json['SubcategoryId'].toString(),
    subcategoryArName: json['SubcategoryArName'] ?? '',
    subcategoryEnName: json['SubcategoryEnName'] ?? '',
    leafcategoryId: json['LeafcategoryId'].toString(),
    leafcategoryArName: json['LeafcategoryArName'] ?? '',
    leafcategoryEnName: json['LeafcategoryEnName'] ?? '',
    seasonID: json['SeasonID'].toString(),
    seasonArName: json['SeasonArName'] ?? '',
    seasonEnName: json['SeasonEnName'] ?? '',
    fabricID: json['FabricID'].toString(),
    fabricArName: json['FabricArName'] ?? '',
    fabricEnName: json['FabricEnName'] ?? '',
    brandID: json['BrandID'].toString(),
    brandArName: json['BrandArName'] ?? '',
    brandEnName: json['BrandEnName'] ?? '',
    countryID: json['CountryID'].toString(),
    countryArName: json['CountryArName'] ?? '',
    countryEnName: json['CountryEnName'] ?? '',
    patternId: json['PatternId'] ?? 0,
    patternArName: json['PatternArName'] ?? '',
    patternEnName: json['PatternEnName'] ?? '',
    itemYear: json['ItemYear']?.toString() ?? '',
    description: json['Description'] ?? '',
    price: (json['Price'] is num)
        ? json['Price'].toDouble()
        : double.tryParse(json['Price'].toString()) ?? 0.0,
    wholePrice: (json['WholePrice'] is num)
        ? json['WholePrice'].toDouble()
        : double.tryParse(json['WholePrice'].toString()) ?? 0.0,
    specialPrice: (json['SpecialPrice'] is num)
        ? json['SpecialPrice'].toDouble()
        : double.tryParse(json['SpecialPrice'].toString()) ?? 0.0,
    salePrice: (json['SalePrice'] is num)
        ? json['SalePrice'].toDouble()
        : double.tryParse(json['SalePrice'].toString()) ?? 0.0,
    clearancePrice: (json['ClearancePrice'] is num)
        ? json['ClearancePrice'].toDouble()
        : double.tryParse(json['ClearancePrice'].toString()) ?? 0.0,
    minPrice: (json['MinPrice'] is num)
        ? json['MinPrice'].toDouble()
        : double.tryParse(json['MinPrice'].toString()) ?? 0.0,
    lastBuy: json['LastBuy'],
    localCost: json['LocalCost'],
    specModificationDate: json['SPECModificationDate'] ?? 0,
    itemImage: json['ItemImage'],
    isFavorite: json['IsFavorite'] ?? 0,
    details: json['Details'],
    imagesNo: json['ImagesNo'] ?? 0,
    variantProducts: variants,
    itemPhotos: json['itemPhotos'] ?? [],
    itemColors: json['Item_Colors'] ?? [],
  );
}
  Map<String, dynamic> toJson() {
    return {
      'TotalResultCount': totalResultCount,
      'ResultRowNumber': resultRowNumber,
      'SKU': sku,
      'ModelNo': modelNo,
      'ProductArName': productArName,
      'ProductEnName': productEnName,
      'CategoryId': categoryId,
      'CategoryArName': categoryArName,
      'CategoryEnName': categoryEnName,
      'SubcategoryId': subcategoryId,
      'SubcategoryArName': subcategoryArName,
      'SubcategoryEnName': subcategoryEnName,
      'LeafcategoryId': leafcategoryId,
      'LeafcategoryArName': leafcategoryArName,
      'LeafcategoryEnName': leafcategoryEnName,
      'SeasonID': seasonID,
      'SeasonArName': seasonArName,
      'SeasonEnName': seasonEnName,
      'FabricID': fabricID,
      'FabricArName': fabricArName,
      'FabricEnName': fabricEnName,
      'BrandID': brandID,
      'BrandArName': brandArName,
      'BrandEnName': brandEnName,
      'CountryID': countryID,
      'CountryArName': countryArName,
      'CountryEnName': countryEnName,
      'PatternId': patternId,
      'PatternArName': patternArName,
      'PatternEnName': patternEnName,
      'ItemYear': itemYear,
      'Description': description,
      'Price': price,
      'WholePrice': wholePrice,
      'SpecialPrice': specialPrice,
      'SalePrice': salePrice,
      'ClearancePrice': clearancePrice,
      'MinPrice': minPrice,
      'LastBuy': lastBuy,
      'LocalCost': localCost,
      'SPECModificationDate': specModificationDate,
      'ItemImage': itemImage,
      'IsFavorite': isFavorite,
      'Details': details,
      'ImagesNo': imagesNo,
      'VariantProducts': variantProducts.map((v) => v.toJson()).toList(),
      'itemPhotos': itemPhotos,
      'Item_Colors': itemColors,
    };
  }
}
class VariantProduct {
  final String barCode;
  final String colorID;
  final String colorArName;
  final String colorEnName;
  final String colorOnlineName;
  final String sizeID;
  final String sizeName;
  final int stockQuantity;
  final int code;
  final int stkModificationDate;
  final String branchID;
  final String branchName;
  final String branchEName;
  final List<dynamic> itemPhotos;

  VariantProduct({
    required this.barCode,
    required this.colorID,
    required this.colorArName,
    required this.colorEnName,
    required this.colorOnlineName,
    required this.sizeID,
    required this.sizeName,
    required this.stockQuantity,
    required this.code,
    required this.stkModificationDate,
    required this.branchID,
    required this.branchName,
    required this.branchEName,
    required this.itemPhotos,
  });

  factory VariantProduct.fromJson(Map<String, dynamic> json) {
    return VariantProduct(
      barCode: json['BarCode'] ?? '',
      colorID: json['ColorID'] ?? '',
      colorArName: json['ColorArName'] ?? '',
      colorEnName: json['ColorEnName'] ?? '',
      colorOnlineName: json['ColorOnlineName'] ?? '',
      sizeID: json['SizeID'].toString(),
      sizeName: json['SizeName'] ?? '',
      stockQuantity: json['StockQuantity'] ?? 0,
      code: json['Code'] ?? 0,
      stkModificationDate: json['STKModificationDate'] ?? 0,
      branchID: json['BranchID'].toString(),
      branchName: json['BranchName'] ?? '',
      branchEName: json['BranchEName'] ?? '',
      itemPhotos: json['itemPhotos'] ?? [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'BarCode': barCode,
      'ColorID': colorID,
      'ColorArName': colorArName,
      'ColorEnName': colorEnName,
      'ColorOnlineName': colorOnlineName,
      'SizeID': sizeID,
      'SizeName': sizeName,
      'StockQuantity': stockQuantity,
      'Code': code,
      'STKModificationDate': stkModificationDate,
      'BranchID': branchID,
      'BranchName': branchName,
      'BranchEName': branchEName,
      'itemPhotos': itemPhotos,
    };
  }
}