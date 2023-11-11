import 'package:aa_task2/commond/locator/locator.dart';
import 'package:aa_task2/commond/resources/data_state.dart';
import 'package:aa_task2/data_resource/entity.dart';
import 'package:aa_task2/data_resource/repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dataNotiferProvider =
    ChangeNotifierProvider<DataNotifer>((ref) => DataNotifer());

final lodaDataProvider =
    FutureProvider<DataState<List<DataEntity>>>((ref) async {
  return ref.read(dataNotiferProvider).getData(1);
});

class DataNotifer extends ChangeNotifier {
  List<DataEntity> datas = [];

  Future<DataState<List<DataEntity>>> getData(int page) async {
    await Future.delayed(const Duration(seconds: 2));
    final result = await locator<DataRepository>().getAllData(page);
    if (result is DataSuccess) {
      datas.addAll(result.data!);
      notifyListeners();
    }
    return result;
  }
}
