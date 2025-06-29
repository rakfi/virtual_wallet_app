import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import '../models/transaction_model.dart'; // We will create this model

class DashboardScreen extends StatelessWidget {
  DashboardScreen({super.key});

  // Mock data for demonstration
  final double balance = 2548.75;
  final List<Transaction> recentTransactions = [
    Transaction(icon: EvaIcons.musicOutline, title: "Spotify Subscription", date: "Oct 28, 2023", amount: "- \$10.99", type: TransactionType.sent),
    Transaction(icon: EvaIcons.person, title: "Payment from Alex", date: "Oct 27, 2023", amount: "+ \$250.00", type: TransactionType.received),
    Transaction(icon: EvaIcons.shoppingCartOutline, title: "Groceries", date: "Oct 26, 2023", amount: "- \$78.50", type: TransactionType.sent),
  ];

  @override
  Widget build(BuildContext context) {
    // For formatting the currency
    final currencyFormatter = NumberFormat.currency(locale: 'en_US', symbol: '\$');

    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(20.0),
          children: [
            // Header
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("My Wallet", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
                CircleAvatar(
                  backgroundImage: NetworkImage('https://i.pravatar.cc/150?img=3'), // Placeholder avatar
                )
              ],
            ),
            const SizedBox(height: 20),

            // Balance Card
            _buildBalanceCard(currencyFormatter),

            const SizedBox(height: 30),

            // Action Buttons
            _buildActionButtons(),

            const SizedBox(height: 30),

            // Recent Transactions
            const Text("Recent Transactions", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 15),
            ...recentTransactions.map((tx) => TransactionTile(transaction: tx)),
          ],
        ),
      ),
    );
  }

  Widget _buildBalanceCard(NumberFormat currencyFormatter) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          colors: [Colors.deepPurple, Colors.purple.shade300],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("TOTAL BALANCE", style: TextStyle(color: Colors.white70, fontSize: 14)),
          const SizedBox(height: 8),
          Text(
            currencyFormatter.format(balance),
            style: const TextStyle(color: Colors.white, fontSize: 36, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _actionButton(icon: EvaIcons.arrowUpwardOutline, label: "Send"),
        _actionButton(icon: EvaIcons.arrowDownwardOutline, label: "Request"),
        _actionButton(icon: EvaIcons.barChart2Outline, label: "Stats"),
        _actionButton(icon: EvaIcons.moreHorizontalOutline, label: "More"),
      ],
    );
  }

  Widget _actionButton({required IconData icon, required String label}) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(color: Colors.grey.withOpacity(0.1), spreadRadius: 1, blurRadius: 5)
            ],
          ),
          child: Icon(icon, color: Colors.deepPurple, size: 28),
        ),
        const SizedBox(height: 8),
        Text(label, style: const TextStyle(color: Colors.black54)),
      ],
    );
  }
}

// Reusable Widget for a single transaction item
class TransactionTile extends StatelessWidget {
  final Transaction transaction;
  const TransactionTile({super.key, required this.transaction});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.deepPurple.withOpacity(0.1),
          child: Icon(transaction.icon, color: Colors.deepPurple),
        ),
        title: Text(transaction.title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(transaction.date, style: const TextStyle(color: Colors.grey)),
        trailing: Text(
          transaction.amount,
          style: TextStyle(
            color: transaction.type == TransactionType.sent ? Colors.redAccent : Colors.green,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}