//
//  Blur.swift
//  MovieBooking
//
//  Created by Le Anh Nguyen on 5/19/24.
//

import SwiftUI

struct Blur : UIViewRepresentable {
    
    var style : UIBlurEffect.Style = .systemMaterial
    
    func makeUIView(context: Context) -> UIVisualEffectView {
        return UIVisualEffectView(effect: UIBlurEffect(style: style))
    }

    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
        uiView.effect = UIBlurEffect(style: style)
    }
}

