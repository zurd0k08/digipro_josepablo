//
//  Validation.swift
//  digipro_JosePablo
//
//  Created by Jose Pablo Perez Estrada on 11/22/19.
//  Copyright © 2019 Jose Pablo Perez Estrada. All rights reserved.
//

import Foundation
import UIKit

class Validation {
    public func validateName(name: String) ->Bool {
        var isValidateName = false
        let decimalCharacters = CharacterSet.decimalDigits
        let decimalRange = name.rangeOfCharacter(from: decimalCharacters)
        if ((decimalRange == nil) && (name.count >= 3)) {
            isValidateName = true
        }
        return isValidateName
    }
    
    public func validaPhoneNumber(phoneNumber: String) -> Bool {
        let phoneNumberRegex = "^[1-9]\\d{9}$"
        let trimmedString = phoneNumber.trimmingCharacters(in: .whitespaces)
        let validatePhone = NSPredicate(format: "SELF MATCHES %@", phoneNumberRegex)
        let isValidPhone = validatePhone.evaluate(with: trimmedString)
        return isValidPhone
    }
    
    public func validateEmail(email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let trimmedString = email.trimmingCharacters(in: .whitespaces)
        let validateEmail = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        let isValidateEmail = validateEmail.evaluate(with: trimmedString)
        return isValidateEmail
    }
    
    func validateVoidTextFields(view: UIView) -> Bool {
        var resp = true
        var cont = 0
        var results = [UITextField]()
        for subview in view.subviews as [UIView] {
            if let textField = subview as? UITextField {
                results += [textField]
            }
        }
        for result in results {
            if (result.text == "" || result.text!.count<3){
                cont += 1
            }
        }
        if cont > 0 {
            resp = false
        }
        return resp
    }

    
    
}
