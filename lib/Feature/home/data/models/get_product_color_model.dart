class GetProductColorModel {
  int? totalResultCount;
  int? resultRowNumber;
  String? sku;
  dynamic modelNo;
  dynamic productArName;
  dynamic productEnName;
  dynamic categoryId;
  dynamic categoryArName;
  dynamic categoryEnName;
  dynamic subcategoryId;
  dynamic subcategoryArName;
  dynamic subcategoryEnName;
  dynamic leafcategoryId;
  dynamic leafcategoryArName;
  dynamic leafcategoryEnName;
  dynamic seasonID;
  dynamic seasonArName;
  dynamic seasonEnName;
  dynamic fabricID;
  dynamic fabricArName;
  dynamic fabricEnName;
  dynamic brandID;
  dynamic brandArName;
  dynamic brandEnName;
  dynamic countryID;
  dynamic countryArName;
  dynamic countryEnName;
  int? patternId;
  dynamic patternArName;
  dynamic patternEnName;
  dynamic itemYear;
  dynamic description;
  dynamic price;
  dynamic wholePrice;
  dynamic specialPrice;
  dynamic salePrice;
  dynamic clearancePrice;
  dynamic minPrice;
  dynamic lastBuy;
  dynamic localCost;
  int? specModificationDate;
  dynamic itemImage;
  int? isFavorite;
  dynamic details;
  int? imagesNo;
  List<VariantProduct> variantProducts;
  List<dynamic> itemPhotos;
  List<dynamic> itemColors;

  GetProductColorModel({
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
    this.seasonID,
    this.seasonArName,
    this.seasonEnName,
    this.fabricID,
    this.fabricArName,
    this.fabricEnName,
    this.brandID,
    this.brandArName,
    this.brandEnName,
    this.countryID,
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

  factory GetProductColorModel.fromJson(Map<String, dynamic> json) {
    return GetProductColorModel(
      totalResultCount: json['TotalResultCount'] as int?,
      resultRowNumber: json['ResultRowNumber'] as int?,
      sku: json['SKU'] as String?,
      modelNo: json['ModelNo'],
      productArName: json['ProductArName'],
      productEnName: json['ProductEnName'],
      categoryId: json['CategoryId'],
      categoryArName: json['CategoryArName'],
      categoryEnName: json['CategoryEnName'],
      subcategoryId: json['SubcategoryId'],
      subcategoryArName: json['SubcategoryArName'],
      subcategoryEnName: json['SubcategoryEnName'],
      leafcategoryId: json['LeafcategoryId'],
      leafcategoryArName: json['LeafcategoryArName'],
      leafcategoryEnName: json['LeafcategoryEnName'],
      seasonID: json['SeasonID'],
      seasonArName: json['SeasonArName'],
      seasonEnName: json['SeasonEnName'],
      fabricID: json['FabricID'],
      fabricArName: json['FabricArName'],
      fabricEnName: json['FabricEnName'],
      brandID: json['BrandID'],
      brandArName: json['BrandArName'],
      brandEnName: json['BrandEnName'],
      countryID: json['CountryID'],
      countryArName: json['CountryArName'],
      countryEnName: json['CountryEnName'],
      patternId: json['PatternId'] as int?,
      patternArName: json['PatternArName'],
      patternEnName: json['PatternEnName'],
      itemYear: json['ItemYear'],
      description: json['Description'],
      price: json['Price'],
      wholePrice: json['WholePrice'],
      specialPrice: json['SpecialPrice'],
      salePrice: json['SalePrice'],
      clearancePrice: json['ClearancePrice'],
      minPrice: json['MinPrice'],
      lastBuy: json['LastBuy'],
      localCost: json['LocalCost'],
      specModificationDate: json['SPECModificationDate'] as int?,
      itemImage: json['ItemImage'],
      isFavorite: json['IsFavorite'] as int?,
      details: json['Details'],
      imagesNo: json['ImagesNo'] as int?,
      variantProducts: (json['VariantProducts'] as List)
          .map((e) => VariantProduct.fromJson(e))
          .toList(),
      itemPhotos: json['itemPhotos'] as List,
      itemColors: json['Item_Colors'] as List,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['TotalResultCount'] = totalResultCount;
    data['ResultRowNumber'] = resultRowNumber;
    data['SKU'] = sku;
    data['ModelNo'] = modelNo;
    data['ProductArName'] = productArName;
    data['ProductEnName'] = productEnName;
    data['CategoryId'] = categoryId;
    data['CategoryArName'] = categoryArName;
    data['CategoryEnName'] = categoryEnName;
    data['SubcategoryId'] = subcategoryId;
    data['SubcategoryArName'] = subcategoryArName;
    data['SubcategoryEnName'] = subcategoryEnName;
    data['LeafcategoryId'] = leafcategoryId;
    data['LeafcategoryArName'] = leafcategoryArName;
    data['LeafcategoryEnName'] = leafcategoryEnName;
    data['SeasonID'] = seasonID;
    data['SeasonArName'] = seasonArName;
    data['SeasonEnName'] = seasonEnName;
    data['FabricID'] = fabricID;
    data['FabricArName'] = fabricArName;
    data['FabricEnName'] = fabricEnName;
    data['BrandID'] = brandID;
    data['BrandArName'] = brandArName;
    data['BrandEnName'] = brandEnName;
    data['CountryID'] = countryID;
    data['CountryArName'] = countryArName;
    data['CountryEnName'] = countryEnName;
    data['PatternId'] = patternId;
    data['PatternArName'] = patternArName;
    data['PatternEnName'] = patternEnName;
    data['ItemYear'] = itemYear;
    data['Description'] = description;
    data['Price'] = price;
    data['WholePrice'] = wholePrice;
    data['SpecialPrice'] = specialPrice;
    data['SalePrice'] = salePrice;
    data['ClearancePrice'] = clearancePrice;
    data['MinPrice'] = minPrice;
    data['LastBuy'] = lastBuy;
    data['LocalCost'] = localCost;
    data['SPECModificationDate'] = specModificationDate;
    data['ItemImage'] = itemImage;
    data['IsFavorite'] = isFavorite;
    data['Details'] = details;
    data['ImagesNo'] = imagesNo;
    data['VariantProducts'] =
        variantProducts.map((e) => e.toJson()).toList();
    data['itemPhotos'] = itemPhotos;
    data['Item_Colors'] = itemColors;
    return data;
  }
}

class VariantProduct {
  dynamic barCode;
  String? colorID;
  String? colorArName;
  String? colorEnName;
  String? colorOnlineName;
  String? sizeID;
  String? sizeName;
  int? stockQuantity;
  int? code;
  int? stkModificationDate;
  dynamic branchID;
  dynamic branchName;
  dynamic branchEName;
  List<dynamic> itemPhotos;

  VariantProduct({
    this.barCode,
    this.colorID,
    this.colorArName,
    this.colorEnName,
    this.colorOnlineName,
    this.sizeID,
    this.sizeName,
    this.stockQuantity,
    this.code,
    this.stkModificationDate,
    this.branchID,
    this.branchName,
    this.branchEName,
    required this.itemPhotos,
  });

  factory VariantProduct.fromJson(Map<String, dynamic> json) {
    return VariantProduct(
      barCode: json['BarCode'],
      colorID: json['ColorID'] as String?,
      colorArName: json['ColorArName'] as String?,
      colorEnName: json['ColorEnName'] as String?,
      colorOnlineName: json['ColorOnlineName'] as String?,
      sizeID: json['SizeID'] as String?,
      sizeName: json['SizeName'] as String?,
      stockQuantity: json['StockQuantity'] as int?,
      code: json['Code'] as int?,
      stkModificationDate: json['STKModificationDate'] as int?,
      branchID: json['BranchID'],
      branchName: json['BranchName'],
      branchEName: json['BranchEName'],
      itemPhotos: json['itemPhotos'] as List,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['BarCode'] = barCode;
    data['ColorID'] = colorID;
    data['ColorArName'] = colorArName;
    data['ColorEnName'] = colorEnName;
    data['ColorOnlineName'] = colorOnlineName;
    data['SizeID'] = sizeID;
    data['SizeName'] = sizeName;
    data['StockQuantity'] = stockQuantity;
    data['Code'] = code;
    data['STKModificationDate'] = stkModificationDate;
    data['BranchID'] = branchID;
    data['BranchName'] = branchName;
    data['BranchEName'] = branchEName;
    data['itemPhotos'] = itemPhotos;
    return data;
  }
}