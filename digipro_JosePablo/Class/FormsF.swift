//
//  FunctionsForms.swift
//  digipro_JosePablo
//
//  Created by Jose Pablo Perez Estrada on 11/22/19.
//  Copyright © 2019 Jose Pablo Perez Estrada. All rights reserved.
//

import Foundation
import UIKit

class Forms {
    
    public func changeColorInput(input : UITextField, color : CGColor)  {
        input.layer.borderColor = color
        input.layer.borderWidth = 1.0
    }
    
    public func btnStatus(btn : UIButton, status : Bool){
        if status == true {
            btn.isEnabled = true
        }
        else {
            btn.isEnabled = false
        }
    }
    
    func clearInputs(view: UIView) {
        var results = [UITextField]()
        for subview in view.subviews as [UIView] {
            if let textField = subview as? UITextField {
                results += [textField]
            }
        }
        for result in results {
            result.text = ""
        }
    }

}

