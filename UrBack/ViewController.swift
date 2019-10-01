//
//  ViewController.swift
//  UrBack
//
//  Created by Oleksandr Kovalyshyn on 19.08.2019.
//  Copyright © 2019 Oleksandr Kovalyshyn. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    var fromTime: String = ""
    var toTime: String = ""
    var active: Bool = true
    var dayOfActive: String = ""
    let changeIntervals = IntervallsControllerClass.init()
    let setTime = SetTimeController.init()
    var picker = UIPickerView()
    var toolbar = UIToolbar()
    let minutes = ["10", "20", "30", "40", "50", "00"]
    let hours = ["01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "00"]
    var selectedHour = String()
    var selectedMinute = String()
    var onLabel = UILabel()
    
    @IBOutlet weak var topTextLabel: UILabel!
    @IBOutlet weak var daysCounterLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    @IBOutlet weak var intervalLabel: UILabel!
    @IBOutlet weak var intervalTimeLabel: UILabel!
    @IBOutlet weak var decreaseIntervalButton: UIButton!
    @IBOutlet weak var increaseIntervalButton: UIButton!
    @IBOutlet weak var minutesLabel: UILabel!
    @IBOutlet weak var scheduleLabel: UILabel!
    @IBOutlet weak var fromLabel: UILabel!
    @IBOutlet weak var toLabel: UILabel!
    @IBOutlet weak var activateLabel: UILabel!
    @IBOutlet weak var activateSwitch: UISwitch!
    @IBOutlet weak var saveChangesButton: UIButton!
    @IBOutlet var mainView: UIView!
    @IBOutlet weak var fromTimeLabel: UILabel!
    
    @IBAction func decreaseInterval(_ sender: Any) {
        changeIntervals.changeInterval(increase: false, decrease: true, inLabel: intervalTimeLabel)
    }
    
    @IBAction func increaseInterval(_ sender: Any) {
        changeIntervals.changeInterval(increase: true, decrease: false, inLabel: intervalTimeLabel)
    }
    
    @IBAction func fromTimeButton(_ sender: UIButton) {
        showPicker()
        onLabel = fromTimeLabel
    }
    @IBOutlet weak var startTimeView: PeriodTimeView! {
        didSet {
            startTimeView.timeLabel.text = "10:00"
            startTimeView.delegate = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        LocalNotificationManager().schedule()
        intervalTimeLabel.text = changeIntervals.intervals[0]
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 {
            return hours.count
        } else {
            return minutes.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0 {
            return hours[row]
        } else {
            return minutes[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if component == 0 {
            selectedHour = hours[row]
        } else {
            selectedMinute = minutes[row]
        }
        onLabel.text = "\(selectedHour):\(selectedMinute)"
        print(fromTimeLabel.text)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func showPicker() {
        
        picker = UIPickerView.init()
        picker.delegate = self as! UIPickerViewDelegate
        picker.dataSource = self as! UIPickerViewDataSource
        picker.backgroundColor = UIColor.white
        picker.setValue(UIColor.black, forKey: "textColor")
        picker.autoresizingMask = .flexibleWidth
        picker.contentMode = .center
        picker.frame = CGRect.init(x: 0.0, y: UIScreen.main.bounds.size.height - 300, width: UIScreen.main.bounds.size.width, height: 300)
        self.view.addSubview(picker)
        let tapGestureRecognizer: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(hidePicker))
        view.addGestureRecognizer(tapGestureRecognizer)
        
        
    }
    
    @objc func hidePicker() {
        picker.removeFromSuperview()
    }
    
    func setStartTime(_ time: String?) {
        startTimeView.timeLabel.text = time
    }
}

extension ViewController: PeriodTimeViewDelegate {
    func periodTimeViewSelectDate(_ sender: PeriodTimeView) {
        switch sender {
        case startTimeView:
            showPicker()
//        case endTimeView:
//            showPicker()
        default:
            break
        }
    }
    
}
