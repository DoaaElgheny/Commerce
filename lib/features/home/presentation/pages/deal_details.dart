import 'package:flutter/material.dart';
import 'package:qubeCommerce/features/home/presentation/pages/join_deal.dart';

class DealDetailsScreen extends StatefulWidget {
  const DealDetailsScreen({super.key});

  @override
  State<DealDetailsScreen> createState() => _DealDetailsScreenState();
}

class _DealDetailsScreenState extends State<DealDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
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
                                          'assets/images/png/bookmark.png',
                                          width: 25,
                                          height: 25,
                                          color: const Color(0XFF000080),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 15,
                                    ),
                                    Container(
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
                                          'assets/images/png/share.png',
                                          width: 25,
                                          height: 25,
                                          color: const Color(0XFF000080),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Container(
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
                                          'assets/images/png/bell.png',
                                          width: 25,
                                          height: 25,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 15,
                                    ),
                                    Container(
                                      width: 45,
                                      height: 45,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: const Color(0XFF000080),
                                        ),
                                      ),
                                      child: InkWell(
                                        onTap:(){
                                          Navigator.pop(context);
                                        },
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
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Container(
                        height: 400,
                        color: Colors.blueGrey[200],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      SizedBox(
                        //height: 106,
                        width: MediaQuery.of(context).size.width,
                        child: Card(
                          semanticContainer: true,
                          //color: Colors.amber,
                          child: Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Row(
                                      children: [
                                        const Text(
                                          '5', // Dynamic count
                                          style: TextStyle(
                                            fontSize: 20,
                                            color: Color(0XFF06A6F1),
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        const SizedBox(width: 5),
                                        const Text(
                                          ':عدد المشتركين',
                                          style: TextStyle(
                                            fontSize: 20,
                                            color: Color(0XFF06A6F1),
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                        const SizedBox(width: 5),
                                        Image.asset(
                                          "assets/images/png/people.png",
                                          height: 16,
                                          fit: BoxFit.cover,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 8),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    const Text(
                                      ':مدى ربحية الصفقة',
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.green,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Transform(
                                      alignment: Alignment.center,
                                      transform: Matrix4.identity()
                                        ..scale(
                                            -1.0, 1.0), // Flips horizontally
                                      child: LinearProgressIndicator(
                                        borderRadius: BorderRadius.circular(10),
                                        value: 0.9,
                                        backgroundColor: Colors.grey[300],
                                        valueColor:
                                            const AlwaysStoppedAnimation<Color>(
                                                Colors.green),
                                        minHeight: 13,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const Text(
                            'تاريخ الصفقات السابقة',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Image.asset(
                            "assets/images/png/Time1.png",
                            height: 23,
                            fit: BoxFit.cover,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Column(
                        children: [
                          Card(
                            elevation: 1,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(16),
                              child: Column(
                                // mainAxisAlignment: MainAxisAlignment.spaceAround,
                                // crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  _buildRow(
                                    'assets/images/png/Calendar.png',
                                    "تاريخ الحملة",
                                    "2024-10-5",
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  _buildRow(
                                    'assets/images/png/Time2.png',
                                    "مدة الحملة",
                                    "14 يوم",
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  _buildRow(
                                    'assets/images/png/tick.png',
                                    "الطلبات الناجحة",
                                    "1653",
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  _buildRow(
                                    'assets/images/png/XML.png',
                                    "متوسط الأرباح",
                                    "14%",
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Column(
                        children: [
                          Card(
                            elevation: 1,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 30, right: 16, top: 16, bottom: 16),
                              child: Column(
                                // mainAxisAlignment: MainAxisAlignment.spaceAround,
                                // crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  _buildRow(
                                    'assets/images/png/Calendar.png',
                                    "تاريخ الحملة",
                                    "2024-9-21",
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  _buildRow(
                                    'assets/images/png/Time2.png',
                                    "مدة الحملة",
                                    "14 يوم",
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  _buildRow(
                                    'assets/images/png/tick.png',
                                    "الطلبات الناجحة",
                                    "2350",
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  _buildRow(
                                    'assets/images/png/XML.png',
                                    "متوسط الأرباح",
                                    "24%",
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25)),
                  //color: Colors.amber,
                  border: Border(
                    top: BorderSide(
                      color: Colors.green,
                      width: 2,
                    ),
                  ),
                ),
                padding: const EdgeInsets.only(top: 16),
                //height: 100,
                width: MediaQuery.of(context).size.width,
                //color: Colors.amber,
                child: Column(
                  children: [
                    const Text(
                      ":تنطلق في",
                      style: TextStyle(
                        fontSize: 18,
                        color: Color(
                          0xFFE61F00,
                        ),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _TimerContainer("4", "ساعة"),
                        const SizedBox(
                          width: 15,
                        ),
                        // Text(
                        //   ":",
                        //   style: TextStyle(
                        //     fontSize: 50,
                        //     color: Colors.red,
                        //     fontWeight: FontWeight.bold,
                        //   ),
                        // ),
                        const Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CircleAvatar(
                              backgroundColor: Color(0xFFB71C1C),
                              radius: 4.5,
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            CircleAvatar(
                              backgroundColor: Color(0xFFB71C1C),
                              radius: 4.5,
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        _TimerContainer("31", "دقيقة"),
                        const SizedBox(
                          width: 15,
                        ),
                        const Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CircleAvatar(
                              backgroundColor: Color(0xFFB71C1C),
                              radius: 4.5,
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            CircleAvatar(
                              backgroundColor: Color(0xFFB71C1C),
                              radius: 4.5,
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        _TimerContainer("44", "ثانية"),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const JoinDealScreen()),
                          ),
                          child: Container(
                            height: 56,
                            width: 198,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              gradient: const LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  colors: <Color>[
                                    Color(0xFFA6BE52),
                                    Color(0xFF24774C)
                                  ]),
                            ),
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const JoinDealScreen()),
                                );
                              },
                              child: const Center(
                                child: Text(
                                  "!إنضم إلى الصفقة",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              ":الحد الأدنى للإنضمام",
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
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
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 15,
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

Widget _TimerContainer(String timeNum, String timeWord) {
  return Container(
    height: 72,
    width: 72,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      // color: Colors.red,
      gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: <Color>[Color(0xFF5B0000), Color(0xFFE61F00)]),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          timeNum,
          style: const TextStyle(
            fontSize: 23,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          timeWord,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    ),
  );
}

Widget _buildRow(String assetPath, String value, String label) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      //SizedBox(),
      Text(
        label,
        style: const TextStyle(
          fontSize: 16,
          color: Colors.black,
          fontWeight: FontWeight.w600,
        ),
      ),
      const SizedBox(
        width: 100,
      ),
      Row(
        children: [
          Text(
            value,
            style: const TextStyle(
              fontSize: 18,
              color: Colors.black,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(width: 12),
          Image.asset(assetPath, height: 23, fit: BoxFit.cover),
        ],
      ),
    ],
  );
}
