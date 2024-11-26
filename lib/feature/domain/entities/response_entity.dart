import 'package:equatable/equatable.dart';

class ResponseEntity extends Equatable {
  final int? id;
  final int orderId;
  final String contractorId;
  final int period;

  const ResponseEntity({
    this.id,
    required this.orderId,
    required this.contractorId,
    required this.period
  });

  @override
  get props => [id, orderId, contractorId, period];
}
