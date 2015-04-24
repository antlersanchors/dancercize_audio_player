import ddf.minim.*;
import ddf.minim.ugens.*;

Minim minim;

AudioPlayer waltz;
AudioPlayer rumba;
AudioPlayer samba;
AudioPlayer swing;

void setup() {
  minim = new Minim(this);

  waltz = minim.loadFile("waltz.mp3", 2048);
  rumba = minim.loadFile("rumba.mp3", 2048);
  samba = minim.loadFile("samba.mp3", 2048);
  swing = minim.loadFile("swing.mp3", 2048);
  
}

void draw() {
	size(512, 512);

}

void keyPressed() {

	// player.close();
	// minim.stop();
	// super.stop();

	if (key == '1') {
		
		waltz.loop();
	}
	if (key == '2') {
		rumba.play();
	}
	if (key == '3') {
		samba.play();
	}
	if (key == '4') {
		swing.play();
	}
}