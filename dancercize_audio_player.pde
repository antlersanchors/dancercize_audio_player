import ddf.minim.*;
import ddf.minim.ugens.*;

Minim minim;

AudioPlayer waltz;
AudioPlayer rumba;
AudioPlayer samba;
AudioPlayer swing;

AudioPlayer player;

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

	waltz.pause();
	rumba.pause();
	samba.pause();
	swing.pause();

	if (key == '1') {
		
		waltz.loop();
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