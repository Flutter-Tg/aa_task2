import 'package:aa_task2/data_resource/entity.dart';
import 'package:flutter/material.dart';

class DataBox extends StatelessWidget {
  const DataBox({super.key, required this.data});
  final DataEntity data;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
            ),
          ]),
      child: Text(data.title),
    );
  }
}
