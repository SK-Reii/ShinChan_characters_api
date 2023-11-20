import 'package:digimon_2324/shinchan_card.dart';
import 'package:flutter/material.dart';
import 'shinchan_model.dart';

class ShinChanList extends StatelessWidget {
  final List<ShinChanChar> shinChan;
  const ShinChanList(this.shinChan, {super.key});

  @override
  Widget build(BuildContext context) {
    return _buildList(context);
  }

  ListView _buildList(context) {
    return ListView.builder(
      itemCount: shinChan.length,
      // ignore: avoid_types_as_parameter_names
      itemBuilder: (context, int) {
        return ShinChanCard(shinChan[int]);
      },
    );
  }
}
