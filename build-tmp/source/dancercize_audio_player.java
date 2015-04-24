import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import ddf.minim.*; 
import ddf.minim.ugens.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class dancercize_audio_player extends PApplet {




Minim minim;
AudioOutput out;
SoundWarper soundWarp;

AudioPlayer waltz;
AudioPlayer rumba;
AudioPlayer samba;
AudioPlayer swing;

AudioPlayer player;

class SoundWarper implements AudioListener {
  private float[] left;
  private float[] right;
  
  SoundWarper()
  {
    left = null; 
    right = null;
  }
  
  public synchronized void samples(float[] samp)
  {
    left = samp;
  }
  
  public synchronized void samples(float[] sampL, float[] sampR)
  {
    left = sampL;
    right = sampR;
  }

  
};

class CrushThing implements Instrument {
	BitCrush bitCrush;
	Oscil sineOsc;

	CrushThing() {
		float hiBitRes = 4;
		float crushSampleRate = 512;

	  	bitCrush = new BitCrush(hiBitRes, crushSampleRate);
	}

	public void crush(){

		sineOsc = new Oscil(soundWarp.left.length, 1.0f, Waves.SINE);
		sineOsc.patch(bitCrush);
	
	}

	 // every instrument must have a noteOn( float ) method
  public void noteOn(float dur)
  {
    bitCrush.patch(out);
  }
  
  // every instrument must have a noteOff() method
  public void noteOff()
  {
    bitCrush.unpatch(out);
  }
};

public void setup() {
  minim = new Minim(this);
  soundWarp = new SoundWarper();

  out = minim.getLineOut( Minim.MONO );

  waltz = minim.loadFile("waltz.mp3", 2048);
  rumba = minim.loadFile("rumba.mp3", 2048);
  samba = minim.loadFile("samba.mp3", 2048);
  swing = minim.loadFile("swing.mp3", 2048);
  
}




public void draw() {
	size(512, 512);

}

public void keyPressed() {

	waltz.pause();
	rumba.pause();
	samba.pause();
	swing.pause();

	if (key == '1') {
		
		waltz.loop();
		waltz.addListener(soundWarp);
	}
	if (key == '2') {
		rumba.loop();
	}
	if (key == '3') {
		samba.loop();
	}
	if (key == '4') {
		swing.loop();
	}
}
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "dancercize_audio_player" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
