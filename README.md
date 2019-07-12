# flutter_plugin_helloworld

A new Flutter plugin.

## Getting Started

This project is a starting point for a Flutter
[plug-in package](https://flutter.dev/developing-packages/),
a specialized package that includes platform-specific implementation code for
Android and/or iOS.

For help getting started with Flutter, view our 
[online documentation](https://flutter.dev/docs), which offers tutorials, 
samples, guidance on mobile development, and a full API reference.


![image](https://user-images.githubusercontent.com/1451365/59921497-ca1e3e00-9468-11e9-8108-12a43f76a414.png)


## 의존성 추가

- `/android/libs/` 에 사용할 aar 파일을 넣습니다.
- `/android/build.gradle`에 추가한 aar파일을 의존성에 추가합니다. [코드](https://github.com/ChangJoo-Park/flutter_plugin_helloworld/blob/master/android/build.gradle#L39)
- `flatDir` 설정을 합니다.[코드](https://github.com/ChangJoo-Park/flutter_plugin_helloworld/blob/master/android/build.gradle#L19)
- flutter 앱에서 호출할 브릿지 메소드를 만듭니다.[코드](https://github.com/ChangJoo-Park/flutter_plugin_helloworld/blob/master/lib/flutter_plugin_helloworld.dart#L14)
- android 네이티브 플러그인에서 메세지 처리를 합니다.[코드](
https://github.com/ChangJoo-Park/flutter_plugin_helloworld/blob/master/android/src/main/java/com/example/flutter_plugin_helloworld/FlutterPluginHelloworldPlugin.java#L22
)

## 실행
example 디렉터리의 main.dart를 실행하세요 android studio에서 하시면 편합니다. 혹은 vscode에서 디버그 모드로 실행하세요


## 문제점

안드로이드 스튜디오에서 추가한 aar 또는 외부 의존성에 대한 인텔리센스가 안됩니다. (이건 제가 모르는거)


## 위 문제점 해결 방법

프로젝트를 열면 intellij flutter plugin이 `example` 을 메인 안드로이드 프로젝트로 인식하고 plugin용 android 프로젝트는 인식하지 못합니다.
위 이유로 프로젝트의 루트에서 프로젝트 실행 설정이 `example/lib/main.dart` 로 고정됩니다.

약간 불편함을 감수하더라도 인텔리센스를 이용하여 프로젝트를 진행하는 것이 좋을 것 같다면 아래의 순서대로 안드로이드 프로젝트를 열어서 작업합니다.
플러그인용 안드로이드 프로젝트로 모듈을 엽니다
![image](https://user-images.githubusercontent.com/1451365/59953107-93244880-94b9-11e9-99d4-d3730ba48a9a.png)

인텔리센스가 잘 적용되는 것을 볼 수 있습니다.
![image](https://user-images.githubusercontent.com/1451365/59952866-ada9f200-94b8-11e9-8948-9c38efd148cf.png)

참조

https://github.com/flutter/flutter-intellij/blob/master/docs/android.md
