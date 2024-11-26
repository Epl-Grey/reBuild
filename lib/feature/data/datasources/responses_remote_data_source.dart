import 'package:rebuild/feature/data/models/response_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class ResponsesRemoteDataSource {
  Future<List<ResponseModel>> getResponses();
  Future<void> createResponse(ResponseModel response);
  Future<void> updateResponse(ResponseModel response);
}

class ResponseRemoteDataSourceImpl extends ResponsesRemoteDataSource{
  final SupabaseClient supabaseClient;

  ResponseRemoteDataSourceImpl(this.supabaseClient);

  @override
  Future<void> createResponse(ResponseModel response) async {
    supabaseClient.from("Responses").insert(response);
  }
  
  @override
  Future<void> updateResponse(ResponseModel response) async {
    return await supabaseClient.from("Responses").update({
      'order_id': response.orderId,
      'contractor_id': response.contractorId,
      'period': response.period,
    }).eq("id", response.id!);
  }

  @override
  Future<List<ResponseModel>> getResponses() async {
    List<Map<String, dynamic>> data;
    
    data = await supabaseClient
      .from('Responses')
      .select();
    
    return data.map((response) => ResponseModel.fromJson(response)).toList();
  }
}
