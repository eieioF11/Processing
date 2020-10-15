String baseURL = "http://weather.livedoor.com/forecast/webservice/json/v1?city=";
//String city = "130010"; //Tokyo
//String city = "471010"; //Naha
//String city = "011000"; //Wakkanai
//String city = "017010";//hakodate
String city = "150010";//nigata
String title;
JSONArray forecasts;
String dmax, dmin, date = "";
int tmax = 0;

void setup(){
  size(300, 200);
  colorMode(HSB, 360, 100, 100);
  PFont font = createFont("MS Gothic",25,true);
  textFont(font); 
  
  JSONObject w = loadJSONObject(baseURL + city);
  println(baseURL+city);
  title = w.getString("title");
  forecasts = w.getJSONArray("forecasts");
}
void draw(){
  fill(-5*tmax+200, 100, 100);
  rect(0, 0, width, height);

  fill(0);
  textSize(25);
  textAlign(CENTER);
  text(title, 150, 60);
  textSize(15);
  text(date, 80, 30); 
  
  for(int i = 0; i < forecasts.size(); i++){
    JSONObject f = forecasts.getJSONObject(i);
    date = f.getString("date");
 
    String s = f.getString("dateLabel") + ":" + f.getString("telop");
    JSONObject t = f.getJSONObject("temperature");
    if(!t.isNull("min")){
      dmin = t.getJSONObject("min").getString("celsius");
      s = s + ", min:" + dmin;
    }
    if(!t.isNull("max")){
      dmax = t.getJSONObject("max").getString("celsius");
      s = s + ", max:" + dmax;
    }
    text(s, 150, 100+25*i);
    if( tmax <= int(dmax) ) {
      tmax = int(dmax);
    }
  }
}
