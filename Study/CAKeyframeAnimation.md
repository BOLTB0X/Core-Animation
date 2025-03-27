# CAKeyframeAnimation

> An object that provides keyframe animation capabilities for a layer object.

```swift
class CAKeyframeAnimation
// iOS 2.0+ | iPadOS 2.0+ | Mac Catalyst 13.1+ | macOS 10.5+ | tvOS 9.0+ | visionOS 1.0+
```

**CABasicAnimation** 이 단순히 `fromValue` 에서 `toValue 로 변하는 애니메이션을 만든다면,
**CAKeyframeAnimation** 은 여러 개의 중간 상태를 포함한 애니메이션을 만들 수 있음

## 역할

1. 정의

   - 키 프레임과 값을 설정할 수 있어, `Keyframe` 단위로 쪼개어 각각의 `Keyframe` 마다 효과를 주거나 다른 애니메이션을 하도록 설정할수 있는 CAAnimation 기반 Class

   - 곡선을 따라 움직이거나 복잡한 애니메이션이 필요할 때 유용
     <br/>

2. 특징

   - 여러 개의 중간 상태 (`Keyframe`) 설정 가능
   - 부드러운 곡선 모션을 만들기 용이
   - 애니메이션 경로(`path`) 지정 가능
   - 애니메이션 속도를 제어하는 `timingFunctions` 지원
     <br/>

## Keyframe (`values` 프로퍼티)

> Keyframe은 애니메이션이 특정 시점에 어떤 값을 가져야 하는지를 정의하는 중간 단계의 값들

애니메이션이 프레임 단위로 진행되면서 values에 지정된 값을 따라 움직이는 것

- ex.1) `values`를 이용한 애니메이션(공식문서 예제)

  ```swift
  // ...

  let colorKeyframeAnimation = CAKeyframeAnimation(keyPath: "backgroundColor")
   colorKeyframeAnimation.values = [UIColor.red.cgColor,
                                         UIColor.green.cgColor,
                                         UIColor.blue.cgColor]
   colorKeyframeAnimation.keyTimes = [0, 0.5, 1]
   colorKeyframeAnimation.duration = 2

   layer.add(colorKeyframeAnimation, forKey: "backgroundColorAnimation")
  // ...
  ```

  - `values` : 애니메이션이 따라갈 중간 지점들을 직접 지정
  - `CGPoint`: 배열을 사용하여 위치(`backgroundColor`)를 정의
  - `keyPath` : `"backgroundColor"` -> 레이어의 배경색상 변화 적용
    <br/>

    <p align="center">
      <img src="https://github.com/BOLTB0X/Core-Animation/blob/main/Img/CAKeyframeAnimation-%EA%B3%B5%EC%8B%9D%EB%AC%B8%EC%84%9C-%EC%98%88%EC%A0%9C.gif?raw=true" width="50%">
    </p>
    <br/>

  - 이렇게 레이어가 **values**에 지정된 색상들을 순서대로 거쳐 변경

  <br/>

- ex.2) `values`를 이용한 애니메이션

  ```swift
  // ...

  let animation = CAKeyframeAnimation(keyPath: "position")
  animation.values = [
       CGPoint(x: 100, y: 150),
       CGPoint(x: 150, y: 100),
       CGPoint(x: 250, y: 50),
       CGPoint(x: 150, y: 200),
       CGPoint(x: 100, y: 150)
  ]

  // ...
  ```

  - `values` : 애니메이션이 따라갈 중간 지점들을 직접 지정
  - `CGPoint`: 배열을 사용하여 위치(`position`)를 정의
  - `keyPath` : `"position"` -> 레이어의 위치 변화 적용
    <br/>

    <p align="center">
      <img src="https://github.com/BOLTB0X/Core-Animation/blob/main/Img/CAKeyframeAnimation-%EC%9D%B4%EB%A6%AC%EA%B0%94%EB%8B%A4%EC%A0%80%EB%A6%AC%EA%B0%94%EB%8B%A4.gif?raw=true" width="50%">
    </p>
    <br/>

  - 이렇게 레이어가 **values**에 지정된 위치들을 순서대로 거쳐 이동
    <br/>

## Path (`path` 프로퍼티)

> `path`는 `UIBezierPath`를 사용해서 곡선을 따라 애니메이션이 진행되도록 만드는 옵션

**values**처럼 여러 위치를 지정하는 게 X, 곡선을 그린 후 해당 경로를 따라 움직이게 하는 것

- ex) `path` 를 이용한 곡선 애니메이션

  ```swift
  let animation = CAKeyframeAnimation(keyPath: "position")
  let path = UIBezierPath()

  path.move(to: CGPoint(x: 20, y: 300))
  path.addCurve(to: CGPoint(x: 350, y: 300),
  controlPoint1: CGPoint(x: 100, y: 50),
  controlPoint2: CGPoint(x: 270, y: 500))

  animation.path = path.cgPath
  animation.duration = 2.0
  ```

  - `path.move(to:)` : 시작 위치 설
  - `path.addCurve(to:controlPoint1:controlPoint2:)` : 베지어 곡선 추가.

  - `path` 를 사용하면, 애니메이션이 부드러운 곡선을 따라 움직임

  - **values**와는 다르게, 곡선을 그리는 방식이기 때문에 좀 더 자연스러운 움직임을 만들 수 있음
    <br/>

## Timing Functions (`timingFunctions` 프로퍼티)

> `timingFunctions`는 애니메이션이 진행될 때 속도의 변화를 조절하는 역할

애니메이션이 시작할 때 천천히, 중간에 빨라졌다가 다시 천천히 끝나는 다양한 **가속 효과**를 조절하는 프로퍼티

- 기본 옵션

  | 옵션             | 설명                              |
  | ---------------- | --------------------------------- |
  | `.linear`        | 일정한 속도로 움직임              |
  | `.easeIn`        | 시작할 때 천천히, 점점 빨라짐     |
  | `.easeOut`       | 시작할 땐 빠르게, 끝날 때 천천히  |
  | `.easeInEaseOut` | 시작과 끝은 천천히, 중간에 빨라짐 |
  | `.default`       | `.easeInEaseOut`와 동일           |

  <br/>

- ex) `timingFunction` 적용

  ```swift
  animation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
  ```

  <br/>

- `timingFunctions`을 `keyTimes`와 함께 사용

  ```swift
  animation.values = [0.2, 0.4, 0.7, 1]
  animation.keyTimes = [0.0, 0.3, 0.7, 1.0]
  animation.timingFunctions = [
        CAMediaTimingFunction(name: .easeIn),
        CAMediaTimingFunction(name: .linear),
        CAMediaTimingFunction(name: .easeOut)
  ]
  ```

  - `keyTimes`: 애니메이션 진행도를 0~1 범위에서 정의

    1. `0.0` : 애니메이션 시작 지점

    2. `0.3` : 첫 번째 키프레임 도달 시점

    3. `0.7` : 두 번째 키프레임 도달 시점

    4. `1.0`: 마지막 키프레임 도달 시점
       <br/>

  - `timingFunctions`는 각 `keyTimes` 사이의 속도 조절을 정의

    1. 첫 번째 구간은 `.easeIn`

    2. 두 번째 구간은 `.linear`

    3. 세 번째 구간은 `.easeOut`
       <br/>

## 참고

- [공식문서 - CAKeyframeAnimation](https://developer.apple.com/documentation/quartzcore/cakeyframeanimation)

- [꽈배기 인생:티스토리 - CAKeyframeAnimation 대하여](https://wookiphone.tistory.com/81)

- [김종권의 iOS - CAKeyframeAnimation 애니메이션, 키프레임, 쉐이킹 애니메이션](https://ios-development.tistory.com/841)
