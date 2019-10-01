//
//  PeriodTimeView.swift
//  UrBack
//
//  Created by Oleksandr Kovalyshyn on 01.10.2019.
//  Copyright © 2019 Oleksandr Kovalyshyn. All rights reserved.
//

import UIKit

protocol PeriodTimeViewDelegate: AnyObject {
    func periodTimeViewSelectDate(_ sender: PeriodTimeView)
}

class PeriodTimeView: UIView {
    
    var view: UIView!
    var time: String?
    
    weak var delegate: PeriodTimeViewDelegate?
    
    @IBOutlet weak var timeLabel: UILabel!
    
    
    
    func xibSetup() {
        view = loadViewFromNib()
        view.frame = bounds
        view.translatesAutoresizingMaskIntoConstraints = true
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        addSubview(view)
    }
    
    func loadViewFromNib() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib.init(nibName: String(describing: type(of: bundle)), bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        return view
    }
    
    
    @IBAction func timeContainerTapAction(_ sender: UITapGestureRecognizer) {
        delegate?.periodTimeViewSelectDate(self)
    }
}

extension PeriodTimeView {
    func Configure() {
        timeLabel.text = time
    }
}
