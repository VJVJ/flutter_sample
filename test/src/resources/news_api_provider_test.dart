import 'package:news/src/resources/news_api_provider.dart';
import 'dart:convert';
import 'package:test/test.dart';
import 'package:http/http.dart';
import 'package:http/testing.dart';

void main(){
  test('FetchTopIds returns a list of ids',() async {
    final newsApi = NewsApiProvider();
    
    newsApi.client =  MockClient((request) async{
      return Response(json.encode([1,2,3,4]), 200); //200 - status code of successful http request
    });

    final ids = await newsApi.fetchTopIds();

    expect(ids, [1,2,3,4]);
  });


  test('FetchItem retruns a item model', ()  async {
    final newsApi =  NewsApiProvider();

    newsApi.client =  MockClient((request) async {
      final jsonMap =  {'id':123}; // create a Map just with the id
      return  Response(json.encode(jsonMap), 200);
    });

    final item =  await newsApi.fetchItem(999);

      expect(item.id, 123);

  });
}