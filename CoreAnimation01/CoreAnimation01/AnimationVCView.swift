//
//  AnimationVCView.swift
//  CoreAnimation01
//
//  Created by KyungHeon Lee on 2025/03/23.
//

import SwiftUI
import UIKit

struct AnimationVCView: UIViewControllerRepresentable {
    // MARK: - Protocol
    // ...
    // MARK: - makeUIView
    func makeUIViewController(context: Context) -> AnimationViewController {
        return AnimationViewController()
    }
    
    func updateUIViewController(_ uiViewController: AnimationViewController, context: Context) {
    }
    
}
