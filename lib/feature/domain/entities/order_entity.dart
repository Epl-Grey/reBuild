import 'package:equatable/equatable.dart';

class Order extends Equatable{
  final int? id;
  final String customerId;
  final String name;
  final List<String> devices;
  final List<String> descriptions;
  final int period;

  const Order({
    this.id,
    required this.customerId,
    required this.name,
    required this.devices,
    required this.descriptions,
    required this.period
  });
  
  @override
  get props => [
    id,
    customerId,
    name,
    devices,
    descriptions,
    period
  ];
}