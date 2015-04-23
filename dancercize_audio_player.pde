import ddf.minim.*;
import ddf.minim.ugens.*;

Minim minim;

ArrayList<AudioPlayer> players = new ArrayList<AudioPlayer>();

AudioPlayer waltz;
AudioPlayer rumba;
AudioPlayer samba;
AudioPlayer swing;


void setup() {
  minim = new Minim(this);

  players.add(waltz);
  players.add(rumba);
  players.add(samba);
  players.add(swing);

  waltz = minim.loadFile("waltz.mp3", 2048);
  rumba = minim.loadFile("rumba.mp3", 2048);
  samba = minim.loadFile("samba.mp3", 2048);
  swing = minim.loadFile("swing.mp3", 2048);
  
}

void draw() {
	size(512, 512);

	println(players.size());
	
}

void keyPressed() {
	int k = key;

	for (int i=0; i < players.size(); i++ ) {
		AudioPlayer p = players.get(i);
		if (p.isPlaying()){
			p.pause();
			p.rewind();
		}
	}

	AudioPlayer playNow = players.get(k-1);
	playNow.loop();
 
}