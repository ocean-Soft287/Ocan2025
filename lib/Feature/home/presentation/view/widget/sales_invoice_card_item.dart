import 'package:flutter/material.dart';
import 'package:theonemaintenancetechnician/Feature/home/data/models/get_emp_inovice_model.dart';

Widget buildSalesInvoiceCard(BuildContext context, GetEmpInoviceModel invoice,bool isreturn) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Invoice Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Invoice #${invoice.invoiceNo}',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  invoice.isPosted ? 'Posted' : 'Not Posted',
                  style: TextStyle(
                    color: invoice.isPosted ? Colors.green : Colors.red,
                    fontWeight: FontWeight.w500,
                  ),
                ),
            //   ElevatedButton(onPressed: (){
            //  isreturn ? context.read<HomeCubit>().addSalesInvoiceWithoutTransfereLoading(model: invoice):   context.read<HomeCubit>().addTransfereInvoice(model: invoice);
            //   }, child: Text('انشاء فاتورة'))
            
              ],
            ),
            const SizedBox(height: 8),
            Text(
              'Date: ${invoice.invoiceDate.toString().split(' ')[0]} ${invoice.invoiceTime.toString().split(' ')[1].substring(0, 8)}',
              style: const TextStyle(color: Colors.grey),
            ),
            const Divider(height: 16),

            // Customer Information
            const Text(
              'Customer Details',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 4),
            Text('Name: ${invoice.customerName ?? 'N/A'}'),
            Text('ID: ${invoice.customerID ?? 'N/A'}'),
            Text('Phone: ${invoice.customerPhone ?? 'N/A'}'),
            Text('POS Customer ID: ${invoice.pointOfSaleCustID ?? 'N/A'}'),
            Text('First Name: ${invoice.firstName ?? 'N/A'}'),
            Text('Last Name: ${invoice.lastName ?? 'N/A'}'),
            Text('Email: ${invoice.email ?? 'N/A'}'),
            Text('Passport ID: ${invoice.passportID ?? 'N/A'}'),
            const SizedBox(height: 8),

            // Address Information
            if (invoice.orderAddress != null ||
                invoice.countryName != null ||
                invoice.regionName != null ||
                invoice.districtName != null ||
                invoice.street != null ||
                invoice.block != null ||
                invoice.house != null ||
                invoice.gada != null ||
                invoice.floor != null ||
                invoice.apartment != null) ...[
              const Text(
                'Address Details',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 4),
              Text('Address: ${invoice.orderAddress ?? ''}'),
              Text('Country: ${invoice.countryName ?? ''}'),
              Text('Region: ${invoice.regionName ?? ''}'),
              Text('District: ${invoice.districtName ?? ''}'),
              Text('Street: ${invoice.street ?? ''}'),
              Text('Block: ${invoice.block ?? ''}'),
              Text('House: ${invoice.house ?? ''}'),
              Text('Gada: ${invoice.gada ?? ''}'),
              Text('Floor: ${invoice.floor ?? ''}'),
              Text('Apartment: ${invoice.apartment ?? ''}'),
              Text('Extra Directions: ${invoice.extraDirections ?? ''}'),
              Text('ZIP Code: ${invoice.zipCode ?? ''}'),
              const SizedBox(height: 8),
            ],

            // Financial Information
            const Text(
              'Financial Details',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 4),
            Text('Total Value: ${invoice.totalVal} ${invoice.currencyEnName}'),
            Text('Total Quantity: ${invoice.totalQty}'),
            Text('Final Value: ${invoice.finalValue} ${invoice.currencyEnName}'),
            Text('Profits: ${invoice.profits} ${invoice.currencyEnName}'),
            Text('Discount: ${invoice.totalDiscount} ${invoice.currencyEnName}'),
            Text('Extra: ${invoice.totalExtra} ${invoice.currencyEnName}'),
            Text('First Pay: ${invoice.firstPay ?? 'N/A'} ${invoice.currencyEnName}'),
            Text('Return Cash: ${invoice.returnCash} ${invoice.currencyEnName}'),
            Text('Tax: ${invoice.tax ?? 'N/A'} ${invoice.currencyEnName}'),
            Text('Currency: ${invoice.currencyEnName} (Rate: ${invoice.currencyRate})'),
            const SizedBox(height: 8),

            // Branch and Employee Information
            const Text(
              'Branch & Employee',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 4),
            Text('Branch: ${invoice.branchEnName} (${invoice.branchArName})'),
            Text('Branch ID: ${invoice.branchID}'),
            Text('Employee: ${invoice.employeeEnName} (${invoice.employeeArName})'),
            Text('Employee ID: ${invoice.employeeID}'),
            Text('Cost Center ID: ${invoice.costCenterID}'),
            const SizedBox(height: 8),

            // Additional Information
            const Text(
              'Additional Details',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 4),
            Text('Notes: ${invoice.notes}'),
            Text('Invoice Type ID: ${invoice.invoiceTypeId}'),
            Text('Pay Type: ${invoice.payType}'),
            Text('Shift No: ${invoice.shiftNo ?? 'N/A'}'),
            Text('Reservation No: ${invoice.reservationNO ?? 'N/A'}'),
            Text('Received Receipt ID: ${invoice.receivedReciptID ?? 'N/A'}'),
            Text('Received Receipt Value: ${invoice.receivedReciptValue ?? 'N/A'} ${invoice.currencyEnName}'),
            Text('Customer Order ID: ${invoice.customerOrderID ?? 'N/A'}'),
            Text('Items Account: ${invoice.itemsAccount ?? 'N/A'}'),
            Text('Customer Point: ${invoice.isCustomerPoint != null ? (invoice.isCustomerPoint! ? 'Yes' : 'No') : 'N/A'}'),
            Text('Form Number: ${invoice.frmNum ?? 'N/A'}'),
            Text('Items Count: ${invoice.salesInvoiceItems.length}'),
            ExpansionTile(
             title: Text('Invoice Items (${invoice.salesInvoiceItems.length})'),
                  children: invoice.salesInvoiceItems.map((item) {
             return ListTile( 
               title: Text('SKU: ${item.sku}'),
               subtitle: Text('Price: ${item.price} | Qty: ${item.quantity}'),
    );
  }).toList(),
),
          ],
        ),
      ),
    ),
  );
}