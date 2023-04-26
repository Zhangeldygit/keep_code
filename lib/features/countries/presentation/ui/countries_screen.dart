import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keep_code/features/countries/presentation/blocs/active_services/active_services_bloc.dart';
import 'package:keep_code/features/countries/presentation/blocs/countries/countries_bloc.dart';
import 'package:keep_code/features/countries/presentation/ui/active_services_screen.dart';

class CountriesScreen extends StatefulWidget {
  const CountriesScreen({Key? key}) : super(key: key);

  @override
  State<CountriesScreen> createState() => _CountriesScreenState();
}

class _CountriesScreenState extends State<CountriesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Топ сервисы'),
      ),
      body: BlocBuilder<CountriesBloc, CountriesState>(
        builder: (context, state) {
          if (state is CountriesLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is CountriesLoaded) {
            return ListView.builder(
              itemCount: state.countries?.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Text(
                      "Количество: ${state.countries?[index].count}",
                      style: const TextStyle(color: Colors.black, fontSize: 18),
                    ),
                    subtitle: Row(
                      children: [
                        Text(
                          "Цена: ${state.countries?[index].price}",
                          style:
                              const TextStyle(color: Colors.red, fontSize: 16),
                        ),
                      ],
                    ),
                    trailing: TextButton(
                      child: const Text('Купить'),
                      onPressed: () {
                        BlocProvider.of<ActiveServicesBloc>(context).add(
                            AddService(countryModel: state.countries![index]));

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const ActiveServicesScreen()));
                      },
                    ),
                  ),
                );
              },
            );
          }
          return const Center(
              child: Text(
            "Something went wrong",
            style: TextStyle(color: Colors.red),
          ));
        },
      ),
    );
  }
}
