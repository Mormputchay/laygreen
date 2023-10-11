import 'package:flutter/material.dart';
import 'package:laygreen/common_widget/RoundButton1.dart';
import 'package:pinput/pinput.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});
  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final defaultPinTheme = PinTheme(
    width: 65,
    height: 65,
    textStyle: const TextStyle(
        fontSize: 20, color: Colors.black, fontWeight: FontWeight.w600),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
    ),
  );
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        extendBodyBehindAppBar: true,
        extendBody: true,
        body: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              "asset/images/bg.png",
              width: media.width,
              fit: BoxFit.cover,
            ),
            SafeArea(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: media.width * 0.075),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Enter Code",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold),
                            ),
                            RoundButton1(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                color: Colors.black,
                                child: const Icon(
                                  Icons.arrow_back,
                                  color: Colors.white,
                                ))
                          ],
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          "Enter the code ,we send to your\nphone please check and fill it.",
                          style: TextStyle(color: Colors.black, fontSize: 15),
                        ),
                        const SizedBox(height: 15),
                        const Text(
                          "+855 92528378",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 20),
                        Container(
                          child: Pinput(
                            length: 6,
                            defaultPinTheme: defaultPinTheme,
                            focusedPinTheme: defaultPinTheme.copyWith(
                                decoration: defaultPinTheme.decoration!
                                    .copyWith(
                                        border:
                                            Border.all(color: Colors.green))),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 25),
                    Column(
                      children: [
                        const Text(
                          "56s",
                          style: TextStyle(fontSize: 16, color: Colors.black),
                        ),
                        const SizedBox(height: 15),
                        MaterialButton(
                          minWidth: 130,
                          height: 55,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          onPressed: () {},
                          color: Colors.green.shade900,
                          child: const Text(
                            'Verify',
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "By Entering SMS code I agree with",
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "the",
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                      const SizedBox(width: 5),
                      Text(
                        "terms and conditions",
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.green.shade900,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
