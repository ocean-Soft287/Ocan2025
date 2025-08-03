import 'dart:convert';
import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:theonemaintenancetechnician/Feature/home/data/datasources/home_remote_datasource_abstraction.dart';
import 'package:theonemaintenancetechnician/Feature/home/data/models/add_employee_sales_invoice.dart';
import 'package:theonemaintenancetechnician/Feature/home/data/models/employee_model.dart';
import 'package:theonemaintenancetechnician/Feature/home/data/models/get_emp_inovice_model.dart';
import 'package:theonemaintenancetechnician/Feature/home/data/models/get_product_color_model.dart';
import 'package:theonemaintenancetechnician/Feature/home/data/models/search_product_by_sku._or_barCode.dart';
import 'package:theonemaintenancetechnician/Feature/home/data/models/search_result_model.dart';
import 'package:theonemaintenancetechnician/core/utils/api/api_consumer.dart';
import 'package:theonemaintenancetechnician/core/utils/api/dio_consumer.dart';
import 'package:theonemaintenancetechnician/core/utils/api/encryption.dart';
import 'package:theonemaintenancetechnician/core/utils/api/endPoint.dart';
import '../models/get_size_model.dart';

class HomeRemoteDatasourceImp extends HomeRemoteDataSource{
  ApiConsumer apiConsumer =   DioConsumer(dio: Dio());
  @override
  Future<Either<String, bool>> addEmployeeSalesInvoice({required AddEmployeeSalesInvoice model}) async{
    try {
      final encyptedData = encryptData(model.toJson(), privateKey, publicKey);
      final res = await apiConsumer.post(
        EndPoint.addEmployeeSalesInvoice,
        data:"'$encyptedData'"
      );
      log(model.toJson().toString());

      final decryptedText = decrypt(res, privateKey, publicKey);
      
      return Right(isRealInt(decryptedText));
    } on DioException catch (e) {
      return Left(e.message.toString());
    } catch (e) {
      return Left(e.toString());
    }
  
  }

bool isRealInt(String value) {
  return int.tryParse(value) != null;
}
  @override
  Future<Either<String, dynamic>> addSalesInvoiceWithoutTransfere({required AddEmployeeSalesInvoice model})async
   {
     try {
      final encyptedData = encryptData(model.toJson(), privateKey, publicKey);
         log("addTransfereInvoice----");
      log(model.toJson().toString());
      final res = await apiConsumer.post(
        EndPoint.addSalesInvoiceWithoutTransfere,
        data:  '"$encyptedData"'
      );
      final decryptedText = decrypt(res, privateKey, publicKey);
      return Right(decryptedText);
    } on DioException catch (e) {
      return Left(e.message.toString());
    } catch (e) {
      return Left(e.toString());
    }
  
  }

  @override
  Future<Either<String, dynamic>> addTransfereInvoice({required AddEmployeeSalesInvoice model}) async
    {
      
     try {
      final encyptedData = encryptData(model.toJson(), privateKey, publicKey);
      log("addTransfereInvoice----");
      log(model.toJson().toString());
      final res = await apiConsumer.post(
        EndPoint.addTransfereInvoice,
        data:  '"$encyptedData"'
      );
      final decryptedText = decrypt(res, privateKey, publicKey);
      return Right(decryptedText);
    } on DioException catch (e) {
      return Left(e.message.toString());
    } catch (e) {
      return Left(e.toString());
    }
  
  }


  @override
  Future<Either<String,  List<GetEmpInoviceModel>>> getEmployeeSalesInvoiceByEmployeeID({required String id})
  async {
      try{
      final res = await apiConsumer.get(
        EndPoint.getEmployeeSalesInvoiceByEmployeeID(id: id),

      );
      final decryptedText = decrypt(res, privateKey, publicKey);

      final List<dynamic>  json = jsonDecode(decryptedText) ;
     debugPrint("message===============================");
     debugPrint(json.toString());
     debugPrint("message===============================");
     final data = json.map((e) => GetEmpInoviceModel.fromJson(e)).toList();


      return Right(data);
}
   on DioException catch (e) {
      return Left(e.message.toString());
    } catch (e) {
      return Left(e.toString());
    }
 
  
  }
  

  @override
  Future<Either<String, List<SearchResultModel>>> search({required String keyword}) async{
   {
    try{  
      final res = await apiConsumer.get(
        EndPoint.search(searchKey: keyword),
      );
      final decryptedText = decrypt(res, privateKey, publicKey);
       final List<dynamic>  json = jsonDecode(decryptedText) ;
       if (json.isNotEmpty) {
     final data =   json.map((e) => SearchResultModel.fromJson(e)).toList();
      log(data.first.toString());
   
      return Right(data);
    
    } else {
      return Left('No data found');
    }
   
    } 
    on DioException catch (e) {
      return Left(e.message.toString());
    } catch (e) {
      return Left(e.toString());
    }
  
  }
  }
  
  @override
  Future<Either<String, List<Employee>>> getEmployees() async{
     try{  
      final res = await apiConsumer.get(
        EndPoint.getEmployees,
      );
      final decryptedText = decrypt(res, privateKey, publicKey);
  
       final List<dynamic>  json = jsonDecode(decryptedText) ;
      
       if (json.isNotEmpty) {
     final data =   json.map((e) => Employee.fromJson(e)).toList();
      log(data.first.toString());
   
      return Right(data);
    
    } else {
      return Left('No data found');
    }
   
    } 
    on DioException catch (e) {
      return Left(e.message.toString());
    } catch (e) {
      return Left(e.toString());
    }
  
  }
  
  @override
  Future<Either<String, List<GetEmpInoviceModel>>> getAllEmployeeSalesInvoice() async{
 try{
      final res = await apiConsumer.get(
        EndPoint.getAllEmployeeSalesInvoice,
      );
      final decryptedText = decrypt(res, privateKey, publicKey);
      final List<dynamic>  json = jsonDecode(decryptedText) ;
     final data = json.map((e) => GetEmpInoviceModel.fromJson(e)).toList();


      return Right(data);
}
   on DioException catch (e) {
      return Left(e.message.toString());
    } catch (e) {
      return Left(e.toString());
    }
 
  }

  @override
  Future<Either<String, List<GetProductColorModel>>> getProductColorsBySKU({required String keyword}) async{
    try{
      final res = await apiConsumer.get(
        EndPoint.getProductColorsBySKU(searchKey: keyword),
      );
      final decryptedText = decrypt(res, privateKey, publicKey);
      final List<dynamic>  json = jsonDecode(decryptedText) ;
     log(decryptedText.toString());
     final data = json.map((e) => GetProductColorModel.fromJson(e)).toList();
      return Right(data);
}
   on DioException catch (e) {
      return Left(e.message.toString());
    } catch (e) {
      return Left(e.toString());
    }

  }

  @override
  Future<Either<String, List<SearchProductBySkuORBarCode>>> sarchProductBySKU({required String keyword})
  async{
  try{
      final res = await apiConsumer.get(
        EndPoint.sarchProductBySKU(searchKey: keyword),
      );
      final decryptedText = decrypt(res, privateKey, publicKey);
      final List<dynamic>  json = jsonDecode(decryptedText) ;
     final data = json.map((e) => SearchProductBySkuORBarCode.fromJson(e)).toList();
      return Right(data);
}
   on DioException catch (e) {
      return Left(e.message.toString());
    } catch (e) {
      return Left(e.toString());
    }


  }  @override
  Future<Either<String, List<SearchProductBySkuORBarCode>>> searchProductByBarCode({required String keyword})
  async{
  try{
      final res = await apiConsumer.get(
        EndPoint.sarchProductByBarcode(searchKey: keyword),
      );
      final decryptedText = decrypt(res, privateKey, publicKey);
      final List<dynamic>  json = jsonDecode(decryptedText) ;
     final data = json.map((e) => SearchProductBySkuORBarCode.fromJson(e)).toList();
      return Right(data);
}
   on DioException catch (e) {
      return Left(e.message.toString());
    } catch (e) {
      return Left(e.toString());
    }


  }

  @override
  Future<Either<String, List<GetSizeModel>>> searchBySKUColor({required String searchKey,required String color}) async{
      try{
      final res = await apiConsumer.get(
        EndPoint.searchBySKUColor(searchKey: searchKey,color: color),
      );
      final decryptedText = decrypt(res, privateKey, publicKey);
      final List<dynamic>  json = jsonDecode(decryptedText) ;
      final data = json.map((e) => GetSizeModel.fromJson(e)).toList();
   
      return Right(data);
}
   on DioException catch (e) {
      return Left(e.message.toString());
    } catch (e) {
      return Left(e.toString());
    }

  }

  @override
  Future<Either<String, List<SearchResultModel>>> searchBySKUColorsize({required String searchKey,
    required String color,required String size})async {
  try{
      final res = await apiConsumer.get(
        EndPoint.searchBySKUColorsize(color: color, searchKey: searchKey, size: size,),
      );
      final decryptedText = decrypt(res, privateKey, publicKey);
      final List<dynamic>  json = jsonDecode(decryptedText) ;
     log('json.toString() ${json.toString()}' );
      final data = json.map((e) => SearchResultModel.fromJson(e)).toList();
      return Right(data);
}
   on DioException catch (e) {
      return Left(e.message.toString());
    } catch (e) {
      return Left(e.toString());
    }

  }


}