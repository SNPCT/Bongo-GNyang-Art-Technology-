void setup() {
  // 창 크기를 1600 * 900으로 설정
  size(1600, 900);
  
  // 배경색을 밝은 회색으로 설정
  background(245);
  
  // 화면이 정적이므로 한 번만 그리도록 설정
  noLoop();
}

void draw() {
  // 왼쪽 상단에 폴더 그리기 
  // (x좌표: 50, y좌표: 50, 너비: 120, 높이: 80)
  drawFolder(50, 50, 120, 80);
}

// 폴더 아이콘을 그리는 사용자 정의 함수
void drawFolder(float x, float y, float w, float h) {
  float tabW = w * 0.4; // 폴더 탭의 너비 (전체의 40%)
  float tabH = h * 0.2; // 폴더 탭의 높이 (전체의 20%)
  
  noStroke(); // 테두리 선 없음

  // 1. 폴더 뒷면 (입체감을 위해 약간 더 어두운 노란색)
  fill(230, 180, 30);
  rect(x, y + tabH, w, h - tabH, 5, 5, 5, 5); // 모서리를 약간 둥글게(5px)

  // 2. 폴더 탭 (상단 튀어나온 부분)
  fill(255, 204, 51); // 밝은 노란색
  rect(x, y, tabW, tabH + 2, 5, 5, 0, 0); // 윗부분 모서리만 둥글게 처리

  // 3. 폴더 앞면
  fill(255, 204, 51);
  rect(x, y + tabH, w, h - tabH, 0, 5, 5, 5); // 탭과 이어지는 왼쪽 상단만 각지게 처리
}
