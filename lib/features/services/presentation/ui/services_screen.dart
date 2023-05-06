import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keep_code/features/countries/presentation/blocs/countries/countries_bloc.dart';
import 'package:keep_code/features/countries/presentation/ui/countries_screen.dart';
import 'package:keep_code/features/services/presentation/blocs/services/services_bloc.dart';
import 'package:keep_code/features/services_and_countries/presentation/blocs/countries_and_services/countries_and_services_bloc.dart';

class ServicesScreen extends StatefulWidget {
  const ServicesScreen({Key? key}) : super(key: key);

  @override
  State<ServicesScreen> createState() => _ServicesScreenState();
}

class _ServicesScreenState extends State<ServicesScreen> {
  @override
  void initState() {
    BlocProvider.of<CountriesAndServicesBloc>(context)
        .add(GetCountriesAndServices());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Сервисы'),
      ),
      body: BlocBuilder<ServicesBloc, ServicesState>(
        builder: (context, state) {
          if (state is ServicesLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is ServicesLoaded) {
            return ListView.builder(
              itemCount: state.services.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    BlocProvider.of<CountriesBloc>(context).add(GetCountries(
                        serviceName: state.services[index].shortName));

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const CountriesScreen()));
                  },
                  child: Card(
                    child: ListTile(
                      title: Text(
                        "Сервис: ${state.services[index].shortName ?? 'name'}",
                        style:
                            const TextStyle(color: Colors.black, fontSize: 18),
                      ),
                      subtitle: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "количество: ${state.services[index].totalCount}",
                            style: const TextStyle(
                                color: Colors.grey, fontSize: 16),
                          ),
                          Text(
                            "цена: ${state.services[index].countWithFreePrice}",
                            style: const TextStyle(
                                color: Colors.grey, fontSize: 16),
                          ),
                        ],
                      ),
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
