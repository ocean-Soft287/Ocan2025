class GetSizeModel {
  final int? totalResultCount;
  final int? resultRowNumber;
  final String? sku;
  final String? modelNo;
  final String? productArName;
  final String? productEnName;
  final String? categoryId;
  final String? categoryArName;
  final String? categoryEnName;
  final String? subcategoryId;
  final String? subcategoryArName;
  final String? subcategoryEnName;
  final String? leafcategoryId;
  final String? leafcategoryArName;
  final String? leafcategoryEnName;
  final String? seasonId;
  final String? seasonArName;
  final String? seasonEnName;
  final String? fabricId;
  final String? fabricArName;
  final String? fabricEnName;
  final String? brandId;
  final String? brandArName;
  final String? brandEnName;
  final String? countryId;
  final String? countryArName;
  final String? countryEnName;
  final int? patternId;
  final String? patternArName;
  final String? patternEnName;
  final String? itemYear;
  final String? description;
  final double? price;
  final double? wholePrice;
  final double? specialPrice;
  final double? salePrice;
  final double? clearancePrice;
  final double? minPrice;
  final String? lastBuy;
  final double? localCost;
  final int? specModificationDate;
  final String? itemImage;
  final int? isFavorite;
  final String? details;
  final int? imagesNo;
  final List<VariantProduct> variantProducts;
  final List<dynamic> itemPhotos;
  final List<dynamic> itemColors;

  GetSizeModel({
    this.totalResultCount,
    this.resultRowNumber,
    this.sku,
    this.modelNo,
    this.productArName,
    this.productEnName,
    this.categoryId,
    this.categoryArName,
    this.categoryEnName,
    this.subcategoryId,
    this.subcategoryArName,
    this.subcategoryEnName,
    this.leafcategoryId,
    this.leafcategoryArName,
    this.leafcategoryEnName,
    this.seasonId,
    this.seasonArName,
    this.seasonEnName,
    this.fabricId,
    this.fabricArName,
    this.fabricEnName,
    this.brandId,
    this.brandArName,
    this.brandEnName,
    this.countryId,
    this.countryArName,
    this.countryEnName,
    this.patternId,
    this.patternArName,
    this.patternEnName,
    this.itemYear,
    this.description,
    this.price,
    this.wholePrice,
    this.specialPrice,
    this.salePrice,
    this.clearancePrice,
    this.minPrice,
    this.lastBuy,
    this.localCost,
    this.specModificationDate,
    this.itemImage,
    this.isFavorite,
    this.details,
    this.imagesNo,
    required this.variantProducts,
    required this.itemPhotos,
    required this.itemColors,
  });

  factory GetSizeModel.fromJson(Map<String, dynamic> json) {
    return GetSizeModel(
      totalResultCount: json['TotalResultCount'] as int?,
      resultRowNumber: json['ResultRowNumber'] as int?,
      sku: json['SKU'] as String?,
      modelNo: json['ModelNo'] as String?,
      productArName: json['ProductArName'] as String?,
      productEnName: json['ProductEnName'] as String?,
      categoryId: json['CategoryId'] as String?,
      categoryArName: json['CategoryArName'] as String?,
      categoryEnName: json['CategoryEnName'] as String?,
      subcategoryId: json['SubcategoryId'] as String?,
      subcategoryArName: json['SubcategoryArName'] as String?,
      subcategoryEnName: json['SubcategoryEnName'] as String?,
      leafcategoryId: json['LeafcategoryId'] as String?,
      leafcategoryArName: json['LeafcategoryArName'] as String?,
      leafcategoryEnName: json['LeafcategoryEnName'] as String?,
      seasonId: json['SeasonID'] as String?,
      seasonArName: json['SeasonArName'] as String?,
      seasonEnName: json['SeasonEnName'] as String?,
      fabricId: json['FabricID'] as String?,
      fabricArName: json['FabricArName'] as String?,
      fabricEnName: json['FabricEnName'] as String?,
      brandId: json['BrandID'] as String?,
      brandArName: json['BrandArName'] as String?,
      brandEnName: json['BrandEnName'] as String?,
      countryId: json['CountryID'] as String?,
      countryArName: json['CountryArName'] as String?,
      countryEnName: json['CountryEnName'] as String?,
      patternId: json['PatternId'] as int?,
      patternArName: json['PatternArName'] as String?,
      patternEnName: json['PatternEnName'] as String?,
      itemYear: json['ItemYear'] as String?,
      description: json['Description'] as String?,
      price: (json['Price'] as num?)?.toDouble(),
      wholePrice: (json['WholePrice'] as num?)?.toDouble(),
      specialPrice: (json['SpecialPrice'] as num?)?.toDouble(),
      salePrice: (json['SalePrice'] as num?)?.toDouble(),
      clearancePrice: (json['ClearancePrice'] as num?)?.toDouble(),
      minPrice: (json['MinPrice'] as num?)?.toDouble(),
      lastBuy: json['LastBuy'] as String?,
      localCost: (json['LocalCost'] as num?)?.toDouble(),
      specModificationDate: json['SPECModificationDate'] as int?,
      itemImage: json['ItemImage'] as String?,
      isFavorite: json['IsFavorite'] as int?,
      details: json['Details'] as String?,
      imagesNo: json['ImagesNo'] as int?,
      variantProducts: (json['VariantProducts'] as List<dynamic>?)
          ?.map((e) => VariantProduct.fromJson(e as Map<String, dynamic>))
          .toList() ??
          [],
      itemPhotos: json['itemPhotos'] as List<dynamic>? ?? [],
      itemColors: json['Item_Colors'] as List<dynamic>? ?? [],
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
      'SeasonID': seasonId,
      'SeasonArName': seasonArName,
      'SeasonEnName': seasonEnName,
      'FabricID': fabricId,
      'FabricArName': fabricArName,
      'FabricEnName': fabricEnName,
      'BrandID': brandId,
      'BrandArName': brandArName,
      'BrandEnName': brandEnName,
      'CountryID': countryId,
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
      'VariantProducts': variantProducts.map((e) => e.toJson()).toList(),
      'itemPhotos': itemPhotos,
      'Item_Colors': itemColors,
    };
  }
}

class VariantProduct {
  final String? barCode;
  final String? colorId;
  final String? colorArName;
  final String? colorEnName;
  final String? colorOnlineName;
  final String? sizeId;
  final String? sizeName;
  final int? stockQuantity;
  final int? code;
  final int? stkModificationDate;
  final String? branchId;
  final String? branchName;
  final String? branchEName;
  final List<dynamic> itemPhotos;

  VariantProduct({
    this.barCode,
    this.colorId,
    this.colorArName,
    this.colorEnName,
    this.colorOnlineName,
    this.sizeId,
    this.sizeName,
    this.stockQuantity,
    this.code,
    this.stkModificationDate,
    this.branchId,
    this.branchName,
    this.branchEName,
    required this.itemPhotos,
  });

  factory VariantProduct.fromJson(Map<String, dynamic> json) {
    return VariantProduct(
      barCode: json['BarCode'] as String?,
      colorId: json['ColorID'] as String?,
      colorArName: json['ColorArName'] as String?,
      colorEnName: json['ColorEnName'] as String?,
      colorOnlineName: json['ColorOnlineName'] as String?,
      sizeId: json['SizeID'] as String?,
      sizeName: json['SizeName'] as String?,
      stockQuantity: json['StockQuantity'] as int?,
      code: json['Code'] as int?,
      stkModificationDate: json['STKModificationDate'] as int?,
      branchId: json['BranchID'] as String?,
      branchName: json['BranchName'] as String?,
      branchEName: json['BranchEName'] as String?,
      itemPhotos: json['itemPhotos'] as List<dynamic>? ?? [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'BarCode': barCode,
      'ColorID': colorId,
      'ColorArName': colorArName,
      'ColorEnName': colorEnName,
      'ColorOnlineName': colorOnlineName,
      'SizeID': sizeId,
      'SizeName': sizeName,
      'StockQuantity': stockQuantity,
      'Code': code,
      'STKModificationDate': stkModificationDate,
      'BranchID': branchId,
      'BranchName': branchName,
      'BranchEName': branchEName,
      'itemPhotos': itemPhotos,
    };
  }
}