//
//  MainViewController.swift
//  TimerProgrammatically
//
//  Created by Pavlov Matvey on 21.11.2022.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var myTimer = [MyTimer]()
    
    private let titleLabel: UILabel = {
        let label = PaddingLabel()
        label.text = "Add Timer"
        label.font = UIFont.preferredFont(forTextStyle: .headline)
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
        field.translatesAutoresizingMaskIntoConstraints = false
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
        field.keyboardType = UIKeyboardType.numberPad
        field.translatesAutoresizingMaskIntoConstraints = false
        return field
    }()
    
    private lazy var timerButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor(red: 0.8, green: 0.8, blue: 0.8, alpha: 0.5)
        button.setTitle("Launch Timer", for: .normal)
        button.setTitleColor(UIColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 1), for: .normal)
        button.titleLabel?.font = UIFont.preferredFont(forTextStyle: .headline)
        button.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 15, leading: 0, bottom: 15, trailing: 0)
        button.addTarget(self, action: #selector(action), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 20
        return button
    }()
    
    let tableView: UITableView = {
        let view = UITableView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.register(TableViewCell.self, forCellReuseIdentifier: "Cell")
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        
        tableView.register(TableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView.cellLayoutMarginsFollowReadableWidth = true
        tableView.delegate = self
        tableView.dataSource = self
        
        let tapGesture = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tapGesture)
    }
    
    private func setupView() {
        view.addSubview(titleLabel)
        view.addSubview(timerName)
        view.addSubview(timerCount)
        view.addSubview(timerButton)
        view.addSubview(tableView)
        
        let margins = view.layoutMarginsGuide
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: margins.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            timerName.topAnchor.constraint(equalToSystemSpacingBelow: titleLabel.bottomAnchor, multiplier: 1),
            timerName.leadingAnchor.constraint(equalTo: margins.leadingAnchor),
            timerName.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.75),
            timerName.heightAnchor.constraint(equalTo: titleLabel.heightAnchor, multiplier: 0.65),
            
            timerCount.topAnchor.constraint(equalToSystemSpacingBelow: timerName.bottomAnchor, multiplier: 1),
            timerCount.leadingAnchor.constraint(equalTo: margins.leadingAnchor),
            timerCount.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.75),
            timerCount.heightAnchor.constraint(equalTo: timerName.heightAnchor),

            timerButton.topAnchor.constraint(equalToSystemSpacingBelow: timerCount.bottomAnchor, multiplier: 1),
            timerButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            timerButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
            timerButton.heightAnchor.constraint(equalTo: titleLabel.heightAnchor),
            
            tableView.topAnchor.constraint(equalToSystemSpacingBelow: timerButton.bottomAnchor, multiplier:1),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myTimer.count
   }
   
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? TableViewCell else { fatalError() }
        cell.nameLabel.text = myTimer[indexPath.row].name
        if myTimer[indexPath.row].min! > 9 {
            if myTimer[indexPath.row].sec! > 9 {
                cell.timeLabel.text = "\(myTimer[indexPath.row].min!):\(myTimer[indexPath.row].sec!)"
            } else {
                cell.timeLabel.text = "\(myTimer[indexPath.row].min!):0\(myTimer[indexPath.row].sec!)"
            }
        } else {
            if myTimer[indexPath.row].sec! > 9 {
                cell.timeLabel.text = "0\(myTimer[indexPath.row].min!):\(myTimer[indexPath.row].sec!)"
            } else {
                cell.timeLabel.text = "0\(myTimer[indexPath.row].min!):0\(myTimer[indexPath.row].sec!)"
            }
        }
       return cell
   }
    
    @objc func action() {
        if !timerName.text!.isEmpty {
            if !timerCount.text!.isEmpty {
                if timerCount.text!.containsOnlyNumbers {
                    addTimer(name: timerName.text!, time: Int(timerCount.text!)!)
                    return
                }
            }
        }
        let ac = UIAlertController(title: "Error", message: "Incorrect timer", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .cancel))
        present(ac, animated: true)
    }
    
    func addTimer(name: String, time: Int) {
        myTimer.insert(MyTimer(name: name, time: time, vc: self), at: 0)
        myTimer.first?.setTimer()
        myTimer.sort { $0.time > $1.time }
        tableView.reloadData()
        timerName.text = ""
        timerCount.text = ""
        view.endEditing(true)
    }
    
    func deleteCell(){
        myTimer.removeLast()
        tableView.reloadData()
    }
    
    func updateView() {
        myTimer.sort { $0.time > $1.time }
        tableView.reloadData()
    }
}

extension String {
    var containsOnlyNumbers: Bool {
        let digitsCharacters = CharacterSet(charactersIn: "0123456789")
        return CharacterSet(charactersIn: self).isSubset(of: digitsCharacters)
    }
}
