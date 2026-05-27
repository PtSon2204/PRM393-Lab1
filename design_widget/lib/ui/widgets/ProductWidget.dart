import 'package:flutter/material.dart';

class Productwidget extends StatelessWidget {
  const Productwidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      width: double.infinity,
      height: 550,
      // decoration: BoxDecoration(
      //   border: Border.all(width: 3, color: Colors.red),
      // ),
      child: Column(
        children: [
          //ảnh sản phẩm
          Expanded(
            flex: 7,
            child: Container(
              height: 300,
              width: double.infinity,
              child: Stack(
                children: [
                  Image.asset("assets/images/cx5.png", fit: BoxFit.fill),
                  FloatingActionButton.extended(
                    onPressed: () {},
                    label: Text("Add to cart  "),
                    icon: Icon(Icons.add),
                  ),
                ],
              ),
            ),
          ),

          SizedBox(height: 15),
          //tên sản phẩm
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,

              children: [
                Expanded(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Product Name: Tea cup"),
                      Text("Price: 3000\$"),
                    ],
                  ),
                ),

                Expanded(
                  flex: 1,
                  child: Row(children: [Icon(Icons.star), Text("41")]),
                ),
              ],
            ),
          ),

          SizedBox(height: 15),
          //Mô tả sản phẩm
          Expanded(
            flex: 2,
            child: Text(
              "(Dân trí) - Sáng 25/5, học sinh Hà Tĩnh vừa hoàn thành bài thi môn toán trong kỳ thi tuyển sinh vào lớp 10 THPT năm học 2026-2027. Dưới đây là đề thi và đáp án gợi ý. Tại 39 hội đồng thi, hơn 21.000 thí sinh Hà Tĩnh bước vào ngày thi đầu tiên kỳ thi tuyển sinh vào lớp 10 THPT năm học 2026-2027. Trong số này, có hơn 19.700 em đăng ký nguyện vọng thi vào các trường THPT không chuyên, gần 1.500 em thi vào Trường THPT chuyên Hà Tĩnh.",
              textAlign: TextAlign.justify,
            ),
          ),
        ],
      ),
    );
  }
}
