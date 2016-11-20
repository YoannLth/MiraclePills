//
//  ViewController.swift
//  MiraclePills
//
//  Created by yoann lathuiliere on 19/11/2016.
//  Copyright © 2016 ylth. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

  @IBOutlet weak var nameTextField: UITextField!
  @IBOutlet weak var adressTextField: UITextField!
  @IBOutlet weak var cityTextField: UITextField!
  @IBOutlet weak var statePicker: UIPickerView!
  @IBOutlet weak var chooseYourStateButton: UIButton!
  @IBOutlet weak var countryLabel: UILabel!
  @IBOutlet weak var countryTextField: UITextField!
  @IBOutlet weak var zipCodeLabel: UILabel!
  @IBOutlet weak var zipCodeTextField: UITextField!
  @IBOutlet weak var buyNowButton: UIButton!
  @IBOutlet weak var sucessImage: UIImageView!
  
  var states = ["Alabama","Alaska","Arizona","Arkansas","California","Colorado","Connecticut","Delaware","Florida","Georgia","Hawaii","Idaho","Illinois","Indiana","Iowa","Kansas","Kentucky","Louisiana","Maine","Maryland","Massachusetts","Michigan","Minnesota","Mississippi","Missouri","Montana","Nebraska","Nevada","New Hampshire","New Jersey","New Mexico","New York","North Carolina","North Dakota","Ohio","Oklahoma","Oregon","Pennsylvania","Rhode Island","South Carolina","South Dakota","Tennessee","Texas","Utah","Vermont","Virginia","Washington","West Virginia","Wisconsin","Wyoming"]
  
  override func viewDidLoad() {
    super.viewDidLoad()
    states = states.sorted { $0.localizedCaseInsensitiveCompare($1) == ComparisonResult.orderedAscending }
    statePicker.dataSource = self
    statePicker.delegate = self
    sucessImage.isHidden = true
    
    nameTextField.addTarget(nil, action:Selector(("firstResponderAction:")), for:.editingDidEndOnExit)
    adressTextField.addTarget(nil, action:Selector(("firstResponderAction:")), for:.editingDidEndOnExit)
    cityTextField.addTarget(nil, action:Selector(("firstResponderAction:")), for:.editingDidEndOnExit)
    countryTextField.addTarget(nil, action:Selector(("firstResponderAction:")), for:.editingDidEndOnExit)
    zipCodeTextField.addTarget(nil, action:Selector(("firstResponderAction:")), for:.editingDidEndOnExit)
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  @IBAction func chooseYourStateButtonPressed(_ sender: Any) {
    statePicker.isHidden = false
    countryLabel.isHidden = true
    countryTextField.isHidden = true
    zipCodeLabel.isHidden = true
    zipCodeTextField.isHidden = true
    buyNowButton.isHidden = true
    
  }

  @IBAction func buyNowButtonPressed(_ sender: Any) {
    for view in self.view.subviews as [UIView]{
      view.isHidden = true
    }
    sucessImage.isHidden = false
  }
  
  func numberOfComponents(in pickerView: UIPickerView) -> Int {
    return 1
  }
  
  func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    return states.count
  }
  
  func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
    return states[row]
  }
  
  func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    chooseYourStateButton.setTitle(states[row], for: UIControlState.normal)
    statePicker.isHidden = true
    countryLabel.isHidden = false
    countryTextField.isHidden = false
    zipCodeLabel.isHidden = false
    zipCodeTextField.isHidden = false
    buyNowButton.isHidden = false
  }
}

