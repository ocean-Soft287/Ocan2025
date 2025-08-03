import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:theonemaintenancetechnician/Feature/home/presentation/cubit/home_cubit.dart';
import '../../../data/models/add_employee_sales_invoice.dart';

Widget buildSalesInvoiceItemCard(BuildContext context, SalesInvoiceItem item,void Function() onremove) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
    child: Card(
      elevation: 6,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Row(
              children:  [
                Icon(Icons.receipt_long_rounded, color: Colors.blueAccent),
                SizedBox(width: 8),
                Text(
                  'Sales Invoice Item',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Spacer(),
                IconButton(onPressed: onremove, icon: Icon(Icons.delete,color: Colors.red,size: 32,)),

              ],
            ),
            const Divider(height: 24),

            // Product Info
            sectionHeader('Product Info'),
            infoRow(Icons.qr_code, 'Bar Code', item.barCode),
            infoRow(Icons.widgets_outlined, 'SKU', item.sku),
            infoRow(Icons.inventory_2, 'Item ID', item.itemID?.toString()),
            infoRow(Icons.layers_outlined, 'Quantity', item.quantity?.toString()),
            infoRow(Icons.card_giftcard_outlined, 'Gift Quantity', item.giftQuantity?.toString()),

            const SizedBox(height: 12),

            // Pricing Info
            sectionHeader('Pricing'),
            infoRow(Icons.attach_money, 'Price', ( item.price! ).toStringAsFixed(2),    ), //  item.price?.toStringAsFixed(2)),
            infoRow(Icons.money_off, 'Discount', item.discountVal?.toStringAsFixed(2)),
            infoRow(Icons.price_check, 'Final Price',( item.price! * item.quantity!).toStringAsFixed(2)),
            infoRow(Icons.trending_up, 'Profits', item.profits?.toStringAsFixed(2)),
            infoRow(Icons.paid_outlined, 'Cost', item.cost?.toStringAsFixed(2)),
            infoRow(Icons.account_balance_wallet_outlined, 'Current Price', item.currentPrice?.toStringAsFixed(2)),

            const SizedBox(height: 12),

            // Currency Info
            sectionHeader('Currency Info'),
            infoRow(Icons.attach_money_rounded, 'Currency ID', item.currencyID?.toString()),
            infoRow(Icons.swap_horiz, 'Currency Rate', item.currencyRate?.toString()),

            const SizedBox(height: 12),

            // // Metadata
            // sectionHeader('Metadata'),
            // infoRow(Icons.person_outline, 'Employee ID', item.employeeID?.toString()),
            // infoRow(Icons.storefront_outlined, 'Branch ID', item.branchID),
            // infoRow(Icons.note_alt_outlined, 'Notes', item.notes?.toString()),
            // infoRow(Icons.info_outline, 'Price Type', item.priceType?.toString()),
            // infoRow(Icons.backup_table_rounded, 'Is Output', item.isOutput?.toString()),
            // infoRow(Icons.restore_page_rounded, 'Return Qty', item.retrenQuantity?.toString()),

            // const SizedBox(height: 12),

            // // Invoice Linking
            // sectionHeader('Invoice References'),
            // infoRow(Icons.description_outlined, 'Sales Invoice No', item.salesInvoiceNo?.toString()),
            // infoRow(Icons.description, 'Sales Invoice ID', item.salesInvoiceID?.toString()),
            // infoRow(Icons.history, 'Old Invoice No', item.salesOldInvoiceNo?.toString()),
            // infoRow(Icons.history_toggle_off, 'Old Invoice ID', item.salesOldInvoiceID?.toString()),
            // infoRow(Icons.repeat, 'Old Invoice Qty', item.salesOldInvoiceQty?.toString()),
         
          ],
        ),
      ),
    ),
  );
}

Widget infoRow(IconData icon, String title, String? value) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 4),
    child: Row(
      children: [
        Icon(icon, size: 18, color: Colors.grey[600]),
        const SizedBox(width: 8),
        Expanded(
          flex: 4,
          child: Text(
            "$title:",
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
        ),
        Expanded(
          flex: 6,
          child: Text(
            value ?? 'N/A',
            style: const TextStyle(color: Colors.black87),
          ),
        ),
      ],
    ),
  );
}

Widget sectionHeader(String text) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 6),
    child: Text(
      text,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w700,
        color: Colors.blueAccent,
      ),
    ),
  );
}

