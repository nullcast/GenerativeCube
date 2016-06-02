import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

class Audio {
  protected int bufferSize = 512;
  protected Minim minim;
  protected AudioInput in;
  
  public float rightSmoothedVol = 0;
  public float leftSmoothedVol = 0;
  
  Audio(int bufferSize) {
    this.bufferSize = bufferSize;
    this.minim = new Minim(this);
    this.in = minim.getLineIn(Minim.STEREO, bufferSize);
  }
  
  public void update(){
    float rightCurVol = 0.0;
    float leftCurVol = 0.0;
    
    int numCounted = 0;
    float right[] = new float[bufferSize];
    float left[] = new float[bufferSize];
    
    for (int i = 0; i < bufferSize; i++){
      right[i] = in.right.get(i);
      rightCurVol += right[i] * right[i];
      left[i] = in.left.get(i);
      leftCurVol += left[i] * left[i];
      numCounted++;
    }
    
    rightCurVol /= (float)numCounted;
    leftCurVol /= (float)numCounted;
    
    rightCurVol = sqrt( rightCurVol );
    leftCurVol = sqrt( leftCurVol );
    
    rightSmoothedVol *= 0.93;
    rightSmoothedVol += 0.07 * rightCurVol * 2.5;
    leftSmoothedVol *= 0.93;
    leftSmoothedVol += 0.07 * leftCurVol * 2.5;
  }
}