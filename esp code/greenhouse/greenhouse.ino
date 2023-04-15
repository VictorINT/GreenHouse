#include <ESP8266WiFi.h>
#include <ESP8266HTTPClient.h>
#include <WiFiClient.h>
#include <HTU21D.h>

const char* ssid = "";
const char* password = "";

const char* serverName = "http://192.168.1.154/home/api.php";

// Create an instance of the HTU21D sensor
HTU21D htu;

float delta_temp, delta_humid;
int delta_soil;

int counter = 0;

void setup() {
  // Initialize the serial connection
  Serial.begin(9600);
  delay(10);

  // Connect to the WiFi network
  Serial.println();
  Serial.println();
  Serial.print("Connecting to ");
  Serial.println(ssid);

  WiFi.begin(ssid, password);

  while (WiFi.status() != WL_CONNECTED) {
    delay(500);
    Serial.print(".");
  }

  Serial.println("");
  Serial.println("WiFi connected");
  Serial.println("IP address: ");
  Serial.println(WiFi.localIP());
  htu.begin();
  if(htu.measure()){
    delta_temp = htu.getTemperature();
    delta_humid = htu.getHumidity();
    int sensorValue = analogRead(A0);  // Read the analog value from sensor
    delta_soil = map(sensorValue, 0, 1023, 255, 0); // map the 10-bit data to 8-bit data
  }
}

void loop() {
  if(htu.measure()){
    float temperature = htu.getTemperature();
    float humidity = htu.getHumidity();
    Serial.print("temperature is: ");
    Serial.println(temperature);
    Serial.print("humidity is: ");
    Serial.println(humidity);

    int sensorValue = analogRead(A0);  // Read the analog value from sensor
    int outputValue = map(sensorValue, 0, 1023, 255, 0); // map the 10-bit data to 8-bit data
    
    Serial.print("Soil humidity: ");
    Serial.print(sensorValue);
    Serial.print(" - ");
    Serial.println(outputValue);
    Serial.println("");

    if(counter > 600 || abs(delta_temp-temperature) > 2.0 || abs(delta_humid-humidity) > 5.0 || abs(delta_soil-outputValue) > 10)
    {
      counter = 0;
      //Check WiFi connection status
      if(WiFi.status()== WL_CONNECTED){
        WiFiClient client;
        HTTPClient http;
        
        http.begin(client, serverName);
    
        http.addHeader("Content-Type", "application/x-www-form-urlencoded");
        // Data to send with HTTP POST
        String httpRequestData = "temperature=" + String(temperature) + "&humidity=" + String(humidity) + "&soil=" + String(outputValue);
        // Send HTTP POST request
        int httpResponseCode = http.POST(httpRequestData);
  
       
        Serial.print("HTTP Response code: ");
        Serial.println(httpResponseCode);
          
        // Free resources
        http.end();
      }
      else {
        Serial.println("WiFi Disconnected");
      }
    }
    delta_temp = temperature;
    delta_humid = humidity;
    delta_soil = outputValue;
  }
  else
  {
    Serial.println("HTU21D sensor is not measuring corectly");
  }
  
  counter++;
  delay(1000);
}
