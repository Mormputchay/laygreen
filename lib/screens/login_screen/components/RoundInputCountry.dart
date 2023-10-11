import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RoundInputCountry extends StatelessWidget {
  TextEditingController txtPhone = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 65,
          width: 120,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(width: 1, color: Colors.black),
            borderRadius: BorderRadius.circular(8),
          ),
          child: const CountryCodePicker(
            onChanged: print,
            initialSelection: 'KH',
            favorite: ['+855', 'KH'],
            showCountryOnly: true,
            // optional. aligns the flag and the Text left
            alignLeft: false,
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
            child: TextFormField(
          controller: txtPhone,
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.digitsOnly
          ],
          keyboardType: TextInputType.phone,
          cursorColor: Colors.blue,
          decoration: InputDecoration(
              border: InputBorder.none,
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: Colors.black, width: 1)),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: Colors.black, width: 1)),
              labelText: "Phone Number",
              labelStyle: const TextStyle(color: Colors.black, fontSize: 18),
              hintStyle: const TextStyle(fontSize: 16, color: Colors.black)),
        )),
      ],
    );
  }
}
