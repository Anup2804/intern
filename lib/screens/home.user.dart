import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taxi_clone/provider/driver.provider.dart';
import 'package:taxi_clone/screens/status.dart';
import 'package:taxi_clone/widgets/locator.dart';
// import 'package:taxi_clone/widgets/map.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String currentLocation = 'Fetching...';

  @override
  void initState() {
    super.initState();
    fetchLocation();
  }

  void fetchLocation() async {
    String location = await LocatorWidget.fetchPosition();
    setState(() {
      currentLocation = location;
    });
  }

  @override
  Widget build(BuildContext context) {
    final driver = Provider.of<DriverProvider>(context);
    return Scaffold(
      appBar: AppBar(
          elevation: 5,
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                currentLocation,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: CircleAvatar(),
              )
            ],
          )),
      body: Column(
        children: [
          Container(
            height: 280,
            width: MediaQuery.of(context).size.width,
            // color: Colors.orange,
            // child: MapOfGoogle(),
          ),
          Expanded(
            child: Container(
                // color: Colors.red,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 5),
                        child: TextField(
                          decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.search,
                                size: 20,
                              ),
                              hintText: 'Search desination',
                              hintStyle: Theme.of(context).textTheme.bodySmall,
                              constraints: BoxConstraints(maxWidth: 350),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 10)),
                        ),
                      ),
                      Divider(),
                      Text(
                        'Available Drivers',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      Expanded(
                          child: ListView.builder(
                        itemCount: driver.people.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => StatusScreen(
                                          diver: driver.people[index])));
                            },
                            child: Card(
                              elevation: 4,
                              surfaceTintColor: Colors.green,
                              child: ListTile(
                                leading: CircleAvatar(
                                  backgroundImage: NetworkImage(
                                      'https://img.freepik.com/free-photo/close-up-portrait-smiling-young-bearded-man_171337-4819.jpg?size=626&ext=jpg&ga=GA1.1.1860429259.1697436346&semt=ais_user'),
                                ),
                                title: Text(
                                  driver.people[index].name,
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                                subtitle: Text(
                                  'Rating: ${driver.people[index].rating}',
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                              ),
                            ),
                          );
                        },
                      ))
                    ],
                  ),
                )),
          )
        ],
      ),
    );
  }
}
