import 'package:flutter/material.dart';
import 'package:riverpod/riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pachpach/services/riverPod/setProvider.dart';

class MonthTotalDataWidget extends ConsumerWidget {

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final asyncTotalData = watch(monthTotalProvider);
    return _monthTotalDataWidget(asyncTotalData);
  }

  @override
  Widget _monthTotalDataWidget(AsyncValue<int> asyncTotalData) {
    return asyncTotalData.when(
      data: (totalData) {
        return Text(
          '${totalData.toString()}円',
          style: TextStyle(
            fontSize: 20,
            color: Colors.black,
          ),
        );
      },
      loading: () {
        return CircularProgressIndicator();
      },
      error: (error, stack) {
        return Text('エラーが発生しました: $error');
      },
    );
  }
}
