class Weather {
  final String name;
  final String description;
  final String icon;
  final double temp;

   Weather({
     this.name = '',
     this.description = '',
     this.icon ='',
     this.temp = 0,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      name: json['name'] ?? '', 
      description: json['weather'][0]['description'] ?? '', 
      icon: json['weather'][0]['icon'] ?? '', 
      temp: json['main']['temp'] ?? 0
    );
  }
}

                       

// {
//   "weather": [
//     {
//       "description": "moderate rain",
//       "icon": "10d"
//     }
//   ],
//   "main": {
//     "temp": 298.48,
//   },
//   "name": "Zocca",
// }                        

