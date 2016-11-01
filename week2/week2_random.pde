// impordime pdfi library, millega saame salvestada pdf-e
import processing.pdf.*;

void setup() {
  size(720, 720, P3D);

  // määrame, kui mitu kaadrid sekundis tahame joonistada
  // default on 60
  frameRate(30);

  // taust on valge, sest siis saame lihtsamalt printida
  background(255);

  // määrame ära, et nüüd hakkame salvestama pdf-i ja salvestame selle
  // output.pdf-i faili. NB! see kirjutab faili üle.
  beginRaw(PDF, "output.pdf");
}

void draw() {
  // background(0);

  // joone värv on 0 ehk must
  stroke(0);
  noFill();

  // strokeWeight määrab joonepaksuse
  strokeWeight(1);

  for(int i = 0; i < 2; i = i + 1) {

	// random() võtab sisendiks kaks argumenti – min ja max
	// ja tagastab meile mini ja maxi vahelise floati (komakohaga
	// arvu). näiteks random(100, 200) võib meile tagastada 120.5
    line(
     random(0, 100),
     random(0, height),
     random(width - 100, width),
     random(0, height)
    );

	// siin defineerime uue muutuja. muutuja tüüp on float ehk
	// mingisugune komakohaga arv
	float raadius = random(4, 240);

	// joonistame ellipsi suvalisse kohta ekraanil, aga kasutame
	// laiuse ja kõrguse jaoks eelnevalt arvutatud muutujat
	// "raadius". kuna laius ja kõrgus on võrdsed, siis joonistame
	// ringi.
    ellipse(
      random(0, width),
      random(0, height),
      raadius,
      raadius
    );
  }

  // kontrollime, et kui kaadreid on rohkem kui 100, siis kutsume
  // välja endRaw() funtksiooni. endRaw() lõpetab pdf-i kirjutamise
  // ja salvestab faili ära.
  // exit() läheb programmist välja.
  if (frameCount > 100) {
    endRaw();
    exit();
  }
}

// määrame ära, mis juhtub, kui hiire emba-kumba nuppu vajutatakse
void mousePressed() {
  // prindime konsooli, et vajutasime nuppu
  println("hiirevajutus");

  // kui vajutasime vasakut nuppu, siis käivitame lahenduse uuesti
  if (mouseButton == LEFT) {
    setup();
  }
  // aga kui vajutasime paremat nuppu, siis salvestame pdf-i ja
  // paneme lahenduse kinni.
  else if (mouseButton == RIGHT) {
    endRaw();
    exit();
  }


}