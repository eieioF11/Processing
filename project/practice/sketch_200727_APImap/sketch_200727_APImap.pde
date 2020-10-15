MapView TMCmap;     //MapView class
PImage mapImage;    //Image

float mapCenterLat=35.7345;  //Latitude
float mapCenterLon=139.8095;  //Longitude
int zoomLevel=18;

String mapLat = null;
String mapLon = null;
String zoom = null;
int flag=0;

void setup() {
  size(640, 640); 
  TMCmap=new MapView();

  mapLat = String.valueOf(mapCenterLat);
  mapLon = String.valueOf(mapCenterLon);
  zoom = String.valueOf(zoomLevel);
  TMCmap.show(mapLat,mapLon,zoom);
}

void draw() 
{
  if(flag==1)
  {
    mapLat=String.valueOf(mapCenterLat);
    mapLon=String.valueOf(mapCenterLon);
    zoom=String.valueOf(zoomLevel);
    TMCmap.show(mapLat,mapLon,zoom);
  }
}

void keyPressed() 
{
  flag=1;
  if (key == 'q' || key == 'Q' ) {
  exit();
  }
  if(keyCode==RIGHT)
    mapCenterLon+=0.002;
  else if(keyCode==LEFT)
    mapCenterLon-=0.002;
  if(keyCode==UP)
    mapCenterLat+=0.002;
  else if(keyCode==DOWN)
    mapCenterLat-=0.002;
  switch(key)
  {
    case 'u':zoomLevel+=1;break;
    case 'd':zoomLevel-=1;break;
  }
}
