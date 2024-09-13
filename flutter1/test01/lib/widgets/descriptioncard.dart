import 'package:flutter/material.dart';

class DescriptionCard extends StatelessWidget {
  const DescriptionCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
      child: Text(
        "iasjfoiajsdoifasoidfjoasifjoiasjfdoiaoiasdjfoiajfoiajsofiaosdijfaoifjdoaijdfoiajdfoijasofijasoifjoasidfjsoiajodfia",
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
