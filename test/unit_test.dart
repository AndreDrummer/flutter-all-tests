import 'package:flutter_test/flutter_test.dart';
import 'package:alltests/constants/country_enum.dart';
import 'package:alltests/repository/repository.dart';

void main() {
  late StartScreenRepository repository;

  setUp(() {
    repository = StartScreenRepository(Country.brasil);
  });

  test('Ensure that ```repository``` is a instance of StartScreenRepository',
      () async {
    expect(repository, isA<StartScreenRepository>());
  });

  test('should change the country', () async {
    const newCountry = Country.colombia;
    repository.switchCountry(newCountry);

    expect(repository.country, newCountry);
  });
}
