//
//  ViewController.swift
//  LittleTips
//
//  Created by Алина on 03.11.2021.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var segmentControl: UISegmentedControl!
    @IBOutlet var mainLabel: UILabel!
    @IBOutlet var slider: UISlider!
    @IBOutlet var textField: UITextField!
    @IBOutlet var mainButton: UIButton!
    @IBOutlet var datePicker: UIDatePicker!
    @IBOutlet var switchForm: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // MARK: Segmented Control
        segmentControl.insertSegment(withTitle: "Third", at: 2, animated: false)
        // во время вьюДид лоад происходит загрузка потому ент смысла делать тру
        // MARK: Label
        mainLabel.text = ""
        mainLabel.font = mainLabel.font.withSize(30)
        mainLabel.textAlignment = .center
        mainLabel.numberOfLines = 2
        
        // MARK: Slider
        slider.value = 1
        slider.minimumValue = 1
        slider.maximumValue = 100
        slider.minimumTrackTintColor = .yellow
        slider.maximumTrackTintColor = .blue
        slider.thumbTintColor = .red
        
        mainLabel.text = String(slider.value)
        
        // MARK: TextField
        textField.backgroundColor = .white
        textField.keyboardType = .namePhonePad
        
        
        // MARK: Button
        mainButton.layer.cornerRadius = 10 // скругление углов
        mainButton.setTitle("Готово", for: .normal)
        
        // MARK: DatePicker

    }

    @IBAction func segmentedControlAction(_ sender: UISegmentedControl) {
        switch segmentControl.selectedSegmentIndex {
        case 0:
            mainLabel.text = "Выбран сегмент с индексом 0"
            mainLabel.textColor = .red
        case 1:
            mainLabel.text = "Выбран сегмент с индексом 1"
            mainLabel.textColor = .yellow
        case 2:
            mainLabel.text = "Выбран сегмент с индексом 2"
            mainLabel.textColor = .green
        default:
            break
        }
    }
    
    @IBAction func sliderAction(_ sender: UISlider) {
        mainLabel.text = String(Int(slider.value))
    }
    
    @IBAction func mainButtonAction(_ sender: UIButton) {
        guard let text = textField.text, !text.isEmpty else { return }
        mainLabel.text = text
    }
    
    @IBAction func datePickerAction(_ sender: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .full
        mainLabel.text = dateFormatter.string(from: datePicker.date)
    }
    
    @IBAction func toggleElements(_ sender: UISwitch) {
        segmentControl.isHidden = !switchForm.isOn
        mainLabel.isHidden = !switchForm.isOn
        slider.isHidden = !switchForm.isOn
        textField.isHidden = !switchForm.isOn
        mainButton.isHidden = !switchForm.isOn
        datePicker.isHidden = !switchForm.isOn
    }
}

