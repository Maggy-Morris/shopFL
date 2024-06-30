// import 'package:flutter/material.dart';
// import 'package:anwer_shop/models/order.dart';
// import 'package:anwer_shop/orders/controllers/order_controller.dart';
// import 'package:anwer_shop/orders/widgets/order_card.dart';

// class OrderScreen extends StatefulWidget {
//   static const String routeName = '/order-screen';
//   const OrderScreen({super.key});

//   @override
//   State<OrderScreen> createState() => _OrderScreenState();
// }

// class _OrderScreenState extends State<OrderScreen> {
//   OrderController orderController = OrderController();

//   Future acceptOrder({required Order order}) async {
//     await orderController.acceptOrder(order: order);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         foregroundColor: Colors.white,
//         title: const Text(
//           'New Orders',
//           style: TextStyle(
//             fontSize: 16,
//           ),
//         ),
//         centerTitle: true,
//       ),
//        body: StreamBuilder<List<Order>>(
//     stream: orderController.fetchOrder(),
//     builder: (context, snapshot) {
//     if (snapshot.connectionState == ConnectionState.waiting) {
//     return const Center(
//     child: CircularProgressIndicator(),
//     );
//     }

//     if (!snapshot.hasData || snapshot.data == null || snapshot.data!.isEmpty) {
//     return const Center(
//     child: Text('No orders available'),
//     );
//     }

//     return ListView.builder(
//     shrinkWrap: true,
//     physics: const BouncingScrollPhysics(),
//     itemCount: snapshot.data!.length,
//     itemBuilder: (context, index) {
//     final order = snapshot.data![index];

//     return OrderCard(
//     order: order,
//     acceptOrder: () => acceptOrder(
//     order: order,
//     ),
//     );
//     },
//     );
//     },
//     ),

//     );
//   }
// }
