import 'package:supabase_flutter/supabase_flutter.dart';

import '../models/order_model.dart';

abstract class OrdersRemoteDataSource {
  Future<List<OrderModel>> getOrders({bool? isDone, String? userId});
  Future<void> createOrder(OrderModel order);
  Future<void> updateOrder(OrderModel order);
  Future<void> deleteOrder(OrderModel order);
}

class OrderRemoteDataSourceImpl extends OrdersRemoteDataSource{
  final SupabaseClient supabaseClient;

  OrderRemoteDataSourceImpl(this.supabaseClient);

  @override
  Future<void> createOrder(OrderModel order) async {
    supabaseClient.from("Orders").insert(order);
  }
  
  @override
  Future<void> updateOrder(OrderModel order) async {
    return await supabaseClient.from("Orders").update({
      'name': order.name,
      'devices': order.devices,
      'descriptions': order.descriptions,
      'period': order.period,
      'is_done': order.isDone
    }).eq("id", order.id!);
  }

  @override
  Future<List<OrderModel>> getOrders({bool? isDone, String? userId}) async {
    List<Map<String, dynamic>> data;
    
    var query = supabaseClient.from('Orders').select();

    if (isDone != null) {
      query = query.eq('id_done', isDone);
    }

    if (userId != null) {
      query = query.eq('customer_id', userId);
    }

    data = await query;
    
    return data.map((order) => OrderModel.fromJson(order)).toList();
  }

  @override
  Future<void> deleteOrder(OrderModel order) async {
    await supabaseClient.from("Orders").delete().match({ "id": order.id! });
  }
}
