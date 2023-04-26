import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keep_code/features/countries/presentation/blocs/active_services/active_services_bloc.dart';

class ActiveServicesScreen extends StatelessWidget {
  const ActiveServicesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Активные сервисы'),
      ),
      body: BlocBuilder<ActiveServicesBloc, ActiveServicesState>(
        builder: (context, state) {
          if (state is ActiveServicesLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is ActiveServicesLoaded) {
            return ListView.builder(
              itemCount: state.activeServices.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Text(
                      "Количество: ${state.activeServices[index].count}",
                      style: const TextStyle(color: Colors.black, fontSize: 18),
                    ),
                    subtitle: Row(
                      children: [
                        Text(
                          "Цена: ${state.activeServices[index].price}",
                          style: const TextStyle(
                              color: Colors.green, fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }
          return const Center(
            child: Text('Empty Services'),
          );
        },
      ),
    );
  }
}
