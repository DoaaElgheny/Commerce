import 'package:flutter/material.dart';

class JoinDealScreen extends StatefulWidget {
  const JoinDealScreen({super.key});

  @override
  State<JoinDealScreen> createState() => _JoinDealScreenState();
}

class _JoinDealScreenState extends State<JoinDealScreen> {
  bool _isChecked = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Container(
                alignment: Alignment.topRight,
                child: InkWell(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    width: 45,
                    height: 45,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: const Color(0XFF000080),
                      ),
                    ),
                    child: Center(
                      child: Image.asset(
                        'assets/images/png/chevron-down.png',
                        width: 25,
                        height: 25,
                        color: const Color(0XFF000080),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Card(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(),
                    const Column(
                      // mainAxisAlignment: MainAxisAlignment.end,
                      // crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text("كرسي كمبيوتر شبكي",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                )),
                            SizedBox(
                              height: 5,
                            ),
                            Text("#165785",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                )),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(":الحد الأدنى للإنضمام#",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                )),
                            Row(
                              children: [
                                Text(
                                  "ج.م",
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Color(0xFF38A169),
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Text(
                                  "1000",
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Color(0xFF38A169),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                    Container(
                        height: 136,
                        width: 135,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8)),
                        child: Image.asset("assets/images/png/Desk.png")),
                  ],
                ),
              ),
              const SizedBox(
                height: 18,
              ),
              //
              //
              Container(
                height: 104,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: const DecorationImage(
                    image: AssetImage(
                        'assets/images/png/ConImage.png'), // Add your image to the assets folder
                    fit: BoxFit.cover,
                  ),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // ElevatedButton(
                    //   style: ElevatedButton.styleFrom(
                    //     backgroundColor: Colors.white,
                    //     shape: RoundedRectangleBorder(
                    //       borderRadius: BorderRadius.circular(12),
                    //     ),
                    //   ),
                    //   onPressed: () {
                    //     // Add your logic for the button here
                    //   },
                    Container(
                      height: 40,
                      width: 68,
                      decoration: BoxDecoration(
                          border: Border.all(color: const Color(0xFF000080)),
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.white),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'شحن',
                            style: TextStyle(
                                color: Color(0xFF000080),
                                fontSize: 16,
                                fontWeight: FontWeight.w400),
                          ),
                          Icon(
                            Icons.add,
                            color: Color(0xFF000080),
                            size: 20,
                          )
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              'رصيدي',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(
                              'ج.م‎ 20.000',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        Image.asset("assets/images/png/Wallet.png",
                            height: 23, fit: BoxFit.cover),
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Text(
                        "قيمة الصفقة",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      SizedBox(
                        height: 48,
                        child: TextField(
                          textAlign: TextAlign.end,
                          maxLines: 1,
                          decoration: InputDecoration(
                            hintText: "مثال: 5000",
                            suffixIcon: const Image(
                              image: AssetImage("assets/images/png/money.png"),
                            ),
                            border: const OutlineInputBorder(),
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: Color(0xFF000080)),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: Color(0xFF000080)),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text(
                        "يجب أن يكون المبلغ المدخل أكبر من أو يساوي 1000 ج.م للإنضمام",
                        style: TextStyle(
                          color: Color(0xFFE53E3E),
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const Text(
                            'إضافة كود خصم',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Container(
                            height: 18,
                            width: 18,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                //color: Colors.amber,
                                border: Border.all(
                                    color: const Color(0xFF000080),
                                    width: 1.5)),
                            child: Checkbox(
                              value: _isChecked,
                              onChanged: (value) {
                                setState(() {
                                  _isChecked = value!;
                                });
                              },
                            ),
                          )
                        ],
                      ),
                      if (_isChecked)
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            const SizedBox(height: 15),
                            const Text(
                              "كود الخصم",
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700),
                            ),
                            const SizedBox(height: 8),
                            SizedBox(
                              height: 48,
                              child: TextField(
                                textAlign: TextAlign.end,
                                textAlignVertical: TextAlignVertical.center,
                                maxLines: 1,
                                decoration: InputDecoration(
                                  suffixIcon: const Image(
                                    image: AssetImage(
                                        "assets/images/png/discount.png"),
                                  ),
                                  border: const OutlineInputBorder(),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Color(0xFF000080)),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Color(0xFF000080)),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                height: 48,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  image: const DecorationImage(
                    image: AssetImage(
                        'assets/images/png/ConImage2.png'), // Add your image to the assets folder
                    fit: BoxFit.cover,
                  ),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        alignment: Alignment.centerLeft,
                        height: 50,
                        width: 50,
                        child: Image.asset("assets/images/png/Cancel.png")),
                    Row(
                      children: [
                        const Text(
                          "ملخص الإستثمار",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        Image.asset("assets/images/png/Summary.png",
                            height: 23, fit: BoxFit.cover),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(),
                  SizedBox(),
                  Row(
                    children: [
                      Text(
                        "ج.م",
                        style: TextStyle(
                          color: Color(0xFF718096),
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(
                        width: 3,
                      ),
                      Text(
                        "2000",
                        style: TextStyle(
                          color: Color(0xFF718096),
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(),
                  SizedBox(),
                  Text(
                    "       :قيمة الإنضمام",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(),
                  SizedBox(),
                  Row(
                    children: [
                      Text(
                        "ج.م",
                        style: TextStyle(
                          color: Color(0xFF718096),
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(
                        width: 3,
                      ),
                      Text(
                        "200",
                        style: TextStyle(
                          color: Color(0xFF718096),
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(),
                  SizedBox(),
                  Text(
                    "%رسوم الخدمة 10",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(),
                  SizedBox(),
                  Row(
                    children: [
                      Text(
                        "ج.م",
                        style: TextStyle(
                          color: Color(0xFF718096),
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(
                        width: 3,
                      ),
                      Text(
                        "200",
                        style: TextStyle(
                          color: Color(0xFF718096),
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(),
                  SizedBox(),
                  Text(
                    "                  الخصم",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 48,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: const DecorationImage(
                    image: AssetImage(
                        'assets/images/png/ConImage3.png'), // Add your image to the assets folder
                    fit: BoxFit.cover,
                  ),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(),
                    Row(
                      children: [
                        Text(
                          "ج.م",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(
                          width: 3,
                        ),
                        Text(
                          "2100",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(),
                    SizedBox(),
                    Text(
                      "الإجمالي",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                height: 56,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  gradient: const LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: <Color>[Color(0xFFA6BE52), Color(0xFF24774C)]),
                ),
                child: const Center(
                  child: Text(
                    "! إنضم الآن",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
