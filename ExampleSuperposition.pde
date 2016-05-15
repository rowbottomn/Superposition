import g4p_controls.*;
import java.util.ArrayList;

ArrayList <PVector> sin1, sin2, sinSum;  // Two images to load
int numPoints = 10000;
int amp1 = 40;
int amp2 = 40;
float oldFreq1;
float oldFreq2;
float freq1;
float freq2;
float angSpeed1;
float angSpeed2;
float phi1;
float phi2;

void setup() {
  size(1000, 700);
  strokeWeight(2);
  freq1 = 0.5;
  freq2 = 0.5;
  phi1 = 0.;
  phi2 = 0.;
  angSpeed1 = 0;
  angSpeed2=0;
  sin1 = new ArrayList<PVector>();
  sin2 = new ArrayList<PVector>();
  sinSum = new ArrayList<PVector>();
  // Load sin points
  for (int i = 0; i < numPoints ;i++  ){
    sin1.add(new PVector(i*width/numPoints,amp1 *sin(i*freq1+phi1)+height/4.));
    sin2.add(new PVector(i*width/numPoints,amp2 *sin(i*freq2+phi1)+height/2.));
    sinSum.add(new PVector(i*width/numPoints,sin1.get(i).y+sin2.get(i).y));
  }
  createGUI();
}

float oldPos1 ;

float oldPos2;
void draw() {
  background(255);
  
  // Get the position of the img1 scrollbar
  // and convert to a value to display the img1 image 
  
  if ((freq1 != oldFreq1)||(freq2 != oldFreq2)||(angSpeed1!= 0.)){
  //update


    sin1 = new ArrayList<PVector>();
    sin2 = new ArrayList<PVector>();
    sinSum = new ArrayList<PVector>();
   for (int i = 0; i < numPoints ;i++){    
    sin1.add(new PVector(i*width/numPoints,amp1 *sin(i*freq1+phi1+frameCount*angSpeed1)+height/4.)) ;
    sin2.add(new PVector(i*width/numPoints,amp2 *sin(i*freq2+phi2+frameCount*angSpeed2)+height/2.));
    sinSum.add(new PVector(i*width/numPoints,sin1.get(i).y+sin2.get(i).y));
   }   
  }
  //draw
  fill(255);
  ellipse(sin1.get(0).x, sin1.get(0).y, 2, 2);
  ellipse(sin2.get(0).x, sin2.get(0).y, 2, 2);
  ellipse(sinSum.get(0).x, sinSum.get(0).y, 2, 2);

  for (int i = 1; i < sin1.size(); i ++){
    fill(255, 0,0);
    stroke(255, 0,0);
  //  ellipse(sin1.get(i).x, sin1.get(i).y, 1, 1);
    line(sin1.get(i).x, sin1.get(i).y, sin1.get(i-1).x, sin1.get(i-1).y);
      fill(0, 0,255);
    stroke(0, 0,255);

 //   ellipse(sin2.get(i).x, sin2.get(i).y, 1, 1);
    line(sin2.get(i).x, sin2.get(i).y, sin2.get(i-1).x, sin2.get(i-1).y);  
    fill(255, 0,255);
    stroke(255, 0,255);

 //   ellipse(sinSum.get(i).x, sinSum.get(i).y, 1, 1);
    line(sinSum.get(i).x, sinSum.get(i).y, sinSum.get(i-1).x, sinSum.get(i-1).y);  

  }
  
  stroke(0,0,0,130);
  line(0, height/4, width, height/4);
  line(0, height/2, width, height/2);
  line(0, 3*height/4, width, 3*height/4);
    
  oldFreq1 = freq1;
  oldFreq2 = freq2;
}