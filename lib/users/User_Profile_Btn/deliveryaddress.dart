import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:mobile_app/homepage.dart';
import 'package:mobile_app/users/catelog/usercart.dart';
import 'package:mobile_app/users/navbar/userprofile.dart';

class DeliveryAddressBtn extends StatefulWidget {
  const DeliveryAddressBtn({super.key});

  @override
  State<DeliveryAddressBtn> createState() => _DeliveryAddressBtnState();
}

class _DeliveryAddressBtnState extends State<DeliveryAddressBtn> {
  String? _pickedLocation;

  Future<void> _getCurrentLocation() async {
    try {
      Position position = await _determinePosition();

      List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );

      if (placemarks.isNotEmpty) {
        Placemark currentPlacemark = placemarks.first;
        String readableLocation =
            '${currentPlacemark.locality}, ${currentPlacemark.administrativeArea}, ${currentPlacemark.country}';

        print(readableLocation);

        setState(() {
          _pickedLocation = readableLocation;
        });
      } else {
        print('No placemarks found for the given coordinates.');
      }
    } catch (e) {
      print('Error getting location: $e');
    }
  }

// @override
//   void initState() {
//     super.initState();
//     _getCurrentLocation();
//   } 

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw Exception('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission != LocationPermission.denied) {
        throw Exception('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      throw Exception('Location permissions are permanently denied.');
    }

    return await Geolocator.getCurrentPosition();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: //App bar
          AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_sharp,
              color: Colors.black87, size: 24),
          onPressed: () {
            Get.back();
          },
        ),
        title: Text('Delivery Address',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            )),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              Get.back();
            },
          ),
        ],
      ),

      //Body
      body: MediaQuery.of(context).orientation == Orientation.portrait

      ? SingleChildScrollView(
        child: Column(children: [
          SizedBox(
            height: 20,
          ),
          Container(
            alignment: Alignment.center,
            child: Column(
              children: [
                ElevatedButton(
                  onPressed: _getCurrentLocation,
                  child: Text('Get Current Location'),
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFF2B423F),
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Picked Location:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  _pickedLocation ?? 'No location picked',
                  style: TextStyle(fontSize: 16),
                ),

                // ElevatedButton(onPressed: () {
                //   Get.to(UserCart(
                //     // location:  _pickedLocation!,
                //   ));
                // }, child: Text('Button'))
              ],
            ),
          )
        ]),
      )


      //Landscape
      : SingleChildScrollView(
        child: Column(children: [
          SizedBox(
            height: 20,
          ),
          Container(
            alignment: Alignment.center,
            child: Column(
              children: [
                ElevatedButton(
                  onPressed: _getCurrentLocation,
                  child: Text('Get Current Location'),
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFF2B423F),
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Picked Location:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  _pickedLocation ?? 'No location picked',
                  style: TextStyle(fontSize: 16),
                ),

                // ElevatedButton(onPressed: () {
                //   Get.to(UserCart(
                //     // location:  _pickedLocation!,
                //   ));
                // }, child: Text('Button'))
              ],
            ),
          )
        ]),
      ),

      //Bottom navigation bar
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int index) {
          // Perform actions based on the tapped button
          switch (index) {
            case 0:
              // Home button tapped
              // Perform home-related actions
              Get.to(Homepage());
              break;
            case 1:
              // Favorites button tapped
              // Perform favorites-related actions
              break;
            case 2:
              // Shopping button tapped
              // Perform shopping-related actions
              Get.to(UserCart());
              break;
            case 3:
              // Profile button tapped
              // Perform profile-related actions
              //navigate to profile page
              Get.to(Profile());
              break;
          }
        },
        items: [
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.only(top: 12, left: 5),
              child: Column(
                children: [
                  Icon(
                    Icons.home_outlined,
                    color: Colors.black,
                  ),
                  SizedBox(height: 5),
                  Text('Home', style: TextStyle(color: Colors.black)),
                ],
              ),
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Column(
                children: [
                  Icon(Icons.favorite_outline_outlined, color: Colors.black),
                  SizedBox(height: 5),
                  Text('Favorites', style: TextStyle(color: Colors.black)),
                ],
              ),
            ),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Column(
              children: [
                Icon(Icons.shopping_cart_outlined, color: Colors.black),
                SizedBox(height: 5),
                Text('Shopping', style: TextStyle(color: Colors.black)),
              ],
            ),
            label: 'Shopping',
          ),
          BottomNavigationBarItem(
            icon: Column(
              children: [
                Icon(Icons.person_outline_outlined, color: Colors.black),
                SizedBox(height: 5),
                Text('Profile', style: TextStyle(color: Colors.black)),
              ],
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
