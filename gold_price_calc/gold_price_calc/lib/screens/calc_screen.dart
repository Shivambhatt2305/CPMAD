import 'package:flutter/material.dart';

class CalcScreen extends StatefulWidget {
  const CalcScreen({super.key});

  @override
  State<CalcScreen> createState() => _CalcScreenState();
}

class _CalcScreenState extends State<CalcScreen> {
  TextEditingController totalWeight = TextEditingController();
  TextEditingController carat = TextEditingController();
  TextEditingController gprice = TextEditingController();
  TextEditingController cprice = TextEditingController();
  TextEditingController lcharge = TextEditingController();

  double inPrice = 0;
  double lbcost = 0;
  double gtotal = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Calculator')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextFormField(
              controller: totalWeight,
              decoration: InputDecoration(
                hintText: "Total weight",
                labelText: "Total weight",
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 8),
            TextFormField(
              controller: carat,
              decoration: InputDecoration(
                hintText: "Carat",
                labelText: "Carat",
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 8),
            TextFormField(
              controller: gprice,
              decoration: InputDecoration(
                hintText: "Gold price per 10gm",
                labelText: "Gold price per 10gm",
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 8),
            TextFormField(
              controller: cprice,
              decoration: InputDecoration(
                hintText: "Copper price per 10gm",
                labelText: "Copper price per 10gm",
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 8),
            TextFormField(
              controller: lcharge,
              decoration: InputDecoration(
                hintText: "Labour charge(%)",
                labelText: "Labour charge(%)",
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                double twt = double.parse(totalWeight.text);
                double ct = double.parse(carat.text);
                double gp = double.parse(gprice.text);
                double cp = double.parse(cprice.text);
                double goldwt = (ct / 24) * twt;
                double cpwt = twt - goldwt;
                double goldprice = goldwt * (gp / 10);
                double copperprice = cpwt * (cp / 10);
                double inPrice = goldprice + copperprice;
                double lbcp = double.parse(lcharge.text);
                double lbcost = inPrice * lbcp * 0.01;
                if (lbcost < 500) {
                  lbcost = 500;
                }
                double gtotal = inPrice + lbcost;
                setState(() {});
              },
              child: Text('Calculate'),
            ),
            Text('Total:$inPrice'),
            Text('Labour charge:$lbcost'),
            Text('Grand total:$gtotal'),
          ],
        ),
      ),
    );
  }
}