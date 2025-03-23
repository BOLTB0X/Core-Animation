# Core-Animation

![낼름낼름](https://mblogthumb-phinf.pstatic.net/MjAyMjA3MTdfMjEw/MDAxNjU3OTk1MzQ5ODA0.k6xBU4rn2o6EcIOP9Yr3X2GDNezS8axxu0n9cMDK8X8g.QsyQGCEVCxnBg_XDHnpSQ9tzSdqTvtS-1W2jArA5-DMg.GIF.gogoa25/IMG_6840.GIF?type=w800)

낼름낼름

## Core Animation

<details>
<summary> Core Animation 이란?</summary>

<br/>

> Render, compose, and animate visual elements

> Core Animation은 iOS와 OS X에서 모두 사용할 수 있는 그래픽 렌더링 및 애니메이션 인프라로, App의 View와 다른 시각적 요소를 애니메이션화하는 데 사용

<br/>

<p align="center">
   <img src="https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/CoreAnimation_guide/Art/ca_architecture_2x.png" alt="Example Image" width="50%">
   <br/>
   출처: Core Animation Programming Guide
</p>
<br/>

App의 뷰 계층을 관리하면서 애니메이션을 최적화하는 프레임워크

1. GPU 가속을 활용한 **프레임워크**

   - `UIView` , `Layer` 등에 애니메이션을 적용할 수 있도록 도움
   - UIKit과 밀접하게 연관
   - `UIViewRepresentable` 사용 시 , SwiftUI에서도 활용 가능
   - 내부적으로 Metal / Core Graphics 사용 가능
     <br/>

2. `CALayer` 기반으로 동작, `CABasicAnimation` , `CAKeyframeAnimation` 등 제공

   - 몇 가지 애니메이션 매개변수(ex, 시작점 및 종료점) 설정 후 Core Animation 으로 명령
   - 나머지 Task를 GPU에 넘겨 렌더링을 가속화

   - 애니메이션을 실행해도 **Main Thread** 를 차단하지 않으며 , 비동기적으로 실행 됨
     <br/>

</details>

<details>
<summary> Metal , Core Graphics , Core Animation 차이</summary>

| **기술**           | **역할**                                                  | **위치**                                       |
| ------------------ | --------------------------------------------------------- | ---------------------------------------------- |
| **Metal**          | 저수준 그래픽 API, GPU 활용 최적화                        | 가장 하위 (GPU 레벨)                           |
| **Core Graphics**  | 2D 그래픽 렌더링 (비트맵 기반)                            | Metal보다 상위, 하지만 Core Animation보다 하위 |
| **Core Animation** | GPU 가속을 활용한 애니메이션 프레임워크, 뷰의 레이어 관리 | 가장 상위 (UIView/CALayer)                     |

</details>

## 참고

- [공식문서 - Core Animation](https://developer.apple.com/documentation/quartzcore)

- [Core Animation Programming Guide](https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/CoreAnimation_guide/CoreAnimationBasics/CoreAnimationBasics.html#//apple_ref/doc/uid/TP40004514-CH2-SW3)
