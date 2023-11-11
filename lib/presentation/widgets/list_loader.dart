import 'package:aa_task2/commond/resources/data_state.dart';
import 'package:aa_task2/commond/widgets/primary_button_widget.dart';
import 'package:aa_task2/presentation/provider/get_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ListLoader extends ConsumerStatefulWidget {
  const ListLoader({super.key, required this.page, required this.onSuccess});
  final int page;
  final Function() onSuccess;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ListLoaderState();
}

class _ListLoaderState extends ConsumerState<ListLoader> {
  bool isLoading = true;
  getData() async {
    final result = await ref.read(dataNotiferProvider).getData(widget.page);
    if (result is DataFailed) {
      setState(() => isLoading = false);
    } else {
      widget.onSuccess();
    }
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 49,
      width: double.infinity,
      child: Center(
        child: isLoading
            ? const SizedBox(
                width: 29,
                height: 29,
                child: CircularProgressIndicator(color: Colors.blue),
              )
            : PrimaryButtonWidget(
                text: 'somthing wrong,try again',
                async: true,
                function: () async => await getData(),
              ),
      ),
    );
  }
}
