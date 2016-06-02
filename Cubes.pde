class Cubes {
  public PVector position;
  
  protected Cube[] cubes;
  
  public PVector dRotate = new PVector(1,2,5);
  public PVector dSize = new PVector(10,10,10);
  
  public float vol = 0;
  
  Cubes(int num, PVector position, Color c) {
    this.position = position;
    
    this.cubes = new Cube[num];
    for(int i=0; i<this.cubes.length; i++) {
      cubes[i] = new Cube(new Transform(new PVector(0,0,0), new PVector(0,0,0), new PVector(0,0,0)));
      cubes[i].c.setColor(c.r, c.g, c.b, c.a);
    }
  }
  
  protected void update(){
    for(int i=0; i<this.cubes.length; i++) {
      cubes[i].transform.rotate.x = vol*i*dRotate.x;
      cubes[i].transform.rotate.y = vol*i*dRotate.y;
      cubes[i].transform.rotate.z = vol*i*dRotate.z;
      cubes[i].transform.size.set(50+vol*dSize.x*i,50+vol*dSize.y*i,50+vol*dSize.z*i);
    }
  }
  
  public void draw() {
    strokeWeight(0.5);
    noFill();
    update();
    
    pushMatrix();
    translate(this.position.x, this.position.y);
    for(int i=0; i<this.cubes.length; i++)
      cubes[i].draw();
    popMatrix();
  }
}



 