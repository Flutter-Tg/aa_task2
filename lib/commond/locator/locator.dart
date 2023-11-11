import 'package:aa_task2/data_resource/remote.dart';
import 'package:aa_task2/data_resource/repository.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;
setup() async {
  locator.registerSingleton<Apiprovider>(Apiprovider());
  locator.registerSingleton<DataRepository>(DataRepository(locator()));
}
