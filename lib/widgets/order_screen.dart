import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OrderScreen extends ConsumerWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order Screen'),
        automaticallyImplyLeading: true,
      ),
      body: DefaultTabController(
        initialIndex: 0,
          length: 2,
          child: Column(
            children: [
              Container(
                color: Colors.white,
                child: TabBar(
                    tabs: <Widget> [
                      Tab(text: 'Your Bookings'),
                      Tab(text: 'Your Orders'),
                    ]
                ),

              ),
              Expanded(
                child: TabBarView(

                  children: <Widget> [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            _buildOrderCard("123456789", "Model Name", "Service Name", "City", "Date", "Time", "Status"),
                            _buildOrderCard("123456789", "Model Name", "Service Name", "City", "Date", "Time", "Status"),
                            _buildOrderCard("123456789", "Model Name", "Service Name", "City", "Date", "Time", "Status"),
                            _buildOrderCard("123456789", "Model Name", "Service Name", "City", "Date", "Time", "Status"),
                          ],
                        ),
                      ),
                    ),
                    Center(
                      child: Text('Your Orders'),
                    ),
                  ],
                ),
              ),
            ],
          ),

      ),

    );
  }

  Widget _buildOrderCard(String orderId, String modelName, String serviceName, String city, String date, String time, String status) {
    return  Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
          height:   200,
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.shopping_bag),
                    SizedBox(width: 10),
                    Text("Order ID: $orderId")
                  ],
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        Icon(Icons.model_training),
                        SizedBox(width: 10),
                        Text(modelName)
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.electrical_services),
                        SizedBox(width: 10),
                        Text(serviceName),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.location_city),
                        SizedBox(width: 10),
                        Text(city)
                      ],
                    ),
                  ],
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        Icon(Icons.date_range),
                        SizedBox(width: 10),
                        Text(date),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.timelapse),
                        SizedBox(width: 10),
                        Text(time),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.check_circle),
                        SizedBox(width: 10),
                        Text(status),
                      ],
                    ),
                  ],
                ),

              ],
            ),
          )
      ),
    );
  }
}