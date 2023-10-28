import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class GeolocationService {

  late Position positionLocation;

  Future<Position> getPosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Teste se o serviço de geolocalização está ativado
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) { // Se não ativado
      // Mostrar uma mensagem de erro
      return Future.error('Serviço de GPS está desativado.');
    }

    // Checagem de permissão
    permission = await Geolocator.checkPermission();

    // Se a permissão for negada
    if (permission == LocationPermission.denied) {
      // Requisita a permissão novamente
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('A permissão de acesso à localização foi negada');
      }
    }
    
    if (permission == LocationPermission.deniedForever) { 
      return Future.error('Permissões de localização permanentemente negadas.');
    } 

    // Se chegou até aqui, quer dizer que as permissões foram concedidas
    // Então capturar a posição de acordo com o GPS (Latitude e Longitude)
    return await Geolocator.getCurrentPosition();
  }

  Future<List<Placemark>?> getLocationInfo(Position position) async {
    return await placemarkFromCoordinates(position.latitude, position.longitude);
    /*.then((List<Placemark> placemarks) {
      Placemark place = placemarks[0];
      // Rua: place.street
      // Bairro: place.subLocality
      // Estado: place.administrativeArea
      // Cidade: place.subAdministrativeArea
      // CEP: place.postalCode
      print('${place.street}, ${place.subLocality}, ${place.administrativeArea}, ${place.subAdministrativeArea}, ${place.postalCode}');
      return place;
    });
    return null;*/
  }



}