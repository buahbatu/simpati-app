import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class Transaction extends Equatable {
  final String id;
  final String description;
  final double ammount;
  final bool isIncome;
  final DateTime time;
  final TransactionKind kind;

  Transaction(
    this.id,
    this.description,
    this.ammount,
    this.isIncome,
    this.time, {
    this.kind = TransactionKind.mock,
  });

  @override
  List<Object> get props => [
        this.id,
        this.description,
        this.ammount,
        this.time,
        this.kind,
        this.isIncome
      ];

  Transaction copyWith({
    final String id,
    final String description,
    final double ammount,
    final bool isIncome,
    final DateTime time,
    final TransactionKind kind,
  }) {
    return Transaction(
      id ?? this.id,
      description ?? this.description,
      ammount ?? this.ammount,
      isIncome ?? this.isIncome,
      time ?? this.time,
      kind: kind ?? this.kind,
    );
  }

  static Transaction mock = Transaction(
    "1",
    "Nasi Goreng",
    5000,
    false,
    DateTime.now(),
    kind: TransactionKind.mock,
  );
}

class TransactionKind extends Equatable {
  final String id;
  final String name;
  final IconData itemIcon;
  final String parentId;
  final bool isActive;
  final Color labelColor;

  const TransactionKind(
    this.id,
    this.name,
    this.itemIcon, {
    this.labelColor = Colors.blue,
    this.parentId,
    this.isActive = true,
  });

  @override
  List<Object> get props => [
        this.id,
        this.name,
        this.itemIcon,
        this.labelColor,
        this.parentId,
        this.isActive,
      ];

  static const mock = TransactionKind(
    "1",
    "Makanan dan Minuman",
    Icons.fastfood,
  );

  // wallet types
  static List<TransactionKind> defaults = <TransactionKind>[
    TransactionKind('1', 'Makanan dan Minuman', Icons.fastfood),
  ];
}
