import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:theonemaintenancetechnician/core/Font/font.dart';
import 'package:theonemaintenancetechnician/core/color/colors.dart';




class CardNumberInput extends StatefulWidget {
final  TextEditingController controller;
   const CardNumberInput({super.key, required this.controller});

  @override
  CardNumberInputState createState() => CardNumberInputState();
}

class CardNumberInputState extends State<CardNumberInput> {
  final _cardNumberFormatter = CardNumberFormatter();

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal:  10),
       decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(color: AppColors.greyd),
      ),
     
      child: TextField(
        
        controller: widget.controller,
        keyboardType: TextInputType.number,
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
            LengthLimitingTextInputFormatter(16),
          _cardNumberFormatter,
        ],
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'ادخل رقم البطاقة',
          hintStyle: TextStyle(
            fontFamily: Font.inter,
            fontSize: 14.sp,
            color: AppColors.grey2,
          ),
        ),
     
      ),
    );
  }
}

class CardNumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final digitsOnly = newValue.text.replaceAll(RegExp(r'\D'), '');
    final buffer = StringBuffer();

    for (int i = 0; i < digitsOnly.length; i++) {
      buffer.write(digitsOnly[i]);
      if ((i + 1) % 4 == 0 && i + 1 != digitsOnly.length) {
        buffer.write(' ');
      }
    }

    final newText = buffer.toString();
    return TextEditingValue(
      text: newText,
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }
}
