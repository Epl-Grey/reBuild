import 'package:supabase_flutter/supabase_flutter.dart';

import '../models/order_model.dart';

abstract class OrdersRemoteDataSource {
  Future<List<OrderModel>> getOrders();
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
    }).eq("id", order.id!);
  }

  @override
  Future<List<OrderModel>> getOrders() async {
    List<Map<String, dynamic>> data;
    
    data = await supabaseClient
      .from('Orders')
      .select();
    
    return data.map((order) => OrderModel.fromJson(order)).toList();
  }

  @override
  Future<void> deleteOrder(OrderModel order) async {
    await supabaseClient.from("Orders").delete().match({ "id": order.id! });
  }
}
