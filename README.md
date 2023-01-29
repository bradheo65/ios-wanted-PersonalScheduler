# PersonalScheduler

## 🖥️ 프로젝트 소개
원티드 프리온 보딩 `PersonalScheduler` 앱 프로젝트 입니다.

## 🕰️ 개발 기간

- 2023.01.09 ~ 2023. 01. 13 (5일)

## 🧑🏻‍💻 개발 멤버

|[브래드](https://github.com/bradheo65)|
|:---:|
|<image src = "https://i.imgur.com/35bM0jV.png" width="250" height="250">|
    
## ⚙️ 개발 환경

- `iOS 15.0`
- `데이터 베이스: FirebaseStore`
- `외부 라이브러리 관리: Cocoa Pod`

## 📌 주요 기능

### 소셜 미디어 로그인
    
- Kakako
- Facebook
- FirebaseAuth

### 자동 로그인

- FirebaseStore의 Auth.auth().currentUser.uid의 value로 로그인
    
### 푸쉬 알람
    
- UserNotifications

### 데이터 베이스

- FirebaseStore
    

## 📱 동작 화면

|`FirebaseAuth 회원가입`|`FirebaseAuth 로그인`|
|:---:|:---:|
|<image src = "https://i.imgur.com/LUHtngo.gif" width="250" height="400">|<image src = "https://i.imgur.com/AUMl0g3.gif" width="250" height="400">|  

|`페이스북 로그인`|`카카오 로그인`|
|:---:|:---:|
|<image src = "https://i.imgur.com/kKqaxT1.gif" width="250" height="400">|<image src = "https://i.imgur.com/M5kFrRu.gif" width="250" height="400">|

|`자동 로그인`|`푸쉬 알람`|
|:---:|:---:|
|<image src = "https://i.imgur.com/jDtGWkv.gif" width="250" height="400">|<image src = "https://i.imgur.com/iDlwRXJ.gif" width="250" height="400">| 

|`추가 기능`|`편집 및 삭제 기능`|
|:---:|:---:|
|<image src = "https://i.imgur.com/u1EwH0w.gif" width="250" height="400">|<image src = "https://i.imgur.com/ZmFztGp.gif" width="250" height="400">| 

## 📑 파일 구조
    
```
.
├── Assets.xcassets
│   ├── AccentColor.colorset
│   │   └── Contents.json
│   ├── AppIcon.appiconset
│   │   └── Contents.json
│   ├── Contents.json
│   ├── Image.imageset
│   │   └── Contents.json
│   └── KakoLoginImageButton.imageset
│       ├── Contents.json
│       └── kakao_login_medium_narrow.png
├── Config.xcconfig
├── Extension
│   ├── Date+Extension.swift
│   └── String+Extension.swift
├── GoogleService-Info.plist
├── Info.plist
├── Manager
│   ├── FirebaseStorageManager.swift
│   ├── LoginManager
│   │   ├── FacebookLoginManager.swift
│   │   ├── FirebaseLoginManager.swift
│   │   └── KakaoLoginManager.swift
│   └── NotificationManager.swift
├── Model
│   ├── KakaoInfo.swift
│   ├── ScheduleList.swift
│   └── UserInfoData.swift
├── PersonalSchedulerApp.swift
├── Presentation
│   ├── Login
│   │   ├── FBLogView.swift
│   │   ├── LoginView.swift
│   │   └── LoginViewModel.swift
│   ├── ScheduleAdd
│   │   ├── ScheduleAddView.swift
│   │   └── ScheduleAddViewModel.swift
│   ├── ScheduleList
│   │   ├── ScheduleListCellView.swift
│   │   ├── ScheduleListView.swift
│   │   └── ScheduleListViewModel.swift
│   └── SignUp
│       ├── SignUpView.swift
│       └── SignUpViewModel.swift
└── Preview Content
    └── Preview Assets.xcassets
        └── Contents.json
```
    
