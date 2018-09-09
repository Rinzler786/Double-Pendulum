float r1 = 100;
float r2 = 300;
float m1 = 10;
float m2 = 10;
float a1 = PI;
float a2 = PI;
float a1_v = 0.01;
float a2_v = 0.001;

float g = 0;

float px2 = -1;
float py2 = -1;
float px1 = -1;
float py1 = -1;
float cx, cy;

PGraphics canvas;

void setup(){
size(1000,1000);
cx = width/2;
cy = height/2;
canvas = createGraphics(width,height);
canvas.beginDraw();
canvas.background(0);
canvas.endDraw();
}
void draw(){
   float num1 = -g * (2 * m1 + m2) * sin(a1);
   float num2 = -m2 * g * sin(a1);
   float num3 = -2 * sin(a1-a2)*m2;
   float num4 = a2_v * a2_v * r2 + a1_v * a1_v * r1 * cos(a1 - a2);
   float den = r1 * (2 * m1 + m2 - m2 *cos(2*a1 - 2 * a2));
  float a1_a = (num1 + num2 + num3 * num4) / den ;
  
  
  
  num1 = 2*sin(a1-a2);
  num2 = (a1_v*a1_v*r1*(m1+m2));
  num3 = g * (m1 + m2)*cos(a1);
  num4 = a2_v * a2_v * r2 * m2 * cos(a1-a2);
  den = r2 * (2 * m1 + m2 - m2 *cos(2*a1 - 2 * a2));

  float a2_a = (num1 * (num2 + num3 + num4)) / den;
   
  
//background(255);
image(canvas,0,0);
stroke(0);
strokeWeight(2);

translate(cx,cy);

float x1 = r1 * sin(a1);
float y1 = r1 * cos(a1);

float x2 = x1 + r2 * sin(a2);
float y2 = y1 + r2 * cos(a2);
stroke(51);

strokeWeight(5);
line(x1,y1,x2,y2);
line(0,0,x1,y1);
stroke(255,0,0);
fill(255,0,0);
ellipse(x1,y1,m1,m1);

stroke(51);

stroke(0,255,0);
fill(0,255,0);
ellipse(x2 ,y2,m2,m2);





a1_v += a1_a;
a2_v += a2_a;
a1 += a1_v;
a2 += a2_v;


canvas.beginDraw();
canvas.translate(cx,cy);
canvas.strokeWeight(5);
canvas.stroke(0,255,0);
if(frameCount > 1){
canvas.line(px2,py2,x2,y2);
canvas.stroke(255,0,0);
canvas.line(px1,py1,x1,y1);

}
canvas.endDraw();
px2 = x2;
py2 = y2;
px1 = x1;
py1 = y1;
}
