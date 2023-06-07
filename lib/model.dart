// ignore: empty_constructor_bodies

/**                          

{
  "coord": {
    "lon": 10.99,
    "lat": 44.34
  },
  "weather": [
    {
      "id": 501,
      "main": "Rain",
      "description": "moderate rain",
      "icon": "10d"
    }
  ],
  "base": "stations",
  "main": {
    "temp": 298.48,
    "feels_like": 298.74,
    "temp_min": 297.56,
    "temp_max": 300.05,
    "pressure": 1015,
    "humidity": 64,
    "sea_level": 1015,
    "grnd_level": 933
  },
  "visibility": 10000,
  "wind": {
    "speed": 0.62,
    "deg": 349,
    "gust": 1.18
  },
  "rain": {
    "1h": 3.16
  },
  "clouds": {
    "all": 100
  },
  "dt": 1661870592,
  "sys": {
    "type": 2,
    "id": 2075663,
    "country": "IT",
    "sunrise": 1661834187,
    "sunset": 1661882248
  },
  "timezone": 7200,
  "id": 3163858,
  "name": "Zocca",
  "cod": 200
}                        

                         */

class Wheatherinfo {
  final String description;
  final String icon;
  Wheatherinfo({required this.description, required this.icon});
  factory Wheatherinfo.fromjSon(Map<String, dynamic> json) {
    final description = json['description'];
    final icon = json['icon'];
    return Wheatherinfo(description: description, icon: icon);
  }
}

class TempInfo {
  final double temperature;

  TempInfo({required this.temperature});

  factory TempInfo.fromJson(Map<String, dynamic> json) {
    final temperature = json['temp'].toDouble(); // Convert the value to double
    return TempInfo(temperature: temperature);
  }
}

class WeatherInfo {
  final int id;
  final String main;
  final String description;
  final String icon;

  WeatherInfo({
    required this.id,
    required this.main,
    required this.description,
    required this.icon,
  });

  factory WeatherInfo.fromJson(Map<String, dynamic> json) {
    final id = json['id'];
    final main = json['main'];
    final description = json['description'];
    final icon = json['icon'];
    return WeatherInfo(
        id: id, main: main, description: description, icon: icon);
  }
}

class WeatherResponse {
  final String cityName;
  final TempInfo tempInfo;
  final WeatherInfo weatherInfo;

  WeatherResponse(this.cityName, this.tempInfo, this.weatherInfo);

  factory WeatherResponse.fromJson(Map<String, dynamic> json) {
    final cityName = json['name'];

    final tempInfoJson = json['main'];
    final tempInfo = TempInfo.fromJson(tempInfoJson);

    final weatherJson = json['weather'];
    WeatherInfo? weatherInfo;

    if (weatherJson != null && weatherJson is List && weatherJson.isNotEmpty) {
      final weatherInfoJson = weatherJson[0];
      weatherInfo = WeatherInfo.fromJson(weatherInfoJson);
    } else {
      // Handle the case when weather information is not available
      // You can set default values or throw an exception if needed
      // For now, let's set weatherInfo to null
      weatherInfo = null;
    }

    return WeatherResponse(cityName, tempInfo, weatherInfo!);
  }
}
