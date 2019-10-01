//
//  IntervallsControllerClass.swift
//  UrBack
//
//  Created by Oleksandr Kovalyshyn on 28.08.2019.
//  Copyright © 2019 Oleksandr Kovalyshyn. All rights reserved.
//

import Foundation
import UIKit

class IntervallsControllerClass {
    
    let intervals = ["20", "30", "40", "50", "60"]
    
    func changeInterval(increase: Bool, decrease: Bool, inLabel: UILabel) {
        
        let actualValue = inLabel.text
        var actualIndex = findIntevalIndex(value: actualValue!, in: intervals)
        
        if decrease {
            if actualIndex == 0 {
                inLabel.text = intervals.last
                return
            } else {
                inLabel.text = intervals[actualIndex! - 1]
            }
        }
        
        if increase {
            if actualIndex == intervals.count - 1 {
                inLabel.text = intervals.first
                return
            } else {
                inLabel.text = intervals[actualIndex! + 1]
            }
        }
    }
    
    private func findIntevalIndex(value searchValue: String, in array: [String]) -> Int? {
        for (index, value) in array.enumerated() {
            if value == searchValue {
                print(index)
                return index
            }
        }
        return nil
    }
}
