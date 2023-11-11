import 'package:aa_task2/commond/resources/data_state.dart';
import 'package:aa_task2/data_resource/entity.dart';
import 'package:aa_task2/data_resource/remote.dart';
import 'package:dio/dio.dart';

class DataRepository {
  Apiprovider apiprovider;
  DataRepository(this.apiprovider);

  Future<DataState<List<DataEntity>>> getAllData(int page) async {
    try {
      Response response = await apiprovider.getData(page);

      if (response.statusCode == 200) {
        List<DataEntity> list = [];
        for (var data in response.data['products']) {
          list.add(DataEntity.fromJson(data));
        }
        return DataSuccess(list);
      } else {
        return DataFailed(response.statusMessage);
      }
    } catch (e) {
      return DataFailed(e.toString());
    }
  }
}
