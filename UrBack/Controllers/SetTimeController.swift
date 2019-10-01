//
//  SetTimeController.swift
//  UrBack
//
//  Created by Oleksandr Kovalyshyn on 28.08.2019.
//  Copyright © 2019 Oleksandr Kovalyshyn. All rights reserved.
//

import Foundation
import UIKit

class SetTimeController {
    
    let picker = UIPickerView()
    let hoursAndMinutes = [["00", "01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23"], ["00","10", "20", "30", "40", "50"]]
    let minutes = ["00","10", "20", "30", "40", "50"]
    
    func initPicker(onView: UIView) {
        onView.addSubview(picker)
        picker.translatesAutoresizingMaskIntoConstraints = false
        picker.leadingAnchor.constraint(equalTo: onView.safeAreaLayoutGuide.leadingAnchor).isActive = true
        picker.trailingAnchor.constraint(equalTo: onView.safeAreaLayoutGuide.trailingAnchor).isActive = true
        picker.bottomAnchor.constraint(equalTo: onView.safeAreaLayoutGuide.bottomAnchor).isActive = true
        picker.backgroundColor = .white   
    }
}
