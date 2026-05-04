import gifAnimation.*; // GIF 라이브러리 불러오기 // 마우스 상호작용으로 gif 이미지를 가져오는거임

Gif myGif;

void setup() {
  size(800, 600);
  myGif = new Gif(this, "animation.gif");
  myGif.play();
}

void draw() {
  background(255); 
  if (mousePressed && mouseButton == LEFT) 
    image(myGif, mouseX - myGif.width / 2, mouseY - myGif.height / 2);
  }
}
