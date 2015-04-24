import ddf.minim.*;
Minim minim;
AudioPlayer waltz;
AudioPlayer rumba;
AudioPlayer samba;
AudioPlayer swing;

void setup() {
size(800, 800);
  minim = new Minim(this);
  waltz = minim.loadFile("waltz.mp3", 2048);
  rumba = minim.loadFile("rumba.mp3", 2048);
  samba = minim.loadFile("samba.mp3", 2048);
  swing = minim.loadFile("swing.mp3", 2048);
  
}

void draw() {
	
	
}

void keyPressed() {
	waltz.pause();
	rumba.pause();
	samba.pause();
	swing.pause();

	if (key == '1'){
		waltz.loop();
	}

	if (key == '2'){
		rumba.loop();
	}

	if (key == '3'){
		samba.loop();
	}

	if (key == '4'){
		swing.loop();
	}
}