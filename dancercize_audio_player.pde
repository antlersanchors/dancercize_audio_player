import ddf.minim.*;
import ddf.minim.ugens.*;

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
  
  synchronized void samples(float[] samp)
  {
    left = samp;
  }
  
  synchronized void samples(float[] sampL, float[] sampR)
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

	void crush(){

		sineOsc = new Oscil(soundWarp.left.length, 1.0, Waves.SINE);
		sineOsc.patch(bitCrush);
	
	}

	 // every instrument must have a noteOn( float ) method
  void noteOn(float dur)
  {
    bitCrush.patch(out);
  }
  
  // every instrument must have a noteOff() method
  void noteOff()
  {
    bitCrush.unpatch(out);
  }
};

void setup() {
  minim = new Minim(this);
  soundWarp = new SoundWarper();

  out = minim.getLineOut( Minim.MONO );

  waltz = minim.loadFile("waltz.mp3", 2048);
  rumba = minim.loadFile("rumba.mp3", 2048);
  samba = minim.loadFile("samba.mp3", 2048);
  swing = minim.loadFile("swing.mp3", 2048);
  
}




void draw() {
	size(512, 512);

}

void keyPressed() {

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