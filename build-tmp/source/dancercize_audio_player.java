import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import ddf.minim.*; 

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
AudioPlayer waltz;
AudioPlayer rumba;
AudioPlayer samba;
AudioPlayer swing;

public void setup() {
  minim = new Minim(this);
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
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "dancercize_audio_player" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
