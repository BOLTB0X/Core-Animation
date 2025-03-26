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

## 예제

## 참고

- [공식문서 - CAKeyframeAnimation](https://developer.apple.com/documentation/quartzcore/cakeyframeanimation)

- [꽈배기 인생:티스토리 - CAKeyframeAnimation 대하여](https://wookiphone.tistory.com/81)

- [김종권의 iOS - CAKeyframeAnimation 애니메이션, 키프레임, 쉐이킹 애니메이션](https://ios-development.tistory.com/841)
