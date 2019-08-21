//
//  ViewController.swift
//  UrBack
//
//  Created by Oleksandr Kovalyshyn on 19.08.2019.
//  Copyright © 2019 Oleksandr Kovalyshyn. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
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
    @IBOutlet weak var fromTimeButton: UIButton!
    @IBOutlet weak var toTimeButton: UIButton!
    @IBOutlet weak var activateLabel: UILabel!
    @IBOutlet weak var activateSwitch: UISwitch!
    @IBOutlet weak var saveChangesButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

