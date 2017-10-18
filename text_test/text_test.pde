//Font font;
PFont font;
String original_text[];
String temp_text[];
Text[] text = new Text[1000];

class Text {
  String text;
  float X;
  float Y;
  boolean delete;

  Text(String s, float x, float y, boolean d) {
    text = s;
    X = x;
    Y = y;
    delete = d;
  }
}

void setup() {
  size(900, 680 );
  //font = loadFont("SansSerif-48.vlw");
  //textFont(font);
  background(255, 255, 255);
  original_text = loadStrings("list.txt");
  temp_text = split(original_text[0], ' ');

  for (int i=0; i<temp_text.length; i++) {
    text[i] = new Text(temp_text[i], random(0, width), random(0, height), false);
  }
}  

void draw() {
  background(255, 255, 255);
  fill(#FFFFFF);
  for (int i=0; i<temp_text.length; i++) {

    if (text[i].delete == true) {
      fill(255, 255, 255);  
      textSize(20);
      text(text[i].text, text[i].X, text[i].Y);
    } else {
      fill(0, 0, 0);
      textSize(20);
      text(text[i].text, text[i].X, text[i].Y);
    }
  }
}

void mouseDragged() {
  for (int i=0; i<temp_text.length; i++) {
    if (sqrt(sq(text[i].X-mouseX)+sq(text[i].Y-mouseY))<30) {
      text[i].delete = true;
    }
  }
}