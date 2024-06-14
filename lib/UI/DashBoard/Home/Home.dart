import 'package:flutter/material.dart';
import '../../../Constants/sizeConfig.dart';
import '../../../Models/Widgets/TCS.dart';
import 'Recent/Activities/RecentActivities.dart';
import 'Recent/recentDeposit.dart';
import 'Recent/recentWithdraw.dart';
import 'card.dart';
import 'incomeVsExpense/incomeVsExpense.dart';

///Primary Home Page
class HomePage extends StatelessWidget {
  ///Constructor
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            cardsRow(),
            const RecentActivities(),
            recentBar(),
            const IncomeVsExpense(),
          ].map((Widget e) {
            return Column(children: <Widget>[e, SizeConfig.verticalSpaceLarge()]);
          }).toList(),
        ),
      ),
    );
  }

  /// top card row
  Widget cardsRow() {
    return Row(children: cts.map(card).toList());
  }

  ///Used inside cardRow
  Widget card(TCS tcs) {
    return Expanded(
      child: DashBoardCard(
        tcs: tcs,
      ),
    );
  }

  /// recentBar show recent deposit and withdrawal
  Widget recentBar() {
    return Row(
      children: <Widget>[
        const Expanded(child: RecentDeposits()),
        SizeConfig.verticalSpaceSmall(),
        const Expanded(child: RecentWithdraw()),
      ],
    );
  }

  ///The list of data types to be shown in dashboard
  static List<TCS> cts = <TCS>[
    TCS(title: 'Total Customer', count: '1', subtitle: 'Total customers today', color: Colors.red),
    TCS(title: 'Total Supplier', count: '2', subtitle: 'Total supplier today', color: Colors.green),
    TCS(title: 'Total Products', count: '3', subtitle: 'Total products today', color: Colors.blue),
    TCS(title: 'Total Orders', count: '4', subtitle: 'Total orders today', color: Colors.amber),
  ];
}
