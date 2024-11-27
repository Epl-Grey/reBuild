import 'package:equatable/equatable.dart';

class OrderEntity extends Equatable{
  final int? id;
  final String? customerId;
  final String name;
  final String devices;
  final String descriptions;
  final int period;
  final bool isDone;
  final bool isWorking;

  const OrderEntity({
    this.id,
    this.customerId,
    required this.name,
    required this.devices,
    required this.descriptions,
    required this.period,
    required this.isDone,
    required this.isWorking
  });
  
  @override
  get props => [
    id,
    customerId,
    name,
    devices,
    descriptions,
    period,
    isDone,
    isWorking,
  ];
}