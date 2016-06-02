class Cube {
  public Transform transform;
  public Color c;
  
  Cube(Transform transform) {
    this.transform = transform;
    this.c = new Color(255, 255, 255, 255);
  }
  
  void draw() {
    pushMatrix();
    stroke(c.getColor());
    strokeWeight(0.5);
    rotateX(this.transform.rotate.x);
    rotateY(this.transform.rotate.y);
    rotateZ(this.transform.rotate.z);
    translate(this.transform.position.x, this.transform.position.y, this.transform.position.z);
    noFill();
    box(this.transform.size.x, this.transform.size.y, this.transform.size.z);
    popMatrix();
  }
}