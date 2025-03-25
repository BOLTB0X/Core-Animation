//
//  ViewController.swift
//  CoreAnimation01
//
//  Created by KyungHeon Lee on 2025/03/23.
//

import UIKit

class AnimationViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //createUIView(frame: CGRect(x: 40, y: 60, width: 120, height: 80), backgroundColor: .blue)
        createRoundedcorners(frame: CGRect(x: 10, y: 150, width: 350, height: 300),
                             backgroundColor: UIColor.red.cgColor,
                             cornerRadius: 20)
    }
    
    // MARK: - createUIView
    private func createUIView(frame: CGRect, backgroundColor: UIColor?) {
        let myView = UIView(frame: frame)
        myView.backgroundColor = backgroundColor
        view.addSubview(myView)
    } // createUIView
    
    // MARK: - createRoundedcorners
    private func createRoundedcorners(frame: CGRect,
                                      backgroundColor: CGColor?,
                                      cornerRadius: CGFloat) {
        let myLayer = CALayer()
        myLayer.frame = frame
        myLayer.backgroundColor = backgroundColor
        myLayer.cornerRadius = cornerRadius
        myLayer.borderColor = UIColor.black.cgColor
        myLayer.borderWidth = 5
        view.layer.addSublayer(myLayer) // 뷰의 기본 layer에 추가
        
//        createMutiRectangle(myLayer)
//        applyShadow(myLayer,
//                    shadowColor: UIColor.black.cgColor,
//                    shadowOpacity: 0.5,
//                    shadowOffset: CGSize(width: 5, height: 5),
//                    shadowRadius: 10)
        
        //applyPositionChange(to: myLayer)
        //applyMoveAnimation(to: myLayer)
        //applyMoveAnimationWithFillMode(to: myLayer)
        applyRotation(to: myLayer)
    } // createRoundedcorners
    
    // MARK: - createMutiRectangle
    private func createMutiRectangle(_ myLayer: CALayer) {
        let layer1: CALayer = CALayer()
        layer1.frame = .init(x: 10, y: 10, width: 100, height: 100)
        layer1.backgroundColor = UIColor.blue.cgColor
        myLayer.addSublayer(layer1)
        applyShadow(layer1,
                    shadowColor: UIColor.blue.cgColor,
                    shadowOpacity: 0.5,
                    shadowOffset: CGSize(width: 5, height: 5),
                    shadowRadius: 10)
        applyShakeAnimation(to: layer1)
        
        let layer2: CALayer = CALayer()
        layer2.frame = .init(x: 120, y: 10, width: 100, height: 100)
        layer2.backgroundColor = UIColor.green.cgColor
        myLayer.addSublayer(layer2)
        applyShadow(layer2,
                    shadowColor: UIColor.green.cgColor,
                    shadowOpacity: 0.5,
                    shadowOffset: CGSize(width: 5, height: 5),
                    shadowRadius: 10)
        applyScaleAnimation(to: layer2)
        
        let layer3: CALayer = CALayer()
        layer3.frame = .init(x: 230, y: 10, width: 100, height: 100)
        layer3.backgroundColor = UIColor.yellow.cgColor
        myLayer.addSublayer(layer3)
        applyShadow(layer3,
                    shadowColor: UIColor.yellow.cgColor,
                    shadowOpacity: 0.5,
                    shadowOffset: CGSize(width: 5, height: 5),
                    shadowRadius: 10)
        applyFadeAnimation(to: layer3)
        
    } // createMutiRectangle
    
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
}

extension AnimationViewController {
    // MARK: - applyPositionChange
    private func applyPositionChange(to layer: CALayer) {
        let animation = CABasicAnimation(keyPath: "position.x")
        animation.fromValue = 0
        animation.toValue = self.view.bounds.width
        animation.duration = 1.0
        layer.add(animation, forKey: nil)
    } //
    
    // MARK: - applyMoveAnimation
    private func applyMoveAnimation(to layer: CALayer) {
        let animation = CABasicAnimation(keyPath: "position")
        animation.fromValue = CGPoint(x: 50, y: 50)  // 시작
        animation.toValue = CGPoint(x: 200, y: 200) // 종료
        animation.duration = 1.5
        animation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut) // 속도 조절
        animation.repeatCount = Float.infinity      // 무한 반복
        animation.autoreverses = true               // 애니메이션이 끝나면 반대로 실행

        layer.add(animation, forKey: "move")
    }
    
    // MARK: - applyShakeAnimation
    private func applyShakeAnimation(to layer: CALayer) {
        let animation = CABasicAnimation(keyPath: "position.x")
        animation.fromValue = layer.position.x - 5
        animation.toValue = layer.position.x + 5
        animation.duration = 0.1
        animation.repeatCount = Float.infinity
        animation.autoreverses = true
        layer.add(animation, forKey: "shake")
    } // applyShakeAnimation
    
    // MARK: - applyScaleAnimation
    private func applyScaleAnimation(to layer: CALayer) {
        let animation = CABasicAnimation(keyPath: "transform.scale")
        animation.fromValue = 1.0
        animation.toValue = 1.2
        animation.duration = 0.8
        animation.repeatCount = Float.infinity
        animation.autoreverses = true
        layer.add(animation, forKey: "scale")
    } // applyScaleAnimation
    
    // MARK: - applyFadeAnimation
    private func applyFadeAnimation(to layer: CALayer) {
        let animation = CABasicAnimation(keyPath: "opacity")
        animation.fromValue = 1.0
        animation.toValue = 0.3
        animation.duration = 1.5
        animation.repeatCount = Float.infinity
        animation.autoreverses = true
        layer.add(animation, forKey: "fade")
    } // applyFadeAnimation
    
    // MARK: - applyMoveAnimationWithFillMode
    private func applyMoveAnimationWithFillMode(to layer: CALayer) {
        let moveAnimation = CABasicAnimation(keyPath: "position")
        moveAnimation.fromValue = CGPoint(x: 50, y: 50)
        moveAnimation.toValue = CGPoint(x: 200, y: 200)
        moveAnimation.duration = 1.5
        moveAnimation.fillMode = .forwards // 종료 후 최종 상태 유지
        moveAnimation.isRemovedOnCompletion = true

        layer.add(moveAnimation, forKey: "move")
        return
    }
    
    // MARK: - applyRotation
    private func applyRotation(to layer: CALayer) {
        let animation = CABasicAnimation(keyPath: "transform.rotation.z")
        animation.fromValue = 0 // 시작 각도 (라디안)
        animation.toValue = CGFloat.pi * 2 // 360도 회전 (2π 라디안)
        animation.duration = 1.0 // 1초 동안 회전
        animation.repeatCount = Float.infinity // 무한 반복
        layer.add(animation, forKey: "rotation")
    }
}
