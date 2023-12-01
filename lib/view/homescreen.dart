import 'package:flutter/material.dart';
import 'package:mvvm/data/response/status.dart';
import 'package:mvvm/view_model/token_view_model.dart';
import 'package:mvvm/utils/routeNames.dart';
import 'package:mvvm/view_model/home_view_model.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeViewMode homeViewMode = HomeViewMode();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    homeViewMode.returnmovielist();
  }

  @override
  Widget build(BuildContext context) {
    final sharedprovider = Provider.of<TokenViewModel>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: const Text('HOME'),
        centerTitle: true,
        actions: [
          Center(
            child: InkWell(
              onTap: () {
                sharedprovider.removepref().then((value) {
                  print(value);
                  Navigator.pushNamed(context, RoutesNames.Login);
                  print(value.toString());
                }).onError((error, stackTrace) {
                  print(error.toString());
                });
              },
              child: const Text(
                'Logout',
              ),
            ),
          ),
          const SizedBox(
            width: 20,
          )
        ],
      ),
      backgroundColor: Colors.white,
      body: ChangeNotifierProvider<HomeViewMode>(
        create: (BuildContext context) => homeViewMode,
        child: Consumer<HomeViewMode>(builder: ((context, value, _) {
          switch (value.movielist.status) {
            case Status.LOADING:
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.black,
                ),
              );
            case Status.ERROR:
              return Text(value.movielist.message.toString());

            case Status.COMPLETED:
              return ListView.builder(
                  // itemCount: value.movielist.data!.movies!.length,
                  itemCount: value.movielist.data!.movies!.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        title: Text(value.movielist.data!.movies![index].title
                            .toString()),
                        subtitle: Text(value.movielist.data!.movies![index].year
                            .toString()),
                        leading: Image.network(
                          value.movielist.data!.movies![index].posterurl
                              .toString(),
                          errorBuilder: (context, stack, error) {
                            return const Icon(
                              Icons.error,
                              color: Colors.red,
                            );
                          },
                        ),
                      ),
                    );
                  });

            default:
          }

          return Container();
        })),
      ),
    );
  }
}
