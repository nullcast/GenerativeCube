class Transform {
  public PVector position;
  public PVector rotate;
  public PVector size;
  
  Transform(PVector position, PVector rotate, PVector size) {
    this.position = position;
    this.rotate = rotate;
    this.size = size;
  }
}

class Color {
  protected int r;
  protected int g;
  protected int b;
  protected int a;
  
  protected color c;
  
  Color(int r, int g, int b, int a) {
    this.setColor(r, g, b, a);
  }
  
  public void setColor(int r, int g, int b, int a) {
    this.r = r;
    this.g = g;
    this.b = b;
    this.a = a;
    c = color(this.r, this.g, this.b, this.a);
  }
  
  public int getR(){return this.r;}
  public int getG(){return this.g;}
  public int getB(){return this.b;}
  public int getA(){return this.a;}
  public color getColor(){return this.c;}
}