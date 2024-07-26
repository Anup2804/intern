import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
import 'package:taxi_clone/model/driver.model.dart';
// import 'package:taxi_clone/provider/driver.provider.dart';

class StatusScreen extends StatefulWidget {
  final Driver diver;
  StatusScreen({super.key, required this.diver});

  @override
  State<StatusScreen> createState() => _StatusScreenState();
}

class _StatusScreenState extends State<StatusScreen> {
  bool requestApproved = false;
  @override
  Widget build(BuildContext context) {
    // final driver = Provider.of<DriverProvider>(context);
    return Scaffold(
      appBar: AppBar(
        titleSpacing: .5,
        elevation: 5,
        title: Text('Driver status'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
                elevation: 5,
                child: SizedBox(
                  height: 200,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 100,
                            width: MediaQuery.of(context).size.width / 3.5,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(12)),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(5),
                              child: CircleAvatar(
                                backgroundImage: NetworkImage(
                                    'https://img.freepik.com/free-photo/close-up-portrait-smiling-young-bearded-man_171337-4819.jpg?size=626&ext=jpg&ga=GA1.1.1860429259.1697436346&semt=ais_user'),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Name: ${widget.diver.name}",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w300)),
                                Text("Car Model: ${widget.diver.car_model}",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w300)),
                                // Text("Car Number:",
                                //     style: TextStyle(
                                //         fontSize: 16,
                                //         fontWeight: FontWeight.w300)),
                                Text("Phone no:",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w300))
                              ],
                            ),
                          ),
                        ],
                      ),
                      Expanded(
                          child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Current Location:',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w300)),
                                Text('Reaching in:',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w300)),
                                Text('Estimate Charge:',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w300))
                              ],
                            ),
                          ],
                        ),
                      )),
                    ],
                  ),
                )),
          ),
          requestApproved
              ? Column(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.green,
                      child: Icon(Icons.check),
                    ),
                    Text(
                      'Ride Accepted',
                      style: Theme.of(context).textTheme.bodySmall,
                    )
                  ],
                )
              : ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue[400]),
                  onPressed: () {
                    setState(() {
                      requestApproved = false;
                    });
                    Future.delayed(Duration(seconds: 5), () {
                      setState(() {
                        requestApproved = true;
                      });
                    });
                  },
                  child: Text(
                    'Request Ride',
                    style: Theme.of(context).textTheme.bodySmall,
                  ))
        ],
      ),
    );
  }
}
