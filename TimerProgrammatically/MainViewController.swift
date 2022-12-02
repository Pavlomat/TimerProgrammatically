//
//  MainViewController.swift
//  TimerProgrammatically
//
//  Created by Pavlov Matvey on 21.11.2022.
//

import UIKit

class MainViewController: UIViewController {
    
    private let titleLabel: UILabel = {
        let label = PaddingLabel()
        label.text = "Add timer"
        label.font = UIFont.preferredFont(forTextStyle: .body)
        label.adjustsFontForContentSizeCategory = true
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = UIColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 1)
        label.backgroundColor = UIColor(red: 0.8, green: 0.8, blue: 0.8, alpha: 0.5)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.top = 15
        label.bottom = 15
        return label
    }()
    
    private let timerName: UITextField = {
        let field = UITextField()
        field.font = UIFont.preferredFont(forTextStyle: .body)
        field.adjustsFontForContentSizeCategory = true
        field.placeholder = "Set timer name"
        field.textColor = .black
        field.borderStyle = UITextField.BorderStyle.roundedRect
        field.clearButtonMode = UITextField.ViewMode.whileEditing
        field.keyboardType = UIKeyboardType.default
        return field
    }()
    
    private let timerCount: UITextField = {
        let field = UITextField()
        field.font = UIFont.preferredFont(forTextStyle: .body)
        field.adjustsFontForContentSizeCategory = true
        field.placeholder = "Set timer in seconds"
        field.textColor = .black
        field.borderStyle = UITextField.BorderStyle.roundedRect
        field.clearButtonMode = UITextField.ViewMode.whileEditing
        field.keyboardType = UIKeyboardType.default
        return field
    }()
    
    private let timerButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .label
        button.setTitle("Launch Timer", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.preferredFont(forTextStyle: .body)
        button.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 15, leading: 0, bottom: 15, trailing: 0)
        button.addTarget(MainViewController.self, action: #selector(launchTimer), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        view.addSubview(titleLabel)
        view.addSubview(timerName)
        view.addSubview(timerCount)
        
        let margins = view.layoutMarginsGuide
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: margins.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            timerName.topAnchor.constraint(equalToSystemSpacingBelow: titleLabel.bottomAnchor, multiplier: 1),
            timerName.leadingAnchor.constraint(equalTo: margins.leadingAnchor),
            timerName.trailingAnchor.constraint(equalTo: margins.trailingAnchor),
            
            timerCount.topAnchor.constraint(equalToSystemSpacingBelow: timerName.bottomAnchor, multiplier: 1),
            timerCount.leadingAnchor.constraint(equalTo: margins.leadingAnchor),
            timerCount.trailingAnchor.constraint(equalTo: margins.trailingAnchor),
            timerCount.heightAnchor.constraint(equalTo: timerName.heightAnchor)
        ])
    }
    
    @objc private func launchTimer() {
        print("Fire")
    }
}
