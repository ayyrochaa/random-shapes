int hGap = 32;
int wGap = 32;
int[]rad = {3, 4, 5, 6, 7, 8, 35};
int randSize = 16;
int randPos = 6;


void setup(){
  size(1920, 1080);
  background(0);
 smooth();
 for (int j=0; j<=width; j+=wGap){
   for (int i=0, radCntr=0; i<=height; i+=hGap, radCntr++){
     makePoly(j+random (-randPos, randPos), i+randPos, rad[radCntr],
     wGap/2+random(-randSize, randSize), radCntr*.4, MITER);
     if(radCntr>rad.length-2){
       radCntr = 0;
     }
   }
 }
}

void makePoly(float x, float y, int points, float radius,
            float strokeWt, int strokeJn){
   float px=0, py=0;
   float angle = 0;
   
   stroke(random(255), random(255), random(255));
   noFill();
   strokeJoin(strokeJn);
   strokeWeight(strokeWt);
   
   beginShape();
   for (int i=0; i<points; i++){
     px = x+cos(radians(angle))*radius;
     py = y+sin(radians(angle))*radius;
     vertex(px, py);
     angle+=360/points;
   }
   
   endShape(CLOSE);
}
