import 'package:flutter/cupertino.dart';
import 'package:pim/time_utils.dart';
import 'package:provider/provider.dart';

import 'decorated_container.dart';
import 'models/drug_list.dart';
import 'models/times_of_day.dart';

class DrugTimeOfDayContainer extends StatelessWidget {
  const DrugTimeOfDayContainer({super.key, required this.drugTimeOfDay});

  final DrugTimeOfDay drugTimeOfDay;

  @override
  Widget build(BuildContext context) => Consumer<DrugList>(
      builder: (context, drugList, child) => Consumer<TimesOfDay>(
          builder: (context, timesOfDay, child) => DecoratedContainer(
                isColoured: timesOfDay.getNextDrugTimeOfDay() == drugTimeOfDay,
                timeOfDay: timesOfDay.getTimeOfDay(drugTimeOfDay),
                drugs: drugList.drugsForTimeOfDay(drugTimeOfDay),
              )));
}
