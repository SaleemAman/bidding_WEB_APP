import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bidding App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const BiddingHome(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class BiddingHome extends StatelessWidget {
  const BiddingHome({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Bidding Page')),
      body: const Center(child: MaximumBid(initialBid: 100)), // starting bid = 100
    );
  }
}

class MaximumBid extends StatefulWidget {
  final int initialBid;
  const MaximumBid({super.key, this.initialBid = 0});
  @override
  State<MaximumBid> createState() => _MaximumBidState();
}

class _MaximumBidState extends State<MaximumBid> {
  late int _currentBid;

  @override
  void initState() {
    super.initState();
    _currentBid = widget.initialBid;
  }

  void _increaseBid() {
    setState(() {
      _currentBid += 50; // increase by $50
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 24.0),
      elevation: 6,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          const Text('Current Maximum Bid', style: TextStyle(fontSize: 18)),
          const SizedBox(height: 12),
          Text('\$$_currentBid', style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold)),
          const SizedBox(height: 20),
          ElevatedButton.icon(onPressed: _increaseBid, icon: const Icon(Icons.arrow_upward), label: const Text('Increase Bid (+\$50)')),
        ]),
      ),
    );
  }
}
