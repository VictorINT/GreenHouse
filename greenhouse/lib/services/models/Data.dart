class Data {
  late String ?id;
  late String ?temperature;
  late String ?humidity;
  late String ?soil_humidity;
  late String ?datetime;

  Data({
    this.id,
    this.temperature,
    this.humidity,
    this.soil_humidity,
    this.datetime});

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
        id: json["id"],
        temperature: json["temperature"],
        humidity: json["humidity"],
        soil_humidity: json["soil_humidity"],
        datetime: json["timestamp"]
    );
  }
}