HashMap<String, PImage> images = new HashMap<String, PImage>();

int digit1 = 0; // 키보드 상태 (0, 1, 2, 3, 4)
int digit2 = 2; // 마우스 상태 (1:왼쪽, 2:정지, 3:오른쪽)

int pastMouseX = 0;
int lastCheckTime = 0;

void setup() {
  size(500, 500); // 캔버스 크기
  textAlign(CENTER, CENTER);
  textSize(30);
  
  // 시작할 때 마우스 위치 초기화
  pastMouseX = mouseX;
  
  // 이미지 미리 불러오기 (data 폴더 내 파일 로드)
  for (int i = 0; i <= 4; i++) {
    for (int j = 1; j <= 3; j++) {
      String imgName = "w" + i + j + ".png";
      PImage img = loadImage(imgName);
      if (img != null) {
        images.put(imgName, img);
      }
    }
  }
}

void draw() {
  background(240); // 밝은 회색 배경
  
  // -----------------------------------------
  // 1. 마우스 움직임 감지 로직 (0.2초 = 200ms 마다 체크)
  // -----------------------------------------
  if (millis() - lastCheckTime >= 100) {
    int moveDiff = mouseX - pastMouseX;
    
    if (moveDiff >= 50) {
      digit2 = 3; // 오른쪽으로 이동
    } else if (moveDiff <= -50) {
      digit2 = 1; // 왼쪽으로 이동
    } else {
      digit2 = 2; // 움직임 멈춤
    }
    
    // 다음 비교를 위해 현재 상태 저장
    pastMouseX = mouseX;
    lastCheckTime = millis();
  }
  
  // -----------------------------------------
  // 2. 파일명 조합 및 화면 출력
  // -----------------------------------------
  String currentFileName = "w" + digit1 + digit2 + ".png";
  
  // 이미지 그리기
  if (images.containsKey(currentFileName)) {
    image(images.get(currentFileName), 0, 0);
  } else {
    // 이미지가 없을 때 텍스트 띄우기
    fill(0);
    text("Current Image:\n" + currentFileName, width/2, height/2);
  }
}

// -----------------------------------------
// 3. 키보드 누름 감지
// -----------------------------------------
void keyPressed() {
  int group = checkKeyGroup(key);
  // 지정된 그룹의 키가 맞다면 digit1을 해당 그룹 번호로 변경
  if (group != 0) {
    digit1 = group;
  }
}

// -----------------------------------------
// 4. 키보드 뗌 감지 (✨새로 추가된 부분!✨)
// -----------------------------------------
void keyReleased() {
  // 어떤 키든 손을 떼는 순간 무조건 첫 번째 숫자를 0으로 되돌립니다.
  digit1 = 0;
}

// 키보드 키가 어느 그룹에 속하는지 판별하는 함수
int checkKeyGroup(char k) {
  k = Character.toLowerCase(k); 
  
  String group1 = "123456qwerty";
  String group2 = "7890-=uiop";     
  String group3 = "asdfgzxcvb ";    
  String group4 = "hjklnm";         
  
  if (group1.indexOf(k) != -1) return 1;
  if (group2.indexOf(k) != -1) return 2;
  if (group3.indexOf(k) != -1) return 3;
  if (group4.indexOf(k) != -1) return 4;
  
  return 0; 
}
