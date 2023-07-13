import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:mobile_app/users/catelog/Cart_total.dart';
import 'package:mobile_app/users/catelog/Checkout_total.dart';
import 'package:mobile_app/users/catelog/usercart.dart';

class CheckOutScreen extends StatefulWidget {
  const CheckOutScreen({Key? key}) : super(key: key);

  @override
  State<CheckOutScreen> createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreen> {
  String selectedPaymentType = '';
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

  int selectedRadioValue = 1;

  void handleRadioValueChanged(int value) {
    setState(() {
      selectedRadioValue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new_sharp,
            color: Colors.black87,
            size: 24,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Checkout',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        centerTitle: true,
        actions: [
          // IconButton(
          //   icon: Icon(
          //     Icons.edit,
          //     color: Colors.black87,
          //   ),
          //   onPressed: () {
          //     Get.back();
          //   },
          // ),
          // IconButton(
          //   icon: Icon(
          //     Icons.shopping_cart,
          //     color: Colors.black87,
          //   ),
          //   onPressed: () => Get.to(() => UserCart()),
          // ),
        ],
      ),
      
      
      body: MediaQuery.of(context).orientation == Orientation.portrait 
      
      //Portrait
      ? SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      'Shipping To',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                ),

                SizedBox(
                  height: 20,
                ),

                //make two containers with white background which are radio buttons and also a edit button
                Container(
                  height: 100,
                  width: 400,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Color.fromARGB(221, 207, 207, 207),
                      width: 1,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Radio(
                          value: 1,
                          groupValue: selectedRadioValue,
                          onChanged: (value) {
                            handleRadioValueChanged(value as int);
                          },
                          activeColor: Color(0xFF0C8A7B),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Current Address',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            ),
                            SizedBox(height: 10),
                            Container(
                              width: 190,
                              child: Text(
                                _pickedLocation ?? 'No location picked',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(150, 0, 0, 0),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(width: 50),
                        IconButton(
                          icon: Icon(
                            Icons.location_on_outlined,
                            color: Colors.black87,
                          ),
                          onPressed: () {
                            // Edit button action
                            _getCurrentLocation();
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                
                SizedBox(height: 10),
                
                Container(
                  height: 100,
                  width: 400,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Color.fromARGB(221, 207, 207, 207),
                      width: 1,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Radio(
                          value: 2,
                          groupValue: selectedRadioValue,
                          onChanged: (value) {
                            handleRadioValueChanged(value as int);
                          },
                          activeColor: Color(0xFF0C8A7B),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Custom Address',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            ),
                            SizedBox(height: 10),
                            Container(
                              width: 150,
                              child: Text(
                                'Click To Choose',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(150, 0, 0, 0),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(width: 50),
                        IconButton(
                          icon: Icon(
                            Icons.edit,
                            color: Colors.black87,
                          ),
                          onPressed: () {
                            // Edit button action
                          },
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(
                  height: 20,
                ),

                //Payment Method
                Container(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      'Payment Method',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                ),

                SizedBox(
                  height: 20,
                ),

                //make 3 containers where each container has row which has payment type icon conatiner, payment type, and a radio button to the right and the payment types are credit card/paypal/apple pay
                Column(
                  children: [
                    PaymentTypeContainer(
                      paymentType: 'Credit Card',
                      paymentIcon: 'Asset/Images/card.png',
                      isSelected: selectedPaymentType == 'Credit Card',
                      onChanged: (value) {
                        setState(() {
                          selectedPaymentType = 'Credit Card';
                          print('Selected payment type: $selectedPaymentType');
                        });
                      },
                    ),
                    PaymentTypeContainer(
                      paymentType: 'PayPal',
                      paymentIcon: 'Asset/Images/paypal.png',
                      isSelected: selectedPaymentType == 'PayPal',
                      onChanged: (value) {
                        setState(() {
                          selectedPaymentType = 'PayPal';
                          print('Selected payment type: $selectedPaymentType');
                        });
                      },
                    ),
                    PaymentTypeContainer(
                      paymentType: 'Apple Pay',
                      paymentIcon: 'Asset/Images/applepay.png',
                      isSelected: selectedPaymentType == 'Apple Pay',
                      onChanged: (value) {
                        setState(() {
                          selectedPaymentType = 'Apple Pay';
                          print('Selected payment type: $selectedPaymentType');
                        });
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      )


      //LandScape
      : SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      'Shipping To',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                ),

                SizedBox(
                  height: 20,
                ),

                //make two containers with white background which are radio buttons and also a edit button
                Container(
                  height: 100,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Color.fromARGB(221, 207, 207, 207),
                      width: 1,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Radio(
                          value: 1,
                          groupValue: selectedRadioValue,
                          onChanged: (value) {
                            handleRadioValueChanged(value as int);
                          },
                          activeColor: Color(0xFF0C8A7B),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Current Address',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            ),
                            SizedBox(height: 10),
                            Container(
                              width: 190,
                              child: Text(
                                _pickedLocation ?? 'No location picked',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(150, 0, 0, 0),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(width: 50),
                        IconButton(
                          icon: Icon(
                            Icons.location_on_outlined,
                            color: Colors.black87,
                          ),
                          onPressed: () {
                            // Edit button action
                            _getCurrentLocation();
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                
                SizedBox(height: 10),
                
                Container(
                  height: 100,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Color.fromARGB(221, 207, 207, 207),
                      width: 1,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Radio(
                          value: 2,
                          groupValue: selectedRadioValue,
                          onChanged: (value) {
                            handleRadioValueChanged(value as int);
                          },
                          activeColor: Color(0xFF0C8A7B),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Custom Address',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            ),
                            SizedBox(height: 10),
                            Container(
                              width: 150,
                              child: Text(
                                'Click To Choose',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(150, 0, 0, 0),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(width: 50),
                        IconButton(
                          icon: Icon(
                            Icons.edit,
                            color: Colors.black87,
                          ),
                          onPressed: () {
                            // Edit button action
                          },
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(
                  height: 20,
                ),

                //Payment Method
                Container(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      'Payment Method',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                ),

                SizedBox(
                  height: 20,
                ),

                //make 3 containers where each container has row which has payment type icon conatiner, payment type, and a radio button to the right and the payment types are credit card/paypal/apple pay
                Column(
                  children: [
                    PaymentTypeContainer(
                      paymentType: 'Credit Card',
                      paymentIcon: 'Asset/Images/card.png',
                      isSelected: selectedPaymentType == 'Credit Card',
                      onChanged: (value) {
                        setState(() {
                          selectedPaymentType = 'Credit Card';
                          print('Selected payment type: $selectedPaymentType');
                        });
                      },
                    ),
                    PaymentTypeContainer(
                      paymentType: 'PayPal',
                      paymentIcon: 'Asset/Images/paypal.png',
                      isSelected: selectedPaymentType == 'PayPal',
                      onChanged: (value) {
                        setState(() {
                          selectedPaymentType = 'PayPal';
                          print('Selected payment type: $selectedPaymentType');
                        });
                      },
                    ),
                    PaymentTypeContainer(
                      paymentType: 'Apple Pay',
                      paymentIcon: 'Asset/Images/applepay.png',
                      isSelected: selectedPaymentType == 'Apple Pay',
                      onChanged: (value) {
                        setState(() {
                          selectedPaymentType = 'Apple Pay';
                          print('Selected payment type: $selectedPaymentType');
                        });
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),

      bottomNavigationBar: CheckOutTotal(),
    );
  }
}

//Payment Type Container
class PaymentTypeContainer extends StatelessWidget {
  final String paymentType;
  final paymentIcon;
  final bool isSelected;
  final Function(bool?) onChanged;

  const PaymentTypeContainer({
    required this.paymentType,
    required this.paymentIcon,
    required this.isSelected,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: isSelected ? Colors.blue[50] : Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Color.fromARGB(221, 207, 207, 207),
          width: 1,
        ),
      ),
      padding: EdgeInsets.all(8.0),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(paymentIcon),
            SizedBox(width: 8.0),
            Padding(
              padding: const EdgeInsets.only(right: 80),
              child: Container(
                width: 100,
                alignment: Alignment.centerLeft,
                child: Text(
                  paymentType,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ),
            ),
            SizedBox(width: 8.0),
            //Radio BUtton
            Theme(
              data: ThemeData(
                unselectedWidgetColor: Color(0xFF0C8A7B),
                radioTheme: RadioThemeData(
                  fillColor: MaterialStateColor.resolveWith((states) {
                    if (states.contains(MaterialState.selected)) {
                      return Color(0xFF0C8A7B);
                    }
                    return Color(0xFF0C8A7B).withOpacity(
                        0.5); // Opacity for unselected radio buttons
                  }),
                ),
              ),
              child: Radio(
                value: isSelected,
                groupValue: true,
                onChanged: onChanged,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
