import 'package:flutter/material.dart';
import 'package:taxi_clone/model/driver.model.dart';

class DriverProvider extends ChangeNotifier {
  List<Driver> _people = [
    Driver(
        profile:
            'https://img.freepik.com/free-photo/close-up-portrait-smiling-young-bearded-man_171337-4819.jpg?size=626&ext=jpg&ga=GA1.1.1860429259.1697436346&semt=ais_user',
        car_model: 'Toyota Prius',
        rating: "4.8",
        location: '',
        name: 'Jhon Doe'),
    Driver(
        profile:
            'https://img.freepik.com/free-photo/close-up-portrait-smiling-young-bearded-man_171337-4819.jpg?size=626&ext=jpg&ga=GA1.1.1860429259.1697436346&semt=ais_user',
        car_model: 'Honda Civic',
        rating: '4.6',
        location: '',
        name: 'Jane Smith'),
    Driver(
        profile:
            'https://img.freepik.com/free-photo/close-up-portrait-smiling-young-bearded-man_171337-4819.jpg?size=626&ext=jpg&ga=GA1.1.1860429259.1697436346&semt=ais_user',
        car_model: 'Ford Fusion',
        rating: '4.7',
        location: '',
        name: 'Mike Johnson')
  ];
  List<Driver> get people => _people;
}
