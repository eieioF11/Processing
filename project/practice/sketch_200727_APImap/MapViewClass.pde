// --------------------------------------------------------
// MapView class (Google Map API)
//
// Member : String latitude
//          String longitude
//          String scale
//          String api_key
//
// Constractor : MapView
//
// Method : void show(String lati, String loni, String scl)
//          String dataSet();
//
//
// Written by Yamasho, 14, June, 2018
// --------------------------------------------------------

class MapView {

  String latitude = null;
  String longitude = null;
  String scale = null;
  private String api_key = "AIzaSyBYBZSWzedZ15FSEclLinqLBN-JVQXvmKI";
  
  MapView () {
    println("This mapView uses Google Map API.");
  }
  
  void show(String lati, String loni, String scl) {
    
    PImage img;
    String url = null;
    
    latitude = lati;
    println("latitude : "+latitude );
    longitude = loni;
    println("longitude : "+longitude );
    scale = scl;
    println("zoom : "+ scale );
    
    url = dataSet();
    
    img = loadImage(url);
    image(img, 0, 0);
  }
  
  String dataSet() {
    String address = null;
    String s1 = "http://maps.googleapis.com/maps/api/staticmap?center=";
    String s2 = ",";
    String s3 = "&zoom=";
    String s4 = "&size=640x640&maptype=roadmap&sensor=false&lang=ja&key=";
    String s5 = "&junk=.jpg";
    StringBuffer buf = new StringBuffer();
  
    buf.append(s1);
    buf.append(latitude);
    buf.append(s2);
    buf.append(longitude);
    buf.append(s3);
    buf.append(scale);
    buf.append(s4);
    buf.append(api_key);
    buf.append(s5);
    
    address = buf.toString();
    return address;
  }
 
}
