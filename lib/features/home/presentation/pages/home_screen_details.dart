import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:resupply_ai/core/functions/string_to_color.dart';
import 'package:resupply_ai/features/home/presentation/cubits/cubit/home_cubit.dart';

class HomeScreenDetails extends StatelessWidget {
  const HomeScreenDetails({super.key, required this.data});

  final List<dynamic> data; // List of dynamic (JSON-like)

  @override
  Widget build(BuildContext context) {
    if (data.isEmpty) return const SizedBox.shrink();

    final firstItem = data[0]; // First JSON object contains the lists
    if (firstItem == null || firstItem.isEmpty) return const SizedBox.shrink();

    // Calculate row count from the first key's list length
    final nsnList = firstItem['NSN'] as List<dynamic>? ?? [];
    final int rowCount = nsnList.length;

    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: DataTable(
                headingRowColor:
                    MaterialStateProperty.all(Colors.blue.shade200),
                columns: const [
                  DataColumn(label: Text('NSN')),
                  DataColumn(label: Text('Quote By')),
                  DataColumn(label: Text('Name')),
                  DataColumn(label: Text('Part No')),
                  DataColumn(label: Text('Last Price')),
                  DataColumn(label: Text('Qty')),
                  DataColumn(label: Text('Manufacturer')),
                  DataColumn(label: Text('Notes')),
                  DataColumn(label: Text('Action')),
                ],
                rows: List.generate(rowCount, (index) {
                  String getString(String key) {
                    final value = firstItem[key];
                    if (value is List && value.length > index) {
                      return value[index]?.toString() ?? '';
                    }
                    return '';
                  }

                  return DataRow(cells: [
                    DataCell(Text(getString('NSN'))),
                    DataCell(Text(getString('Quote By'))),
                    DataCell(Text(getString('Name'))),
                    DataCell(Text(getString('PartNo'))),
                    DataCell(Text(getString('LastPrice'))),
                    DataCell(Text(getString('Qty'))),
                    DataCell(Text(getString('Manufacturer'))),
                    DataCell(Text(getString('Notes'))),
                    DataCell(
                      BlocConsumer<HomeCubit, HomeState>(
                        listener: (context, state) {
                          if (state is HomeDetailsLoadedState) {
                            if (state.isContainTitle == true) {
                              // Navigate to title screen
                              context.pushReplacement(
                                '/homeScreenTitle',
                                extra: state.mainDetaislList,
                              );
                            } else {
                              // Reload same screen with new data
                              context.pushReplacement(
                                '/homeScreenDetails',
                                extra: state.mainDetaislList,
                              );
                            }
                          }
                        },
                        builder: (context, state) {
                          return ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: stringToColor(
                                getString('butcolor').isNotEmpty
                                    ? getString('butcolor')
                                    : 'FFFF00',
                              ),
                            ),
                            onPressed: () {
                              final action = getString('action');

                              if (action.isNotEmpty && action != 'null') {
                                print(action);
                                context
                                    .read<HomeCubit>()
                                    .getAllProductsDetails(url: action);
                              }
                            },
                            child: Text(
                              getString('buttext').isNotEmpty
                                  ? getString('buttext')
                                  : 'Quote',
                              style: const TextStyle(color: Colors.black),
                            ),
                          );
                        },
                      ),
                    ),
                  ]);
                }),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
