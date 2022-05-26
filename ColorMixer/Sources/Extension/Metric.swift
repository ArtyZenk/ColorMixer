//
//  Metric.swift
//  ColorMixer
//
//  Created by Artyom Guzenko on 26.05.2022.
//

import UIKit

extension ColorMixerViewController {
    
    enum Metric {
        static let resultViewCornerRadius: CGFloat = 15
        
        static let titlesStackSpacing: CGFloat = 20
        static let valueStackSpacing: CGFloat = 20
        
        static let redSliderValue: Float = 0.25
        static let greenSliderValue: Float = 0.35
        static let blueSliderValue: Float = 0.45
        
        static let sliderStackSpacing: CGFloat = 15
        static let parentsStackSpacing: CGFloat = 15
        
        static let resultViewTopOfSet: CGFloat = 16
        static let resultViewLeadingOfSet: CGFloat = 16
        static let resultViewTrailingOfSet: CGFloat = -16
        static let resultViewHeightMultiplier: CGFloat = 0.2
        
        static let parentsStackTopOfSet: CGFloat = 16
        static let parentsStackHeightMultiplier: CGFloat = 0.3
        static let parentsStackWidthMultiplier: CGFloat = 0.9
    
    }
    
    enum Strings {
        static let redLabelText = "Red"
        static let greenLabelText = "Green"
        static let blueLabelText = "Blue"
        
    }
}
