# CABasicAnimation

> An object that provides basic, single-keyframe animation capabilities for a layer property.

```swift
class CABasicAnimation
// iOS 2.0+ | iPadOS 2.0+ | Mac Catalyst 13.1+ | macOS 10.5+ | tvOS 9.0+ | visionOS 1.0+
```

Core Animation에서 제공하는 가장 기본적인 애니메이션 Class

## 역할

> 기본적인 애니메이션 동작가능한 기능들을 제공

> 특정 속성의 시작 값(`fromValue`)과 종료 값(`toValue`)을 설정하여 애니메이션을 수행하는 방식

- **정의**

  - **하나의 시작과 끝을 가진 단순 애니메이션**
  - `keyPath`를 활용하여 특정 애니메이션을 지정하고 동작 가능

  - 시간 기반 애니메이션
    - `duration`으로 지속 시간 설정 가능
  - 비동기 실행 -> UI 스레드를 차단하지 않음
  - 애니메이션이 끝나도 기본적으로 원래 상태로 되돌아감
    - 이를 방지하려면 `fillMode` 설정 필요
      <br/>

- 사용 예시
  - 위치 이동, 투명도 변화, 크기 변경, 회전 등

## 속성

| 속성                    | 설명                                                   | 예제                                              |
| ----------------------- | ------------------------------------------------------ | ------------------------------------------------- |
| `keyPath`               | 애니메이션할 `CALayer` 속성                            | `"position"`, `"opacity"`, `"transform.scale"` 등 |
| `fromValue`             | 애니메이션 시작 값                                     | `CGPoint(x: 50, y: 50)`                           |
| `toValue`               | 애니메이션 종료 값                                     | `CGPoint(x: 200, y: 200)`                         |
| `duration`              | 애니메이션 지속 시간 (초 단위)                         | `1.0` (1초 동안 실행)                             |
| `timingFunction`        | 애니메이션 속도 곡선                                   | `CAMediaTimingFunction(name: .easeInEaseOut)`     |
| `autoreverses`          | 애니메이션이 끝난 후 반대 방향으로 실행 여부           | `true`이면 앞뒤로 반복                            |
| `repeatCount`           | 애니메이션 반복 횟수 (`Float.infinity`로 무한 반복)    | `3` (3번 반복)                                    |
| `fillMode`              | 애니메이션이 끝난 후 상태 (`forwards`, `backwards` 등) | `.forwards` (애니메이션 종료 상태 유지)           |
| `isRemovedOnCompletion` | 애니메이션 종료 후 레이어에서 제거할지 여부            | `false`이면 종료 후에도 변경된 상태 유지          |

## 참고

- [공식문서 - CABasicAnimation](https://developer.apple.com/documentation/quartzcore/cabasicanimation#2776772)

- [yungsoyu.medium - [Core Animation 1] CABasicAnimation 튜토리얼](https://yungsoyu.medium.com/core-animation%EC%9D%98-%EA%B8%B0%EB%B3%B8-cabasicanimation-%ED%8A%9C%ED%86%A0%EB%A6%AC%EC%96%BC-b9f8a3b41cf7)

- [dongminyoon.tistory - [iOS] CABasicAnimation란](https://dongminyoon.tistory.com/33)
