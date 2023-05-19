import 'package:dio/dio.dart' hide Headers;

import 'package:flutter_new_project/restaurant/model/restaurant_detail_model.dart';
import 'package:retrofit/retrofit.dart';

part 'restaurant_repository.g.dart';

//retrofit 사용법
@RestApi()
abstract class RestaurantRepository {
  factory RestaurantRepository(Dio dio, {String baseUrl}) =
      _RestaurantRepository;

  // http : // $ip/restaurant/
  // @GET('/')
  // paginate();

  //snapshot의 데이터를 가져옴.
  //RestaurantDetailModel과 Mapping중

  //실제로 응답받는 데이터와 모델링의 형식이 완전히 같아야함.
  //http : // $ip/restaurant/:id
  @GET('/{id}')
  //refresh Token이 만료되었을 때 자동으로 Access Token 발급하는 방법
  @Headers({
    'accessToken': 'true',
  })
  Future<RestaurantDetailModel> getRestaurantDetail({
    @Path() required String id,
    //Get에 있는 id변수를 path id로 넣어줌
  });
}