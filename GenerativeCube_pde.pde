Cubes[] objects;

float thresh = 0.2;
Audio audio;

void setup() {
  size(1000,500, P3D);
  blendMode(ADD);
  audio = new Audio(512);
  objects = new Cubes[2];
  objects[0] = new Cubes(200, new PVector(100, 0 , 0), new Color(100, 150, 200, 100));
  objects[1] = new Cubes(200, new PVector(-100, 0 , 0), new Color(155, 105, 55, 100));
}

void update(){
  audio.update();
  objects[0].vol = audio.rightSmoothedVol;
  objects[1].vol = audio.leftSmoothedVol;
  if(audio.rightSmoothedVol > thresh) {
    objects[0].dRotate.set(random(0,5),random(0,5),random(0,5));
    objects[0].dSize.set(random(10,10),random(10,10),random(10,10));
  }
  if(audio.leftSmoothedVol > thresh) {
    objects[1].dRotate.set(random(0,5),random(0,5),random(0,5));
    objects[1].dSize.set(random(10,10),random(10,10),random(10,10));
  }
}
 
void draw() {
  update();
  translate(width/2, height/2);
  background(0);
  for(int i=0; i<objects.length; i++)
    objects[i].draw();
}