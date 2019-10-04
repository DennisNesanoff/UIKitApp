//
//  ViewController.swift
//  UIKitApp
//
//  Created by Dennis Nesanoff on 03/10/2019.
//  Copyright © 2019 Dennis Nesanoff. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var segmentedControl: UISegmentedControl!
    @IBOutlet var mainLabel: UILabel!
    @IBOutlet var slider: UISlider!
    @IBOutlet var textField: UITextField!
    @IBOutlet var button: UIButton!
    @IBOutlet var datePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Setup mail label
        mainLabel.font = mainLabel.font.withSize(25)
        mainLabel.textAlignment = .center
        mainLabel.numberOfLines = 2
        
        // Setup segmented control
        segmentedControl.insertSegment(withTitle: "Third", at: 2, animated: false)
        
        // Setup slider
        slider.value = 1
        slider.minimumValue = 0
        slider.maximumValue = 1
        slider.minimumTrackTintColor = .yellow
        slider.maximumTrackTintColor = .red
        slider.thumbTintColor = .green
        
        mainLabel.text = String(slider.value)
        
        datePicker.locale = Locale(identifier: "ru_RU")
        
//        datePicker.locale = Locale.current
    }

    @IBAction func changeSegment() {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            mainLabel.text = "The first segment is selected"
            mainLabel.textColor = .red
        case 1:
            mainLabel.text = "The second segment is selected"
            mainLabel.textColor = .green
        case 2:
            mainLabel.text = "The third segment is selected"
            mainLabel.textColor = .orange
        default:
            break
        }
    }
    
    @IBAction func changeSlider() {
        let backgroundColor = view.backgroundColor
        view.backgroundColor = backgroundColor?.withAlphaComponent(CGFloat(slider.value))
        mainLabel.text = String(slider.value)
    }
    
    @IBAction func doneButtonPressed() {
        guard let inputText = textField.text, !inputText.isEmpty else { return }
        if let _ = Double(inputText) {
            showAlert(title: "Wrong format", message: "Please, input your name!")
        } else {
            mainLabel.text = textField.text
            textField.text = nil
        }
    }
    
    @IBAction func datePickerChanged() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        dateFormatter.locale = Locale(identifier: "ru_RU")
        
        let dateValue = dateFormatter.string(from: datePicker.date)
        mainLabel.text = dateValue
    }
}


extension ViewController {
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert)
        let okAction = UIAlertAction(
            title: "OK",
            style: .default) { _ in
                self.textField.text = nil
        }
        alert.addAction(okAction)
        
        present(alert, animated: true)
    }
}
