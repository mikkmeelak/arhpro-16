// esimese nädala tunnis läbitehtud ja kommenteeritud kood. siin on kõik
// korraga aktiivne ehk kui te selle käima panete on kõik segiläbi koos
// et vaadata, kuidas mingi osa koodist töötab, kommenteerige ülejäänud
// mittevajalik välja.

// setupi funktsiooni jooksutatakse ühe korra kohe alguses
void setup() {
  // size määrab ära akna suuruse ja renderdamismeetodi.
  // kasutame P2D, kui millegipärast tundub progamm aeglane,
  // siis võib proovida ka P3D-d.
  // size(width, height, renderdaja);
  size(720, 720, P2D);

  // background määrab taustavärvi. kuna teeme ainult kursuseraames
  // ainult must-valgeid programme, siis piisab ühest väärtusest.
  // 0 on must ja 255 on valge. vahepealsed väärtused on hallid.
  background(0);
}

// draw funktsiooni jooksutatakse iga kaardi puhul. kaadrisagedus
// oleneb teie arvuti võimsusest ja tõenäoliselt on see 60fps.
void draw() {
  // iga kaadri alguses määrame tausta, see nn puhastab ekraani ära
  // kommenteerides selle rea välja jätavab kõik joonistatud endast
  // jälje maha. proovige.
  background(0);

  // stroke määrab joonistatavate elementide äärte värvi. jällegi
  // 0 on must ja 255 valge.
  stroke(255);

  // noFill(); ütleb, et kui joonistame kinniseid elemente (rect, ellipse)
  // siis me ei soovi, et need oleks seest ära värvitud.
  // kui soovid värvitud elemente, siis kasuta noFill(); asemel fill(255);
  // sisendiks jällegi väärtus 0-255.
  noFill();

  // line(); joonistab joone. sisendiks alguspunkti x ja y ning lõpppunkti x ja y
  // koordinaate loetakse akna vasakust ülemisest puntkist ning pikslites.
  // line(x1, y1, x2, y2);
  line(0, 0, 100, 100);

  // mouseX ja mouseY abil saab teada hiire koordinaadid. pane tähele, et suured
  // ja väiksed tähed oleksid õigesti kirjutatud.
  line(0, 0, mouseX, mouseY);

  // rect(); joonistab ristküliku. sisendiks ristküliku vasaku ülemise
  // puntki x ja y ning ristküliku width ja height.
  // rect(x, y, width, height);
  rect(mouseX, mouseY, 100, 100);
  rect(mouseY, mouseX, 100, 100);

  // ellipse(); joonistab ringi või ellipsi. oleneb, kas jätate widthi ja heighti
  // võrdseks või mitte. sisendiks ellipse keskpunkti x ja y ning ellipsi
  // width ja height.
  // ellipse(cx, cy, width, height);
  ellipse(mouseX, mouseY, 100, 100);
  ellipse(mouseY, mouseX, 100, 100);

  // for-loop. {} vahel olevat koodi jooksutatakse mingi arv kordi.
  // sisendiks on vaja kolme argumenti
  // int i = 0; <- määrab ära muutuja ja selle algväärtuse, millele liidetakse
  // iga loopi järel mingi väärtuse juurde
  // i < width; <- loop töötab senikaua kui see väärtus on tõene. ehk widthi
  // puhul töötab loop nii kaua, kuni i on suurem kui ekraani laius.
  // i = i + 1; <- määrab, kui palju iga loopi korral i-le juurde lisatakse.

  for(int i = 0; i < width; i = i + 2) {
    // anname line-le väärtuseks triginomeetiliste funktsioonidega normaliseeritud
    // väärtused ja korrutame need läbi hiire koordinaatidega.
    // mõned näited, mis tunnis läbi käisid
    line(0, 0, sin(i) * mouseX, cos(i) * mouseY);
    line(sin(i) * mouseX, 0, sin(i) * mouseY, width);
    line(sin(i) * mouseX, sin(i) * mouseY, tan(i) * mouseY, width);
    line(sin(i) * mouseX, sin(i) * mouseY, tan(i * frameCount * 0.00001) * mouseY, width);
    line(sin(i) * mouseX, sin(i) * mouseY, tan(i) * mouseY, height);

    // frameCount loeb kaadrite arvu kokku. andes selle sisendiks saame jooni
    // vaikselt animeerida. siin korrutame selle läbi 0.00001-ga, sest muidu
    // oleks kõik liiga närviline
    line(sin(i) * mouseX, sin(i) * mouseY, tan(i * frameCount * 0.00001) * mouseY, height);
  }

  // nested loop. sellise meetodiga saame joonistada ruudustikke.
  // x = x + 20; siin saame määrata, millise sammuga gridi teeme.
  for (int x = 0; x < width; x = x + 20) {
    for (int y = 0; y < height; y = y + 20) {
      // joonistame x ja y keskpunkti lihtsa punkti
      point(x, y);

      // ellipsid, mille suurus oleneb hiire asukohast
      ellipse(x, y, mouseX, mouseY);

      // arc(); joonistab kaare. võtab sisendiks keskpunkti x ja y
      // widthi ja heighti ning kaare algus- ja lõpupunkti radiaanides.
      // radiaanid on sellised:
      // https://en.wikipedia.org/wiki/Radian#/media/File:Circle_radians.gif
      // arc(cx, cy, width, height, start, end)
      arc(x, y, 16, 16, x, x + PI);
    }
  }

  // saveFrame(); salvestab iga kaardi projektiga samasse folderisse.
  // saveFrame();
}