import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';
import 'package:tests/person_repository.dart';

class ClientMock extends Mock implements http.Client {}

void main() {
  late ClientMock client;
  late PersonRepository repository;

  const jsonReturn =
      '[{"name":"name 1","age":18,"height":89,"weight":48,"id":"1"},{"name":"name 2","age":90,"height":57,"weight":56,"id":"2"},{"name":"name 3","age":12,"height":62,"weight":90,"id":"3"},{"name":"name 4","age":52,"height":41,"weight":73,"id":"4"},{"name":"name 5","age":45,"height":6,"weight":20,"id":"5"},{"name":"name 6","age":15,"height":40,"weight":52,"id":"6"},{"name":"name 7","age":46,"height":95,"weight":60,"id":"7"},{"name":"name 8","age":54,"height":8,"weight":17,"id":"8"},{"name":"name 9","age":24,"height":82,"weight":12,"id":"9"},{"name":"name 10","age":14,"height":4,"weight":51,"id":"10"},{"name":"name 11","age":99,"height":10,"weight":86,"id":"11"},{"name":"name 12","age":57,"height":12,"weight":67,"id":"12"},{"name":"name 13","age":30,"height":66,"weight":63,"id":"13"},{"name":"name 14","age":84,"height":39,"weight":46,"id":"14"},{"name":"name 15","age":52,"height":30,"weight":1,"id":"15"},{"name":"name 16","age":58,"height":58,"weight":23,"id":"16"},{"name":"name 17","age":87,"height":0,"weight":12,"id":"17"},{"name":"name 18","age":8,"height":66,"weight":37,"id":"18"},{"name":"name 19","age":76,"height":47,"weight":42,"id":"19"},{"name":"name 20","age":60,"height":35,"weight":39,"id":"20"},{"name":"name 21","age":89,"height":96,"weight":80,"id":"21"},{"name":"name 22","age":97,"height":80,"weight":51,"id":"22"},{"name":"name 23","age":94,"height":26,"weight":40,"id":"23"},{"name":"name 24","age":89,"height":55,"weight":11,"id":"24"},{"name":"name 25","age":1,"height":8,"weight":78,"id":"25"},{"name":"name 26","age":100,"height":53,"weight":24,"id":"26"},{"name":"name 27","age":69,"height":29,"weight":89,"id":"27"},{"name":"name 28","age":32,"height":73,"weight":8,"id":"28"},{"name":"name 29","age":23,"height":61,"weight":100,"id":"29"},{"name":"name 30","age":90,"height":77,"weight":62,"id":"30"},{"name":"name 31","age":57,"height":76,"weight":87,"id":"31"},{"name":"name 32","age":37,"height":14,"weight":38,"id":"32"},{"name":"name 33","age":57,"height":47,"weight":60,"id":"33"},{"name":"name 34","age":52,"height":2,"weight":50,"id":"34"},{"name":"name 35","age":84,"height":56,"weight":50,"id":"35"},{"name":"name 36","age":84,"height":77,"weight":91,"id":"36"},{"name":"name 37","age":61,"height":60,"weight":47,"id":"37"},{"name":"name 38","age":35,"height":30,"weight":60,"id":"38"},{"name":"name 39","age":79,"height":91,"weight":93,"id":"39"},{"name":"name 40","age":79,"height":16,"weight":34,"id":"40"},{"name":"name 41","age":18,"height":63,"weight":62,"id":"41"},{"name":"name 42","age":2,"height":24,"weight":45,"id":"42"},{"name":"name 43","age":67,"height":11,"weight":67,"id":"43"},{"name":"name 44","age":88,"height":32,"weight":80,"id":"44"},{"name":"name 45","age":8,"height":95,"weight":90,"id":"45"},{"name":"name 46","age":87,"height":62,"weight":79,"id":"46"},{"name":"name 47","age":6,"height":99,"weight":31,"id":"47"},{"name":"name 48","age":95,"height":37,"weight":63,"id":"48"},{"name":"name 49","age":65,"height":94,"weight":5,"id":"49"},{"name":"name 50","age":73,"height":66,"weight":10,"id":"50"}]';

  setUp(() {
    client = ClientMock();
    repository = PersonRepository(client: client);
  });

  test('Deve pegar uma lista de person', () async {
    when(() => client.get((Uri.parse("https://6140bdba357db50017b3d87d.mockapi.io/person"))))
        .thenAnswer((_) async => http.Response(jsonReturn, 200));

    final list = await repository.getPerson();

    expect(list.isNotEmpty, equals(true));
    expect(list.first.name, equals("name 1"));
  });
}
