import 'package:flutter/material.dart';

enum TransactionType { sent, received }

class Transaction {
  final IconData icon;
  final String title;
  final String date;
  final String amount;
  final TransactionType type;

  Transaction({
    required this.icon,
    required this.title,
    required this.date,
    required this.amount,
    required this.type,
  });
}