## Team-08

#### 🛠 Backend

Dong

#### 📱 iOS


Dumba
Cri



## Team Rule

- 개인적 사정 등 서로 처한 상황에 대해 이해하고 존중
- Backend, iOS 서로에게 필요한 부분이 있으면 적극적으로 대화를 시도

## Backend (Dong)

https://github.com/d-h-k/baseball/wiki/API-사용법




### 테크니컬 첼린지 포인트
#### Oauth 구현하기
  - github 페이지와 ouath인증 진행하기
  - Spring security는 사용하지 않는다.
  - 어려운 경우 >> Oauth를 별도 라이브러리로 구현하고 baseball 프로젝트에 통합 적용해 본다.

#### admin tool 제작
  - 게임 운영에 필요한 도구들을 모아놓은 admin tool을 별도 웹으로 구현한다.
  - admin 도구는 프론트 및 백엔드 모두 백엔드에서 직접 구현한다. 
  - admin 사용자 인증은 hard coding으로 최대한 간단히 구현한다. admin email 주소를 설정에 포함할 것
  - 내생각
    - admin@dong.com / javaking  >> 요런느낌으로 가자
    - 게임 운영에 필요한 도구들
      - 모든 데이터베이스 조회
      - 프론엔드 백엔드 다 구현해버리기

#### VPC 학습
  - 웹서버와 데이터베이스는 다른컴퓨터로 쓰기!!
    - EC2 두대로 각각 웹서버와, DB서버 두대 돌려 생성
    - 혹은 데이터베이스는 RDS로 쓰고, 웹서버 EC2 쓰는 구조
  - 22,80 포트 제외하고 다 닫기
    - 3306이나 8080은 포트 열려있는거 자체가 보안 취약점이니까 꼭 닫아놓기
    - 엔진엑스랑 연결되는거니까 다음항목을 봐라

#### Nginx
  - 프론트 배포는 NginX를 설정해서 사용한다. 프론트는 80포트에서 동작
  - NginX와 tomcat을 연동하고 80포트만 외부에 개방
  - 8080 포트는 외부에 개방하지마라
    - 그러니까 쉽게말해서 프론트사이드 


#### 커밋 메시지 규칙
> 원문 : http://karma-runner.github.io/5.0/dev/git-commit-msg.html

- feat (new feature for the user, not a new feature for build script)
- fix (bug fix for the user, not a fix to a build script)
- docs (changes to the documentation)
- style (formatting, missing semi colons, etc; no production code change)
- refactor (refactoring production code, eg. renaming a variable)
- test (adding missing tests, refactoring tests; no production code change)
- chore (updating grunt tasks etc; no production code change)



#### 앞으로 더 구현할 기능
##### 데이터 입력받기 기능
  - ios / 데이터 입력받기 : 볼 , 스트라이크, 아웃, @@@@
##### api 문서화 어떻게 쓰는지에 대하여 
  - 보기 편하시도록, 실서버에서 돌아가는거
##### 관리자 페이지 제공해서 시뮬레이션 해보실수 있도록??(옵션)
  - 이거는 버리는옵션, 일단 백엔드 우선으로 돌리자
##### 팀 데이터(랭킹데이터) 제이슨으로 리턴되고, 승점순으로 정렬되
  - 승점순으로 정렬해서 제이슨으로 리턴해드리기
  - 지금은 축구룰 승점 적용(승리*3 + 비김*1)이지만, 나중에 야구룰 적용할지는 미지수
##### 상세보기 페이지
  - 뭐에대한 상세보기였지..?
##### 오어쓰 기능구현 
  - Oauth 2.0 생활코딩 강의 필기(낮은 우선순위)
  - 하게된다면 이런 이슈는 있다 >> 옥토캣 라이브러리 사용한다(iOS분들)
##### 1루 2루 3루 홈 누가있는지 리스트로 관리하기
  - 이부분 추가해야되요!!
    <br><br><br>
### ios 사이드 요청사항 반영할꺼


##### 1 최신순으로 맨 위에 올라오게 >> 지금 경기상황
- 경기상황
##### 2 스코어 화면 
- 편하게 띄워줄수 있도록 DTO 작성
  <br><br><br>
### 나의마인드셋
- 언제든 불편한거 말씀하시면 99.8% 정도는 맞춰드리겠습니다!!

---------

## iOS (Dumba, Cri)






2021.05.03 월요일

- 깃 전략 수립
- 깃 사용 시 Issue, Milestone, Commit Message 규칙 적극 활용 


- 수업 이후 아키텍쳐, 금주 진행할 사항(GameListView, GamePlayView) 등 프로젝트 진행에 대한 전반적 내용 결정

2021.05.04 화요일

- 오프라인에서 GameListView 구현

2021.05.05 수요일

- GamePlayView 내 GroundView 구현

2021.05.06 목요일

- 오프라인에서 GamePlayView 내 'Strike, Ball, Out', 게임 진행상황 TableView, 이닝 Label 구현

### GameListView
<img src="https://images.velog.io/images/panther222128/post/fe924852-a651-4b44-8be8-b7656246a446/Simulator%20Screen%20Shot%20-%20iPhone%2011%20-%202021-05-07%20at%2011.16.51.png" width="300">

### GamePlayView
<img src = "https://user-images.githubusercontent.com/41679458/117403703-91e05580-af43-11eb-998f-b2b620e04ad5.png" width = "300">

### iOS 차주 진행 예정 사항

진행방식: Navigator Dumba, Driver Cri, 즉 짝 프로그래밍으로 진행하되, 어느 정도의 유연함을 두고 의논하면서 진행



- API 내용 협의 필요
- 세 번째 화면 구현
- API에 따른 Business Logic 구현
- MVVM에 충실한 모습으로 구현
