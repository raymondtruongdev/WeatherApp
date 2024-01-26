var data_hochiminh = {
  "coord": {"lon": 106.6978, "lat": 10.7726},
  "weather": [
    {"id": 801, "main": "Clouds", "description": "few clouds", "icon": "02n"}
  ],
  "base": "stations",
  "main": {
    "temp": 25.97,
    "feels_like": 25.97,
    "temp_min": 25.97,
    "temp_max": 25.97,
    "pressure": 1017,
    "humidity": 69
  },
  "visibility": 10000,
  "wind": {"speed": 2.06, "deg": 100},
  "clouds": {"all": 20},
  "dt": 1706290563,
  "sys": {
    "type": 1,
    "id": 9314,
    "country": "VN",
    "sunrise": 1706311008,
    "sunset": 1706352867
  },
  "timezone": 25200,
  "id": 1566083,
  "name": "Ho Chi Minh City",
  "cod": 200
};

var data_usa = {
  "coord": {"lon": -122.084, "lat": 37.422},
  "weather": [
    {
      "id": 802,
      "main": "Clouds",
      "description": "scattered clouds",
      "icon": "03n"
    }
  ],
  "base": "stations",
  "main": {
    "temp": 9.71,
    "feels_like": 9.71,
    "temp_min": 8.09,
    "temp_max": 12.25,
    "pressure": 1023,
    "humidity": 88
  },
  "visibility": 10000,
  "wind": {"speed": 0.45, "deg": 171, "gust": 1.79},
  "clouds": {"all": 40},
  "dt": 1706259250,
  "sys": {
    "type": 2,
    "id": 2010364,
    "country": "US",
    "sunrise": 1706282183,
    "sunset": 1706318697
  },
  "timezone": -28800,
  "id": 5375480,
  "name": "Mountain View",
  "cod": 200
};

var dataForcast_usa = {
  "cod": "200",
  "message": 0,
  "cnt": 40,
  "list": [
    {
      "dt": 1706259600,
      "main": {
        "temp": 9.68,
        "feels_like": 9.68,
        "temp_min": 9.68,
        "temp_max": 11.32,
        "pressure": 1023,
        "sea_level": 1023,
        "grnd_level": 1024,
        "humidity": 88,
        "temp_kf": -1.64
      },
      "weather": [
        {
          "id": 802,
          "main": "Clouds",
          "description": "scattered clouds",
          "icon": "03n"
        }
      ],
      "clouds": {"all": 40},
      "wind": {"speed": 1.17, "deg": 100, "gust": 1.34},
      "visibility": 10000,
      "pop": 0,
      "sys": {"pod": "n"},
      "dt_txt": "2024-01-26 09:00:00"
    },
    {
      "dt": 1706270400,
      "main": {
        "temp": 9.91,
        "feels_like": 9.91,
        "temp_min": 9.91,
        "temp_max": 10.36,
        "pressure": 1023,
        "sea_level": 1023,
        "grnd_level": 1024,
        "humidity": 85,
        "temp_kf": -0.45
      },
      "weather": [
        {
          "id": 802,
          "main": "Clouds",
          "description": "scattered clouds",
          "icon": "03n"
        }
      ],
      "clouds": {"all": 49},
      "wind": {"speed": 0.48, "deg": 87, "gust": 0.65},
      "visibility": 10000,
      "pop": 0,
      "sys": {"pod": "n"},
      "dt_txt": "2024-01-26 12:00:00"
    },
    {
      "dt": 1706281200,
      "main": {
        "temp": 10.16,
        "feels_like": 9.24,
        "temp_min": 10.16,
        "temp_max": 10.4,
        "pressure": 1024,
        "sea_level": 1024,
        "grnd_level": 1025,
        "humidity": 77,
        "temp_kf": -0.24
      },
      "weather": [
        {
          "id": 803,
          "main": "Clouds",
          "description": "broken clouds",
          "icon": "04n"
        }
      ],
      "clouds": {"all": 79},
      "wind": {"speed": 1.27, "deg": 114, "gust": 1.38},
      "visibility": 10000,
      "pop": 0,
      "sys": {"pod": "n"},
      "dt_txt": "2024-01-26 15:00:00"
    },
    {
      "dt": 1706292000,
      "main": {
        "temp": 13.91,
        "feels_like": 12.79,
        "temp_min": 13.91,
        "temp_max": 13.91,
        "pressure": 1026,
        "sea_level": 1026,
        "grnd_level": 1025,
        "humidity": 55,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 804,
          "main": "Clouds",
          "description": "overcast clouds",
          "icon": "04d"
        }
      ],
      "clouds": {"all": 99},
      "wind": {"speed": 0.82, "deg": 26, "gust": 1.13},
      "visibility": 10000,
      "pop": 0,
      "sys": {"pod": "d"},
      "dt_txt": "2024-01-26 18:00:00"
    },
    {
      "dt": 1706302800,
      "main": {
        "temp": 17.02,
        "feels_like": 15.95,
        "temp_min": 17.02,
        "temp_max": 17.02,
        "pressure": 1025,
        "sea_level": 1025,
        "grnd_level": 1024,
        "humidity": 45,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 804,
          "main": "Clouds",
          "description": "overcast clouds",
          "icon": "04d"
        }
      ],
      "clouds": {"all": 100},
      "wind": {"speed": 0.84, "deg": 5, "gust": 0.98},
      "visibility": 10000,
      "pop": 0,
      "sys": {"pod": "d"},
      "dt_txt": "2024-01-26 21:00:00"
    },
    {
      "dt": 1706313600,
      "main": {
        "temp": 16.41,
        "feels_like": 15.49,
        "temp_min": 16.41,
        "temp_max": 16.41,
        "pressure": 1025,
        "sea_level": 1025,
        "grnd_level": 1025,
        "humidity": 53,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 804,
          "main": "Clouds",
          "description": "overcast clouds",
          "icon": "04d"
        }
      ],
      "clouds": {"all": 100},
      "wind": {"speed": 1.15, "deg": 345, "gust": 1.95},
      "visibility": 10000,
      "pop": 0,
      "sys": {"pod": "d"},
      "dt_txt": "2024-01-27 00:00:00"
    },
    {
      "dt": 1706324400,
      "main": {
        "temp": 13.74,
        "feels_like": 12.74,
        "temp_min": 13.74,
        "temp_max": 13.74,
        "pressure": 1026,
        "sea_level": 1026,
        "grnd_level": 1025,
        "humidity": 60,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 804,
          "main": "Clouds",
          "description": "overcast clouds",
          "icon": "04n"
        }
      ],
      "clouds": {"all": 100},
      "wind": {"speed": 0.62, "deg": 93, "gust": 0.78},
      "visibility": 10000,
      "pop": 0,
      "sys": {"pod": "n"},
      "dt_txt": "2024-01-27 03:00:00"
    },
    {
      "dt": 1706335200,
      "main": {
        "temp": 13.03,
        "feels_like": 12.09,
        "temp_min": 13.03,
        "temp_max": 13.03,
        "pressure": 1026,
        "sea_level": 1026,
        "grnd_level": 1026,
        "humidity": 65,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 804,
          "main": "Clouds",
          "description": "overcast clouds",
          "icon": "04n"
        }
      ],
      "clouds": {"all": 100},
      "wind": {"speed": 0.96, "deg": 96, "gust": 1.04},
      "visibility": 10000,
      "pop": 0,
      "sys": {"pod": "n"},
      "dt_txt": "2024-01-27 06:00:00"
    },
    {
      "dt": 1706346000,
      "main": {
        "temp": 12.75,
        "feels_like": 11.88,
        "temp_min": 12.75,
        "temp_max": 12.75,
        "pressure": 1026,
        "sea_level": 1026,
        "grnd_level": 1026,
        "humidity": 69,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 804,
          "main": "Clouds",
          "description": "overcast clouds",
          "icon": "04n"
        }
      ],
      "clouds": {"all": 100},
      "wind": {"speed": 0.68, "deg": 48, "gust": 0.76},
      "visibility": 10000,
      "pop": 0,
      "sys": {"pod": "n"},
      "dt_txt": "2024-01-27 09:00:00"
    },
    {
      "dt": 1706356800,
      "main": {
        "temp": 12.5,
        "feels_like": 11.69,
        "temp_min": 12.5,
        "temp_max": 12.5,
        "pressure": 1025,
        "sea_level": 1025,
        "grnd_level": 1025,
        "humidity": 72,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 804,
          "main": "Clouds",
          "description": "overcast clouds",
          "icon": "04n"
        }
      ],
      "clouds": {"all": 100},
      "wind": {"speed": 0.56, "deg": 36, "gust": 0.72},
      "visibility": 10000,
      "pop": 0,
      "sys": {"pod": "n"},
      "dt_txt": "2024-01-27 12:00:00"
    },
    {
      "dt": 1706367600,
      "main": {
        "temp": 12.1,
        "feels_like": 11.32,
        "temp_min": 12.1,
        "temp_max": 12.1,
        "pressure": 1026,
        "sea_level": 1026,
        "grnd_level": 1025,
        "humidity": 75,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 804,
          "main": "Clouds",
          "description": "overcast clouds",
          "icon": "04n"
        }
      ],
      "clouds": {"all": 100},
      "wind": {"speed": 0.77, "deg": 70, "gust": 0.83},
      "visibility": 10000,
      "pop": 0,
      "sys": {"pod": "n"},
      "dt_txt": "2024-01-27 15:00:00"
    },
    {
      "dt": 1706378400,
      "main": {
        "temp": 15.37,
        "feels_like": 14.63,
        "temp_min": 15.37,
        "temp_max": 15.37,
        "pressure": 1026,
        "sea_level": 1026,
        "grnd_level": 1025,
        "humidity": 64,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 804,
          "main": "Clouds",
          "description": "overcast clouds",
          "icon": "04d"
        }
      ],
      "clouds": {"all": 100},
      "wind": {"speed": 1.04, "deg": 348, "gust": 1.47},
      "visibility": 10000,
      "pop": 0,
      "sys": {"pod": "d"},
      "dt_txt": "2024-01-27 18:00:00"
    },
    {
      "dt": 1706389200,
      "main": {
        "temp": 18.55,
        "feels_like": 17.9,
        "temp_min": 18.55,
        "temp_max": 18.55,
        "pressure": 1024,
        "sea_level": 1024,
        "grnd_level": 1023,
        "humidity": 55,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 804,
          "main": "Clouds",
          "description": "overcast clouds",
          "icon": "04d"
        }
      ],
      "clouds": {"all": 100},
      "wind": {"speed": 0.87, "deg": 4, "gust": 1.43},
      "visibility": 10000,
      "pop": 0,
      "sys": {"pod": "d"},
      "dt_txt": "2024-01-27 21:00:00"
    },
    {
      "dt": 1706400000,
      "main": {
        "temp": 17.69,
        "feels_like": 17.19,
        "temp_min": 17.69,
        "temp_max": 17.69,
        "pressure": 1023,
        "sea_level": 1023,
        "grnd_level": 1023,
        "humidity": 64,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 804,
          "main": "Clouds",
          "description": "overcast clouds",
          "icon": "04d"
        }
      ],
      "clouds": {"all": 100},
      "wind": {"speed": 1.51, "deg": 351, "gust": 2.68},
      "visibility": 10000,
      "pop": 0,
      "sys": {"pod": "d"},
      "dt_txt": "2024-01-28 00:00:00"
    },
    {
      "dt": 1706410800,
      "main": {
        "temp": 15.34,
        "feels_like": 14.81,
        "temp_min": 15.34,
        "temp_max": 15.34,
        "pressure": 1024,
        "sea_level": 1024,
        "grnd_level": 1024,
        "humidity": 72,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 804,
          "main": "Clouds",
          "description": "overcast clouds",
          "icon": "04n"
        }
      ],
      "clouds": {"all": 100},
      "wind": {"speed": 0.85, "deg": 31, "gust": 1.32},
      "visibility": 10000,
      "pop": 0,
      "sys": {"pod": "n"},
      "dt_txt": "2024-01-28 03:00:00"
    },
    {
      "dt": 1706421600,
      "main": {
        "temp": 15.18,
        "feels_like": 14.63,
        "temp_min": 15.18,
        "temp_max": 15.18,
        "pressure": 1023,
        "sea_level": 1023,
        "grnd_level": 1023,
        "humidity": 72,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 804,
          "main": "Clouds",
          "description": "overcast clouds",
          "icon": "04n"
        }
      ],
      "clouds": {"all": 100},
      "wind": {"speed": 0.97, "deg": 94, "gust": 1.48},
      "visibility": 10000,
      "pop": 0,
      "sys": {"pod": "n"},
      "dt_txt": "2024-01-28 06:00:00"
    },
    {
      "dt": 1706432400,
      "main": {
        "temp": 14.66,
        "feels_like": 14.11,
        "temp_min": 14.66,
        "temp_max": 14.66,
        "pressure": 1022,
        "sea_level": 1022,
        "grnd_level": 1022,
        "humidity": 74,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 804,
          "main": "Clouds",
          "description": "overcast clouds",
          "icon": "04n"
        }
      ],
      "clouds": {"all": 99},
      "wind": {"speed": 0.67, "deg": 308, "gust": 1.06},
      "visibility": 10000,
      "pop": 0,
      "sys": {"pod": "n"},
      "dt_txt": "2024-01-28 09:00:00"
    },
    {
      "dt": 1706443200,
      "main": {
        "temp": 13.55,
        "feels_like": 13.08,
        "temp_min": 13.55,
        "temp_max": 13.55,
        "pressure": 1022,
        "sea_level": 1022,
        "grnd_level": 1022,
        "humidity": 81,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 804,
          "main": "Clouds",
          "description": "overcast clouds",
          "icon": "04n"
        }
      ],
      "clouds": {"all": 98},
      "wind": {"speed": 0.89, "deg": 7, "gust": 1.25},
      "visibility": 10000,
      "pop": 0,
      "sys": {"pod": "n"},
      "dt_txt": "2024-01-28 12:00:00"
    },
    {
      "dt": 1706454000,
      "main": {
        "temp": 13.18,
        "feels_like": 12.72,
        "temp_min": 13.18,
        "temp_max": 13.18,
        "pressure": 1022,
        "sea_level": 1022,
        "grnd_level": 1021,
        "humidity": 83,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 804,
          "main": "Clouds",
          "description": "overcast clouds",
          "icon": "04n"
        }
      ],
      "clouds": {"all": 98},
      "wind": {"speed": 1.06, "deg": 39, "gust": 1.14},
      "visibility": 10000,
      "pop": 0,
      "sys": {"pod": "n"},
      "dt_txt": "2024-01-28 15:00:00"
    },
    {
      "dt": 1706464800,
      "main": {
        "temp": 16.71,
        "feels_like": 16.21,
        "temp_min": 16.71,
        "temp_max": 16.71,
        "pressure": 1021,
        "sea_level": 1021,
        "grnd_level": 1021,
        "humidity": 68,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 804,
          "main": "Clouds",
          "description": "overcast clouds",
          "icon": "04d"
        }
      ],
      "clouds": {"all": 98},
      "wind": {"speed": 1.19, "deg": 39, "gust": 2.04},
      "visibility": 10000,
      "pop": 0,
      "sys": {"pod": "d"},
      "dt_txt": "2024-01-28 18:00:00"
    },
    {
      "dt": 1706475600,
      "main": {
        "temp": 20.55,
        "feels_like": 20.12,
        "temp_min": 20.55,
        "temp_max": 20.55,
        "pressure": 1020,
        "sea_level": 1020,
        "grnd_level": 1019,
        "humidity": 56,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 804,
          "main": "Clouds",
          "description": "overcast clouds",
          "icon": "04d"
        }
      ],
      "clouds": {"all": 100},
      "wind": {"speed": 1.38, "deg": 41, "gust": 2.8},
      "visibility": 10000,
      "pop": 0,
      "sys": {"pod": "d"},
      "dt_txt": "2024-01-28 21:00:00"
    },
    {
      "dt": 1706486400,
      "main": {
        "temp": 20.99,
        "feels_like": 20.69,
        "temp_min": 20.99,
        "temp_max": 20.99,
        "pressure": 1018,
        "sea_level": 1018,
        "grnd_level": 1018,
        "humidity": 59,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 804,
          "main": "Clouds",
          "description": "overcast clouds",
          "icon": "04d"
        }
      ],
      "clouds": {"all": 92},
      "wind": {"speed": 1.23, "deg": 39, "gust": 1.92},
      "visibility": 10000,
      "pop": 0,
      "sys": {"pod": "d"},
      "dt_txt": "2024-01-29 00:00:00"
    },
    {
      "dt": 1706497200,
      "main": {
        "temp": 17.01,
        "feels_like": 16.65,
        "temp_min": 17.01,
        "temp_max": 17.01,
        "pressure": 1019,
        "sea_level": 1019,
        "grnd_level": 1019,
        "humidity": 72,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 804,
          "main": "Clouds",
          "description": "overcast clouds",
          "icon": "04n"
        }
      ],
      "clouds": {"all": 97},
      "wind": {"speed": 1.02, "deg": 25, "gust": 1.05},
      "visibility": 10000,
      "pop": 0,
      "sys": {"pod": "n"},
      "dt_txt": "2024-01-29 03:00:00"
    },
    {
      "dt": 1706508000,
      "main": {
        "temp": 15.85,
        "feels_like": 15.48,
        "temp_min": 15.85,
        "temp_max": 15.85,
        "pressure": 1020,
        "sea_level": 1020,
        "grnd_level": 1019,
        "humidity": 76,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 804,
          "main": "Clouds",
          "description": "overcast clouds",
          "icon": "04n"
        }
      ],
      "clouds": {"all": 99},
      "wind": {"speed": 0.86, "deg": 87, "gust": 0.94},
      "visibility": 10000,
      "pop": 0,
      "sys": {"pod": "n"},
      "dt_txt": "2024-01-29 06:00:00"
    },
    {
      "dt": 1706518800,
      "main": {
        "temp": 15.12,
        "feels_like": 14.72,
        "temp_min": 15.12,
        "temp_max": 15.12,
        "pressure": 1019,
        "sea_level": 1019,
        "grnd_level": 1018,
        "humidity": 78,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 804,
          "main": "Clouds",
          "description": "overcast clouds",
          "icon": "04n"
        }
      ],
      "clouds": {"all": 100},
      "wind": {"speed": 0.56, "deg": 79, "gust": 0.75},
      "visibility": 10000,
      "pop": 0,
      "sys": {"pod": "n"},
      "dt_txt": "2024-01-29 09:00:00"
    },
    {
      "dt": 1706529600,
      "main": {
        "temp": 14.44,
        "feels_like": 14,
        "temp_min": 14.44,
        "temp_max": 14.44,
        "pressure": 1018,
        "sea_level": 1018,
        "grnd_level": 1018,
        "humidity": 79,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 804,
          "main": "Clouds",
          "description": "overcast clouds",
          "icon": "04n"
        }
      ],
      "clouds": {"all": 96},
      "wind": {"speed": 0.82, "deg": 97, "gust": 0.99},
      "visibility": 10000,
      "pop": 0,
      "sys": {"pod": "n"},
      "dt_txt": "2024-01-29 12:00:00"
    },
    {
      "dt": 1706540400,
      "main": {
        "temp": 13.83,
        "feels_like": 13.33,
        "temp_min": 13.83,
        "temp_max": 13.83,
        "pressure": 1019,
        "sea_level": 1019,
        "grnd_level": 1018,
        "humidity": 79,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 803,
          "main": "Clouds",
          "description": "broken clouds",
          "icon": "04n"
        }
      ],
      "clouds": {"all": 72},
      "wind": {"speed": 0.4, "deg": 112, "gust": 0.83},
      "visibility": 10000,
      "pop": 0,
      "sys": {"pod": "n"},
      "dt_txt": "2024-01-29 15:00:00"
    },
    {
      "dt": 1706551200,
      "main": {
        "temp": 18.44,
        "feels_like": 17.93,
        "temp_min": 18.44,
        "temp_max": 18.44,
        "pressure": 1019,
        "sea_level": 1019,
        "grnd_level": 1019,
        "humidity": 61,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 802,
          "main": "Clouds",
          "description": "scattered clouds",
          "icon": "03d"
        }
      ],
      "clouds": {"all": 48},
      "wind": {"speed": 0.83, "deg": 100, "gust": 1.28},
      "visibility": 10000,
      "pop": 0,
      "sys": {"pod": "d"},
      "dt_txt": "2024-01-29 18:00:00"
    },
    {
      "dt": 1706562000,
      "main": {
        "temp": 22.2,
        "feels_like": 21.76,
        "temp_min": 22.2,
        "temp_max": 22.2,
        "pressure": 1018,
        "sea_level": 1018,
        "grnd_level": 1018,
        "humidity": 49,
        "temp_kf": 0
      },
      "weather": [
        {"id": 800, "main": "Clear", "description": "clear sky", "icon": "01d"}
      ],
      "clouds": {"all": 6},
      "wind": {"speed": 0.77, "deg": 315, "gust": 0.92},
      "visibility": 10000,
      "pop": 0,
      "sys": {"pod": "d"},
      "dt_txt": "2024-01-29 21:00:00"
    },
    {
      "dt": 1706572800,
      "main": {
        "temp": 21.49,
        "feels_like": 21.1,
        "temp_min": 21.49,
        "temp_max": 21.49,
        "pressure": 1017,
        "sea_level": 1017,
        "grnd_level": 1017,
        "humidity": 54,
        "temp_kf": 0
      },
      "weather": [
        {"id": 800, "main": "Clear", "description": "clear sky", "icon": "01d"}
      ],
      "clouds": {"all": 4},
      "wind": {"speed": 1.37, "deg": 302, "gust": 1.91},
      "visibility": 10000,
      "pop": 0,
      "sys": {"pod": "d"},
      "dt_txt": "2024-01-30 00:00:00"
    },
    {
      "dt": 1706583600,
      "main": {
        "temp": 16.84,
        "feels_like": 16.38,
        "temp_min": 16.84,
        "temp_max": 16.84,
        "pressure": 1019,
        "sea_level": 1019,
        "grnd_level": 1018,
        "humidity": 69,
        "temp_kf": 0
      },
      "weather": [
        {"id": 800, "main": "Clear", "description": "clear sky", "icon": "01n"}
      ],
      "clouds": {"all": 1},
      "wind": {"speed": 0.37, "deg": 301, "gust": 0.75},
      "visibility": 10000,
      "pop": 0,
      "sys": {"pod": "n"},
      "dt_txt": "2024-01-30 03:00:00"
    },
    {
      "dt": 1706594400,
      "main": {
        "temp": 15.48,
        "feels_like": 14.96,
        "temp_min": 15.48,
        "temp_max": 15.48,
        "pressure": 1019,
        "sea_level": 1019,
        "grnd_level": 1019,
        "humidity": 72,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 801,
          "main": "Clouds",
          "description": "few clouds",
          "icon": "02n"
        }
      ],
      "clouds": {"all": 12},
      "wind": {"speed": 0.77, "deg": 136, "gust": 0.8},
      "visibility": 10000,
      "pop": 0,
      "sys": {"pod": "n"},
      "dt_txt": "2024-01-30 06:00:00"
    },
    {
      "dt": 1706605200,
      "main": {
        "temp": 15.1,
        "feels_like": 14.6,
        "temp_min": 15.1,
        "temp_max": 15.1,
        "pressure": 1018,
        "sea_level": 1018,
        "grnd_level": 1018,
        "humidity": 74,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 804,
          "main": "Clouds",
          "description": "overcast clouds",
          "icon": "04n"
        }
      ],
      "clouds": {"all": 89},
      "wind": {"speed": 1.21, "deg": 157, "gust": 1.33},
      "visibility": 10000,
      "pop": 0,
      "sys": {"pod": "n"},
      "dt_txt": "2024-01-30 09:00:00"
    },
    {
      "dt": 1706616000,
      "main": {
        "temp": 14.36,
        "feels_like": 13.76,
        "temp_min": 14.36,
        "temp_max": 14.36,
        "pressure": 1019,
        "sea_level": 1019,
        "grnd_level": 1018,
        "humidity": 73,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 804,
          "main": "Clouds",
          "description": "overcast clouds",
          "icon": "04n"
        }
      ],
      "clouds": {"all": 91},
      "wind": {"speed": 1.39, "deg": 296, "gust": 1.48},
      "visibility": 10000,
      "pop": 0,
      "sys": {"pod": "n"},
      "dt_txt": "2024-01-30 12:00:00"
    },
    {
      "dt": 1706626800,
      "main": {
        "temp": 13.93,
        "feels_like": 13.39,
        "temp_min": 13.93,
        "temp_max": 13.93,
        "pressure": 1019,
        "sea_level": 1019,
        "grnd_level": 1018,
        "humidity": 77,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 804,
          "main": "Clouds",
          "description": "overcast clouds",
          "icon": "04n"
        }
      ],
      "clouds": {"all": 100},
      "wind": {"speed": 0.92, "deg": 121, "gust": 1.19},
      "visibility": 10000,
      "pop": 0,
      "sys": {"pod": "n"},
      "dt_txt": "2024-01-30 15:00:00"
    },
    {
      "dt": 1706637600,
      "main": {
        "temp": 17.68,
        "feels_like": 17.23,
        "temp_min": 17.68,
        "temp_max": 17.68,
        "pressure": 1018,
        "sea_level": 1018,
        "grnd_level": 1018,
        "humidity": 66,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 804,
          "main": "Clouds",
          "description": "overcast clouds",
          "icon": "04d"
        }
      ],
      "clouds": {"all": 100},
      "wind": {"speed": 1.08, "deg": 141, "gust": 1.89},
      "visibility": 10000,
      "pop": 0,
      "sys": {"pod": "d"},
      "dt_txt": "2024-01-30 18:00:00"
    },
    {
      "dt": 1706648400,
      "main": {
        "temp": 21.73,
        "feels_like": 21.29,
        "temp_min": 21.73,
        "temp_max": 21.73,
        "pressure": 1016,
        "sea_level": 1016,
        "grnd_level": 1016,
        "humidity": 51,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 803,
          "main": "Clouds",
          "description": "broken clouds",
          "icon": "04d"
        }
      ],
      "clouds": {"all": 79},
      "wind": {"speed": 0.55, "deg": 146, "gust": 1.73},
      "visibility": 10000,
      "pop": 0,
      "sys": {"pod": "d"},
      "dt_txt": "2024-01-30 21:00:00"
    },
    {
      "dt": 1706659200,
      "main": {
        "temp": 20.93,
        "feels_like": 20.54,
        "temp_min": 20.93,
        "temp_max": 20.93,
        "pressure": 1015,
        "sea_level": 1015,
        "grnd_level": 1015,
        "humidity": 56,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 804,
          "main": "Clouds",
          "description": "overcast clouds",
          "icon": "04d"
        }
      ],
      "clouds": {"all": 90},
      "wind": {"speed": 0.88, "deg": 247, "gust": 2},
      "visibility": 10000,
      "pop": 0,
      "sys": {"pod": "d"},
      "dt_txt": "2024-01-31 00:00:00"
    },
    {
      "dt": 1706670000,
      "main": {
        "temp": 16.27,
        "feels_like": 15.65,
        "temp_min": 16.27,
        "temp_max": 16.27,
        "pressure": 1016,
        "sea_level": 1016,
        "grnd_level": 1016,
        "humidity": 65,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 804,
          "main": "Clouds",
          "description": "overcast clouds",
          "icon": "04n"
        }
      ],
      "clouds": {"all": 100},
      "wind": {"speed": 1.21, "deg": 230, "gust": 1.53},
      "visibility": 10000,
      "pop": 0,
      "sys": {"pod": "n"},
      "dt_txt": "2024-01-31 03:00:00"
    },
    {
      "dt": 1706680800,
      "main": {
        "temp": 14.81,
        "feels_like": 14.02,
        "temp_min": 14.81,
        "temp_max": 14.81,
        "pressure": 1017,
        "sea_level": 1017,
        "grnd_level": 1016,
        "humidity": 64,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 804,
          "main": "Clouds",
          "description": "overcast clouds",
          "icon": "04n"
        }
      ],
      "clouds": {"all": 98},
      "wind": {"speed": 2.31, "deg": 144, "gust": 3.68},
      "visibility": 10000,
      "pop": 0,
      "sys": {"pod": "n"},
      "dt_txt": "2024-01-31 06:00:00"
    }
  ],
  "city": {
    "id": 5375480,
    "name": "Mountain View",
    "coord": {"lat": 37.422, "lon": -122.084},
    "country": "US",
    "population": 74066,
    "timezone": -28800,
    "sunrise": 1706282183,
    "sunset": 1706318697
  }
};
