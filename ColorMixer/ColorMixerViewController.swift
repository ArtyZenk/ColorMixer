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
        view.layer.cornerRadius = 15
        return view
    }()
    
    private lazy var redLabel: UILabel = {
        let label = UILabel()
        label.text = "Red"
        return label
    }()
    
    private lazy var greenLabel: UILabel = {
        let label = UILabel()
        label.text = "Green"
        return label
    }()
    
    private lazy var blueLabel: UILabel = {
        let label = UILabel()
        label.text = "Blue"
        return label
    }()
    
    private lazy var titlesStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 20
        return stack
    }()
    
    private lazy var redValueLabel: UILabel = {
        let label = UILabel()
        label.text = "0.0"
        return label
    }()
    
    private lazy var greenValueLabel: UILabel = {
        let label = UILabel()
        label.text = String(redSlider.value)
        return label
    }()
    
    private lazy var blueValueLabel: UILabel = {
        let label = UILabel()
        label.text = "0.0"
        return label
    }()
    
    private lazy var valueStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 20
        return stack
    }()
    
    private lazy var redSlider: UISlider = {
        let slider = UISlider()
        slider.addTarget(self, action: #selector(setColor), for: .valueChanged)
        slider.value = 0.25
        slider.minimumTrackTintColor = .red
        return slider
    }()
    
    private lazy var greenSlider: UISlider = {
        let slider = UISlider()
        slider.addTarget(self, action: #selector(setColor), for: .valueChanged)
        slider.value = 0.45
        slider.minimumTrackTintColor = .green
        return slider
    }()
    
    private lazy var blueSlider: UISlider = {
        let slider = UISlider()
        slider.addTarget(self, action: #selector(setColor), for: .valueChanged)
        slider.value = 0.55
        slider.minimumTrackTintColor = .blue
        return slider
    }()
    
    private lazy var sliderStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 15
        return stack
    }()
    
    private lazy var parentsStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 15
        stack.alignment = .center
        return stack
    }()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupHierarch()
        setupView()
    }
    
    override func viewDidLayoutSubviews() {
        setupLayout()
    }
}

// MARK: - Private methods
extension ColorMixerViewController {
    
    private func setupHierarch() {
        view.addSubview(resultView)
        view.addSubview(parentsStack)
    }
    
    private func setupLayout() {
        resultView.translatesAutoresizingMaskIntoConstraints = false
        
        redLabel.translatesAutoresizingMaskIntoConstraints = false
        greenLabel.translatesAutoresizingMaskIntoConstraints = false
        blueLabel.translatesAutoresizingMaskIntoConstraints = false
        
        titlesStack.translatesAutoresizingMaskIntoConstraints = false
        
        redValueLabel.translatesAutoresizingMaskIntoConstraints = false
        greenValueLabel.translatesAutoresizingMaskIntoConstraints = false
        blueValueLabel.translatesAutoresizingMaskIntoConstraints = false
        
        valueStack.translatesAutoresizingMaskIntoConstraints = false
        
        redSlider.translatesAutoresizingMaskIntoConstraints = false
        greenSlider.translatesAutoresizingMaskIntoConstraints = false
        blueSlider.translatesAutoresizingMaskIntoConstraints = false
        
        parentsStack.translatesAutoresizingMaskIntoConstraints = false
        
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
            resultView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            resultView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            resultView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.2),
            
            parentsStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            parentsStack.topAnchor.constraint(equalTo: resultView.bottomAnchor, constant: 16),
            parentsStack.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.3),
            parentsStack.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9),
            
            valueStack.widthAnchor.constraint(equalToConstant: 40)
        ])
        
    }
    
    private func setupView() {
        view.backgroundColor = .systemBlue
        setColor()
        setValue(for: redValueLabel, greenValueLabel, blueValueLabel)
    }
    
    @objc private func setColor() {
        resultView.backgroundColor = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1
        )
        
        setValue(for: redValueLabel, greenValueLabel, blueValueLabel)
    }
    
    private func string(from slider: UISlider) -> String {
        String(format: "%.2f", slider.value)
    }
    
    private func setValue(for labels: UILabel...) {
        labels.forEach { label in
            switch label {
            case redValueLabel:
                redValueLabel.text = string(from: redSlider)
            case greenValueLabel:
                greenValueLabel.text = string(from: greenSlider)
            default:
                blueValueLabel.text = string(from: blueSlider)
            }
        }
    }
}
