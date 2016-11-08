// teeme uue muutuja, millega hakkame noise-i muutma.
// muutuja tüüp on float. ehk suvaline komakohaga arv.
float time = 0;

void setup() {
    size(720, 720, P3D);

    // kui jookseb aeglaselt, siis proovige noSmooth()-i
    // jooned jäävad robustsemad, aga lahendus on kiirem
    noSmooth();

    // noiseDetailiga saate muuta noise-i iseloomu. lugege
    // dokumentatsioonist täpsemalt, kuidas see töötab
    noiseDetail(16, 0.5);
}

void draw() {
    // lisame igal kaadril ajale 0.01 juurde
    time = time + 0.01;

    background(30);
    stroke(255);
    //fill(255);
    noFill();

    // joonistame ühe kurvi, mis saab oma y-väärtused
    // noisest. beginShape alustab kurvi, curveVertex
    // lisab uusi punkte kurvile ning endShape lõpetab.
    beginShape();
    for (int i = 0; i < width; i = i + 10) {
        float posY = noise(i * 0.01);
        curveVertex(i, posY * height);
    }
    endShape();

    // joonistame 100 kurvi ja anname noise-le 3 argumenti
    // ette. kurvi järjekorranumbri, x-koordinaadi ja time-i
    for (int i = 0; i < 100; i = i + 1) {
        beginShape();

        for (int x = -100; x < width + 100; x = x + 10) {
            float posY = noise(i * 0.1, x * 0.001, time);
            curveVertex(x, posY * height);
        }

        endShape();
    }
}