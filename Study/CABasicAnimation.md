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

## 예제

1. 생성

   ```swift
   let animation = CABasicAnimation(keyPath: "position.x") // 1
   animation.fromValue = 0 // 2
   animation.toValue = self.view.bounds.width // 2
   animation.duration = 1.0
   layer.add(animation, forKey: nil)
   ```

   1. **CABasicAnimation** 인스턴스 생성
      - `init(keyPath:)` 초기화 메소드로 생성
      - 렌더 트리에서 애니메이션할 속성의 `keyPath` 를 지정
   2. `fromValue` : 시작 , `toValue` : 끝
      <br/>

2. **Scalar** Animation

   - **Scalar value**: 단일 값을 가지는 속성 (ex: `opacity` , `transform.scale`)
     <br/>

   ```swift
   let animation = CABasicAnimation(keyPath: "opacity")
   animation.fromValue = 0
   animation.toValue = 1
   ```

   - opacity 속성을 0에서 1로 변화시켜 레이어가 점점 나타나는(fade-in) 애니메이션을 만듬

     <br/>

3. **Non-Scalar** 애니메이션

   - **Non-Scalar value**: 여러 값을 가지는 속성 (예: `backgroundColor` , `position`)
     <br/>

   ```swift
   let animation = CABasicAnimation(keyPath: "backgroundColor")
   animation.fromValue = NSColor.red.cgColor
   animation.toValue = NSColor.blue.cgColor
   ```

   - `backgroundColor` 는 단순한 정수가 아닌 색상 값을 가지는 속성
   - `fromValue`(빨간색) -> `toValue`(파란색)으로 서서히 변화하는 애니메이션을 만듬
     <br/>

4. 배열(Array)로 여러 값을 애니메이션 설정

   ```swift
   let animation = CABasicAnimation(keyPath: "position")
   animation.fromValue = [0, 0]
   animation.toValue = [100, 100]
   ```

   - `position`: CGPoint 타입, `x`, `y` 값을 배열로 지정 가능
   - `fromValue = [0, 0]` -> `toValue = [100, 100]`
     - (0,0)에서 (100,100)으로 이동하는 애니메이션

    <br/>

5. 특정 속성의 개별 요소로 애니메이션

   - `keyPath` 속성의 개별 요소를 직접 선택하여 애니메이션 가능

   ```swift
   let animation = CABasicAnimation(keyPath: "transform.scale.x")
   animation.fromValue = 1
   animation.toValue = 2
   ```

   <br/>

## forKey

1. `forKey`의 역할

   1. 애니메이션을 식별하는 키값

      - `forKey`에 특정 문자열을 넣으면 해당 애니메이션을 식별할 수 있음
        <br/>

      ```swift
      layer.animation(forKey: "move")`
      ```

      - 이후 호출 하면, 해당 애니메이션 객체를 가져올 수 있음
        <br/>

   2. 애니메이션을 취소하거나 변경할 때 활용
      <br/>

      ```swift
      layer.removeAnimation(forKey: "move")
      ```

      - 호출하면 해당 키의 애니메이션을 제거할 수 있음
        <br/>

2. **forKey**를 사용할 때와 사용하지 않을 때의 차이

   1. `forKey`를 지정한 경우

      ```swift
      let animation = CABasicAnimation(keyPath: "position")
      animation.fromValue = CGPoint(x: 50, y: 50)
      animation.toValue = CGPoint(x: 200, y: 200)
      animation.duration = 1.0

      layer.add(animation, forKey: "move")
      ```

      - `"move"`을 `layer`에 애니메이션을 간편히 가져옴
        <br/>

      ```swift
      layer.removeAnimation(forKey: "move")
      ```

      - 애니메이션을 중단 가능
        <br/>

   2. `forKey`를 `nil`로 설정한 경우
      - `forKey` 를 사용하지 않으면 애니메이션을 제거하거나 가져올 방법이 없음
      - 애니메이션이 끝날 때까지 자동 실행되며, 중간에 `removeAnimation`을 호출할 수 없음
        <br/>

## fillMode 와 isRemovedOnCompletion

> CABasicAnimation 원리애니메이션 시작과 끝을 매끄럽게 연결

애니메이션이 끝난 후 layer의 상태를 유지할지 결정하는 중요한 속성

1. `fillMode`

   > 애니메이션의 시작 전과 종료 후 상태를 어떻게 유지할지 결정하는 속성

   - 기본 값: `.removed` (애니메이션이 끝나면 원래 상태로 돌아감)

   - 애니메이션이 끝난 후 상태를 유지하고 싶다면, `.forwards`를 사용
     <br/>

   1. `.removed` (default)
      <p align="center">
        <img src="https://github.com/BOLTB0X/Core-Animation/blob/main/Img/removed.png?raw=true" alt="Example Image" width="70%">

      애니메이션이 시작과 끝에만 보이고 원래 상태로 돌아감
      </p>
      <br/>

   2. `.forwards`
      <p align="center">
        <img src="https://github.com/BOLTB0X/Core-Animation/blob/main/Img/backwords.png?raw=true" alt="Example Image" width="70%">

      애니메이션이 끝난 후 `toValue` 상태를 유지
      </p>
      <br/>

   3. `.backwards`
      <p align="center">
        <img src="https://github.com/BOLTB0X/Core-Animation/blob/main/Img/forwords.png?raw=true" alt="Example Image" width="70%">

      애니메이션 시작 전부터 `fromValue` 상태를 유지
      </p>
      <br/>

   4. `.both`
      <p align="center">
        <img src="https://github.com/BOLTB0X/Core-Animation/blob/main/Img/both.png?raw=true" alt="Example Image" width="70%">

      `.backwards` + `.forwards` (시작 전 유지 + 종료 후 유지)
      </p>
      <br/>

2. `isRemovedOnCompletion`

   > 애니메이션이 끝난 후 **layer**에서 애니메이션이 제거될지 결정하는 속성

   - 기본값: `true` (애니메이션이 끝나면 자동으로 제거됨)

   - `false`로 설정하면 애니메이션이 끝난 후에도 계속 유지됨
     <br/>

   ```swift
   animation.isRemovedOnCompletion = false // 애니메이션이 끝나도 제거되지 않도록 설정
   ```

   <br/>

## 참고

- [공식문서 - CABasicAnimation](https://developer.apple.com/documentation/quartzcore/cabasicanimation#2776772)

- [yungsoyu.medium - [Core Animation 1] CABasicAnimation 튜토리얼](https://yungsoyu.medium.com/core-animation%EC%9D%98-%EA%B8%B0%EB%B3%B8-cabasicanimation-%ED%8A%9C%ED%86%A0%EB%A6%AC%EC%96%BC-b9f8a3b41cf7)

- [dongminyoon.tistory - [iOS] CABasicAnimation란](https://dongminyoon.tistory.com/33)
