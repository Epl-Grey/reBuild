import 'package:equatable/equatable.dart';

class OrderEntity extends Equatable{
  final int id;
  final String customerId;
  final String name;
  final String devices;
  final String descriptions;
  final int period;

  const OrderEntity({
    required this.id,
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