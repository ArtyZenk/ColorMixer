//
//  ViewController.swift
//  ColorMixer
//
//  Created by Artyom Guzenko on 26.05.2022.
//

import UIKit

class ColorMixerViewController: UIViewController {
    // MARK: - Elements
    
    private lazy var resultView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .red
        view.layer.cornerRadius = 15
        return view
    }()
    
    private lazy var redLabel: UILabel = {
        let label = UILabel()
        label.text = "Red"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var greenLabel: UILabel = {
        let label = UILabel()
        label.text = "Green"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var blueLabel: UILabel = {
        let label = UILabel()
        label.text = "Blue"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var titlesStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 20
        return stack
    }()
    
    private lazy var redValueLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var greenValueLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var blueValueLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var valueStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 20
        return stack
    }()
    
    private lazy var redSlider: UISlider = {
        let slider = UISlider()
        slider.translatesAutoresizingMaskIntoConstraints = false
        return slider
    }()
    
    private lazy var greenSlider: UISlider = {
        let slider = UISlider()
        slider.translatesAutoresizingMaskIntoConstraints = false
        return slider
    }()
    
    private lazy var blueSlider: UISlider = {
        let slider = UISlider()
        slider.translatesAutoresizingMaskIntoConstraints = false
        return slider
    }()
    
    private lazy var sliderStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 20
        return stack
    }()
    
    private lazy var parentsStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 20
        return stack
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupHierarch()
        
        
        setupView()
    }
    
    override func viewDidLayoutSubviews() {
        setupLayout()
    }
}

extension ColorMixerViewController {
    private func setupHierarch() {
    }
    
    private func setupLayout() {
        titlesStack.addArrangedSubview(redLabel)
        titlesStack.addArrangedSubview(greenLabel)
        titlesStack.addArrangedSubview(blueLabel)
        
        valueStack.addArrangedSubview(redValueLabel)
        valueStack.addArrangedSubview(greenValueLabel)
        valueStack.addArrangedSubview(blueValueLabel)
        
        sliderStack.addArrangedSubview(redSlider)
        sliderStack.addArrangedSubview(greenSlider)
        sliderStack.addArrangedSubview(blueSlider)
        
        parentsStack.addArrangedSubview(titlesStack)
        parentsStack.addArrangedSubview(valueStack)
        parentsStack.addArrangedSubview(sliderStack)
        
        NSLayoutConstraint.activate([
            resultView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            resultView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            resultView.widthAnchor.constraint(equalToConstant: 300),
            resultView.heightAnchor.constraint(equalToConstant: 300)

        ])
        
    }
    
    private func setupView() {
        view.backgroundColor = .blue
        view.addSubview(resultView)
//        view.addSubview(parentsStack)
    }
}
