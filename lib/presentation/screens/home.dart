import 'package:aa_task2/commond/resources/data_state.dart';
import 'package:aa_task2/commond/widgets/primary_button_widget.dart';
import 'package:aa_task2/presentation/provider/get_data.dart';
import 'package:aa_task2/presentation/widgets/data_box.dart';
import 'package:aa_task2/presentation/widgets/list_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  int page = 2;

  @override
  Widget build(BuildContext context) {
    final data = ref.watch(lodaDataProvider);
    return Material(
      child: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (data.isLoading)
            const SizedBox(
              width: 29,
              height: 29,
              child: CircularProgressIndicator(),
            )
          else if (data.hasValue && data.value! is DataSuccess)
            Expanded(
              child: Consumer(builder: (context, ref, child) {
                final dataNotifer = ref.watch(dataNotiferProvider);
                final dataList = dataNotifer.datas;
                return ListView.builder(
                  itemCount: dataList.length + 1,
                  itemBuilder: (context, index) {
                    if (index == dataList.length) {
                      return ListLoader(
                        page: page,
                        onSuccess: () {
                          page++;
                        },
                      );
                    } else {
                      return DataBox(data: dataList[index]);
                    }
                  },
                );
              }),
            )
          else
            Padding(
              padding: const EdgeInsets.all(20),
              child: PrimaryButtonWidget(
                text: 'مشکلی پیش امده، دوباره تلاش کنید',
                async: true,
                function: () async =>
                    await ref.refresh(lodaDataProvider.future),
              ),
            ),
        ],
      )),
    );
  }
}
