# Core-Animation

![낼름낼름](https://mblogthumb-phinf.pstatic.net/MjAyMjA3MTdfMjEw/MDAxNjU3OTk1MzQ5ODA0.k6xBU4rn2o6EcIOP9Yr3X2GDNezS8axxu0n9cMDK8X8g.QsyQGCEVCxnBg_XDHnpSQ9tzSdqTvtS-1W2jArA5-DMg.GIF.gogoa25/IMG_6840.GIF?type=w800)

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

<p align="center">
<table style="width:100%; text-align:center; border-spacing:20px;">
<tr>
   <td style="text-align:center; vertical-align:middle;">
      <p align="center">
      <img src="https://github.com/BOLTB0X/Core-Animation/blob/main/Img/UIview%20%EC%83%9D%EC%84%B1.png?raw=true" 
             alt="image 1" 
             style="width:150px; height:300px; object-fit:contain; border:1px solid #ddd; border-radius:4px;"/>
      </p>
   </td>
   <td style="text-align:center; vertical-align:middle;">
      <p align="center">
      <img src="https://github.com/BOLTB0X/Core-Animation/blob/main/Img/%EC%89%90%EB%8F%84%EC%9A%B0.png?raw=true" 
             alt="image 1" 
             style="width:150px; height:300px; object-fit:contain; border:1px solid #ddd; border-radius:4px;"/>
      </p>
   </td>
</tr>
<tr>
   <td style="text-align:center; font-size:14px; font-weight:bold;">
   <p align="center">
      UIView 이용
   </p>
   </td>
      <td style="text-align:center; font-size:14px; font-weight:bold;">
   <p align="center">
      CALayer 이용
   </p>
   </td>
</table>
</p>

- **UIView** 그리기 방식이 **UIKit** 직접 관리
- **CALayer** 기반으로 동작 -> GPU가 직접 그리는 방식 -> **CoreAnimation** 기반

|                 | UIView                                                  | CALayer                                          |
| --------------- | ------------------------------------------------------- | ------------------------------------------------ |
| **역할**        | 화면에 표시되는 UI 요소 (버튼, 라벨, 이미지 뷰 등)      | UIView의 내부 그래픽을 담당하는 저수준 레이어    |
| **계층 구조**   | UIView끼리 부모-자식 관계를 형성                        | UIView의 `layer` 속성을 통해 관리                |
| **그리기 방식** | 시스템이 필요할 때 자동으로 다시 그림 (`draw(_:)` 호출) | GPU가 직접 그리는 방식                           |
| **사용 사례**   | 버튼, 라벨, 이미지 뷰 등 UI 요소                        | 그림자, 둥근 모서리, 애니메이션, 퍼포먼스 최적화 |

<br/>

</details>

<details>
<summary> Layer , CALayer , UIView </summary>

<br/>

> Layer , CALayer , UIView 개념이 중요

| 개념        | 설명                                                                          |
| ----------- | ----------------------------------------------------------------------------- |
| **Layer**   | 그래픽을 렌더링하는 기본 단위. GPU 가속을 활용하여 최적화된 그리기 연산 수행  |
| **CALayer** | Core Animation에서 제공하는 레이어 객체. UIView의 애니메이션 및 렌더링을 담당 |
| **UIView**  | UIKit의 기본 UI 요소로, 내부적으로 CALayer를 포함하여 화면에 그려짐           |

**UIView** 가 그리기 연산을 직접 수행 X, **Core Animation** 에게 **CALayer** 타입의 프로퍼티인 **layer** 를 통해 delegate

1. **layer**

   > The view’s Core Animation layer to use for rendering.

   ```swift
   @MainActor
   var layer: CALayer { get }
   // iOS 2.0+ | iPadOS 2.0+ | Mac Catalyst 13.1+ | tvOS | visionOS 1.0+
   ```

   - 그래픽을 렌더링하는 기본 단위

   - 결코 `nill` 을 갖지 않음
     <br/>

2. **CALayer**

   > An object that manages image-based content and allows you to perform animations on that content.

   ```swift
   class CALayer
   // iOS 2.0+ | iPadOS 2.0+ | Mac Catalyst 13.1+ | macOS 10.5+ | tvOS 9.0+ | visionOS 1.0+
   // CA: Core Animation의 약자
   ```

   - Core Animation의 핵심, Core Animation 뷰에서 이미지 기반의 컨텐츠를 관리하고 애니메이션을 수행하는 객체

     - **CALayer** 기반으로 애니메이션을 직접 조작(타이밍, 중첩 효과, 3D 변환 등)
       <br/>

   - `backgroundColor`, `border`, `shadow` 등 프로퍼티들은 **CALayer** 에 속함
   - 콘텐츠를 화면에 표시하는 데 사용되는 `geometry` 를 포함
   - **CALayer(Root)** 는 여러 개의 **SubLayer** 를 둘 수 있음
     <br/>

3. **UIView**

   > An object that manages the content for a rectangular area on the screen.

   ```swift
   @MainActor
   class UIView
   // iOS 2.0+ | iPadOS 2.0+ | Mac Catalyst 13.1+ | tvOS | visionOS 1.0+
   ```

   - 화면(UI) 을 담당하는 UIKit 내 클래스

     - UIKit에 속한 UIView를 이용하여 UI 를 그림

     - 레이아웃, 터치 이벤트 등 관련 작업을 처리

     - 뷰 위에 컨텐츠나 애니메이션을 그리기 연산은 **UIView** 가 하지 않음
       <br/>

   - **UIView** 내부에 **CALayer**가 존재 , 실제 그래픽 처리는 **CALayer**가 담당
     - UIView는 하나의 CALayer(Root)만 가짐
       <br/>

</details>

<details>
<summary> Metal , Core Graphics , Core Animation 차이</summary>

<br/>

| **기술**           | **역할**                                                  | **위치**                                       |
| ------------------ | --------------------------------------------------------- | ---------------------------------------------- |
| **Metal**          | 저수준 그래픽 API, GPU 활용 최적화                        | 가장 하위 (GPU 레벨)                           |
| **Core Graphics**  | 2D 그래픽 렌더링 (비트맵 기반)                            | Metal보다 상위, 하지만 Core Animation보다 하위 |
| **Core Animation** | GPU 가속을 활용한 애니메이션 프레임워크, 뷰의 레이어 관리 | 가장 상위 (UIView/CALayer)                     |

</details>

## Study

- [CABasicAnimation 이란?]()

## Practice

<details>
<summary> CALayer </summary>

<p align="center">
  <table style="width:100%; text-align:center; border-spacing:20px;">
    <tr>
        <td style="text-align:center; vertical-align:middle;">
        <p align="center">
        <img src="https://github.com/BOLTB0X/Core-Animation/blob/main/Img/%EB%AA%A8%EC%84%9C%EB%A6%AC%20%EB%91%A5%EA%B8%80%EA%B2%8C.png?raw=true" 
             alt="image 1" 
             style="width:150px; height:300px; object-fit:contain; border:1px solid #ddd; border-radius:4px;"/>
        </p>
      </td>
        <td style="text-align:center; vertical-align:middle;">
        <p align="center">
        <img src="https://github.com/BOLTB0X/Core-Animation/blob/main/Img/%ED%85%8C%EB%91%90%EB%A6%AC.png?raw=true" 
             alt="image 1" 
             style="width:150px; height:300px; object-fit:contain; border:1px solid #ddd; border-radius:4px;"/>
        </p>
      </td>
      <td style="text-align:center; vertical-align:middle;">
        <p align="center">
        <img src="https://github.com/BOLTB0X/Core-Animation/blob/main/Img/%EA%B7%B8%EB%A6%BC%EC%9D%84%20%EA%B2%B9%EC%B9%A0%EB%95%8C.png?raw=true" 
             alt="image 1" 
             style="width:150px; height:300px; object-fit:contain; border:1px solid #ddd; border-radius:4px;"/>
        </p>
      </td>
            <td style="text-align:center; vertical-align:middle;">
        <p align="center">
        <img src="https://github.com/BOLTB0X/Core-Animation/blob/main/Img/%EC%89%90%EB%8F%84%EC%9A%B0.png?raw=true" 
             alt="image 1" 
             style="width:150px; height:300px; object-fit:contain; border:1px solid #ddd; border-radius:4px;"/>
        </p>
      </td>
    </tr>
    <tr>
      <td style="text-align:center; font-size:14px; font-weight:bold;">
      <p align="center">
      모서리 둥글게
      </p>
      </td>
      <td style="text-align:center; font-size:14px; font-weight:bold;">
      <p align="center">
      테두리 굵게
      </p>
      </td>
      <td style="text-align:center; font-size:14px; font-weight:bold;">
      <p align="center">
      그림 겹치기
      </p>
      </td>
      <td style="text-align:center; font-size:14px; font-weight:bold;">
      <p align="center">
      쉐도우
      </p>
      </td>
    </tr>
  </table>
</p>

1. `UIView` 생성 -> 화면에 표시

   <details>
   <summary> 코드 </summary>

   ```swift
   class AnimationViewController: UIViewController {

       override func viewDidLoad() {
           super.viewDidLoad()

           createUIView(frame: CGRect(x: 40, y: 60, width: 120, height: 80), backgroundColor: .blue)
       }

       // MARK: - createUIView
       private func createUIView(frame: CGRect, backgroundColor: UIColor?) {
           let myView = UIView(frame: frame)
           myView.backgroundColor = backgroundColor
           view.addSubview(myView)
       }
   }
   ```

   </details>

   <br/>

2. `CALayer` -> 모서리를 둥굴게

   <details>
   <summary> 코드 </summary>

   ```swift
   class AnimationViewController: UIViewController {

       override func viewDidLoad() {
           super.viewDidLoad()

           //createUIView(frame: CGRect(x: 40, y: 60, width: 120, height: 80), backgroundColor: .blue)
           createRoundedcorners(frame: CGRect(x: 40, y: 60, width: 120, height: 80),
                                backgroundColor: UIColor.red.cgColor,
                                cornerRadius: 20)
       }

       // ....

       // MARK: - createRoundedcorners
       private func createRoundedcorners(frame: CGRect,
                                         backgroundColor: CGColor?,
                                         cornerRadius: CGFloat) {
           let myLayer = CALayer()
           myLayer.frame = frame
           myLayer.backgroundColor = backgroundColor
           myLayer.cornerRadius = cornerRadius
           view.layer.addSublayer(myLayer) // 뷰의 기본 layer에 추가
       }

   }
   ```

   </details>
   <br/>

3. 여러개의 도형을 겹치거나 그림을 그릴 때

   <details>
   <summary> 코드 </summary>

   ```swift
   // MARK: - createMutiRectangle
   private func createMutiRectangle(_ myLayer: CALayer) {
      let layer1: CALayer = CALayer()
      layer1.frame = .init(x: 10, y: 10, width: 100, height: 100)
      layer1.backgroundColor = UIColor.blue.cgColor
      myLayer.addSublayer(layer1)

      let layer2: CALayer = CALayer()
      layer2.frame = .init(x: 120, y: 10, width: 100, height: 100)
      layer2.backgroundColor = UIColor.green.cgColor
      myLayer.addSublayer(layer2)

      let layer3: CALayer = CALayer()
      layer3.frame = .init(x: 230, y: 10, width: 100, height: 100)
      layer3.backgroundColor = UIColor.yellow.cgColor
      myLayer.addSublayer(layer3)
   }
   ```

   </details>

   <br/>

4. 마스크(masksToBounds) 및 Shadow 효과

   <details>
   <summary> 코드 </summary>

   ```swift
   // MARK: - applyShadow
   private func applyShadow(_ myLayer: CALayer,
                            shadowColor: CGColor?, // 그림자 색상
                            shadowOpacity: Float, // 그림자 불투명도 (0~1)
                            shadowOffset: CGSize, // 그림자 위치
                            shadowRadius: CGFloat) { // 그림자의 흐림 정도
         myLayer.shadowColor = UIColor.black.cgColor
         myLayer.shadowOpacity = 0.5
         myLayer.shadowOffset = CGSize(width: 5, height: 5)
         myLayer.shadowRadius = 10
         myLayer.masksToBounds = false // false여야 그림자가 표시됨
   } // applyShadow
   ```

   ```swift
    // MARK: - createRoundedcorners
    private func createRoundedcorners(frame: CGRect,
                                      backgroundColor: CGColor?,
                                      cornerRadius: CGFloat) {

         // ...

         applyShadow(myLayer,
                     shadowColor: UIColor.black.cgColor,
                     shadowOpacity: 0.5,
                     shadowOffset: CGSize(width: 5, height: 5),
                     shadowRadius: 10) // 추가
    } // createRoundedcorners

    // MARK: - createMutiRectangle
    private func createMutiRectangle(_ myLayer: CALayer) {
         // ...

        applyShadow(layer1,
                    shadowColor: UIColor.blue.cgColor,
                    shadowOpacity: 0.5,
                    shadowOffset: CGSize(width: 5, height: 5),
                    shadowRadius: 10)

         // ...

        applyShadow(layer2,
                    shadowColor: UIColor.green.cgColor,
                    shadowOpacity: 0.5,
                    shadowOffset: CGSize(width: 5, height: 5),
                    shadowRadius: 10)

         // ...

        applyShadow(layer3,
                    shadowColor: UIColor.yellow.cgColor,
                    shadowOpacity: 0.5,
                    shadowOffset: CGSize(width: 5, height: 5),
                    shadowRadius: 10)

    } // createMutiRectangle
   ```

   </details>

   <br/>

</details>

<details>
<summary> CABasicAnimation </summary>

1. **Move 애니메이션**
   <br/>

2. **Shake** , **Scale(opacity)** , **Fade**
   <br/>

</details>

## 참고

- [공식문서 - Core Animation](https://developer.apple.com/documentation/quartzcore)

  - [공식문서 - layer](https://developer.apple.com/documentation/uikit/uiview/layer)
  - [공식문서 - CALayer](https://developer.apple.com/documentation/QuartzCore/CALayer)
  - [공식문서 - UIView](https://developer.apple.com/documentation/uikit/uiview)
  - [공식문서 - CABasicAnimation](https://developer.apple.com/documentation/quartzcore/cabasicanimation#2776772)

- [Core Animation Programming Guide](https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/CoreAnimation_guide/CoreAnimationBasics/CoreAnimationBasics.html#//apple_ref/doc/uid/TP40004514-CH2-SW3)

- [개발자 소들이 - iOS) CALayer 제대로 이해하기](https://babbab2.tistory.com/53)

- [개발자 소들이 - iOS) ClipsToBounds vs MasksToBounds](https://babbab2.tistory.com/47)

- [PinguiOS - CALayer 알아보기 1](https://icksw.tistory.com/181)

- [seokyoungg - CAAnimation](https://seokyoungg.tistory.com/83)
