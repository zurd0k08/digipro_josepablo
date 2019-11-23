//
//  FormViewController.swift
//  digipro_JosePablo
//
//  Created by Jose Pablo Perez Estrada on 11/22/19.
//  Copyright © 2019 Jose Pablo Perez Estrada. All rights reserved.
//

import UIKit
import SCLAlertView


class FormViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var lastNameP: UITextField!
    @IBOutlet weak var lastNameM: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var phone: UITextField!
    
    @IBOutlet weak var btnSave: UIButton!
    @IBOutlet weak var viewForm: UIView!
    
    var validation = Validation()
    var form = Forms()
    
    override func viewDidLoad() {
        self.name.delegate = self
        self.lastNameM.delegate = self
        self.lastNameP.delegate = self
        self.email.delegate = self
        self.phone.delegate = self
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if (!validation.validateVoidTextFields(view: viewForm)){
            btnSave.isEnabled = false
        }
    }
    
    @IBAction func nameediting(_ sender: Any) {
        let valido = validation.validateName(name: name.text!) // si true entonces esta bien escrito
        let vacios = validation.validateVoidTextFields(view: viewForm) // si no hay campos vacios entonces resultado = true
        print (vacios)
        print (valido)
        if (valido == true){
            form.changeColorInput(input: name, color: green.cgColor)
        }
        else{
            form.changeColorInput(input: name, color: red.cgColor)
        }
        form.btnStatus(btn: btnSave, status: (valido && vacios) )
    }
    
    @IBAction func lastNameEditing1(_ sender: Any) {
        let valido = validation.validateName(name: lastNameP.text!) // si true entonces esta bien escrito
        let vacios = validation.validateVoidTextFields(view: viewForm) // si hay campos vacios entonces resultado = true
        if (valido == true){
            form.changeColorInput(input: lastNameP, color: green.cgColor)
        }
        else{
            form.changeColorInput(input: lastNameP, color: red.cgColor)
        }
        form.btnStatus(btn: btnSave, status: (valido && vacios) )
       
    }
    
    @IBAction func lastNameEdting2(_ sender: Any) {
        let valido = validation.validateName(name: lastNameM.text!) // si true entonces esta bien escrito
        let vacios = validation.validateVoidTextFields(view: viewForm) // si hay campos vacios entonces resultado = true
        if (valido == true){
            form.changeColorInput(input: lastNameM, color: green.cgColor)
        }
        else{
            form.changeColorInput(input: lastNameM, color: red.cgColor)
        }
        form.btnStatus(btn: btnSave, status: (valido && vacios) )
    }
    
    @IBAction func emailEditing(_ sender: Any) {
        let valido = validation.validateEmail(email: email.text!) // si true entonces esta bien escrito
        let vacios = validation.validateVoidTextFields(view: viewForm) // si hay campos vacios entonces resultado = true
        if (valido == true){
            form.changeColorInput(input: email, color: green.cgColor)
        }
        else{
            form.changeColorInput(input: email, color: red.cgColor)
        }
        form.btnStatus(btn: btnSave, status: (valido && vacios) )
    }
    
    @IBAction func celularEditing(_ sender: Any) {
        let valido = validation.validaPhoneNumber(phoneNumber: phone.text!) // si true entonces esta bien escrito
        let vacios = validation.validateVoidTextFields(view: viewForm) // si hay campos vacios entonces resultado = true
        if (valido == true){
            form.changeColorInput(input: phone, color: green.cgColor)
        }
        else{
            form.changeColorInput(input: phone, color: red.cgColor)
        }
        form.btnStatus(btn: btnSave, status: (valido && vacios) )
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    self.view.endEditing(true)
    return false
    }
    
    @IBAction func guardar(_ sender: Any) {
        let db =  BD()
        if db.insertPeli(nombre: name.text!, apellidoP: lastNameP.text!, apellidoM: lastNameM.text!, telefono: phone.text!, correo: email.text!){
            form.clearInputs(view: viewForm)
            _ = SCLAlertView().showSuccess("Felicidades", subTitle:"Se ha guardado correctamente el usuario", closeButtonTitle:"OK")
        }
    }
    
    
    @IBAction func info(_ sender: Any) {
         _ = SCLAlertView().showInfo("Ayuda", subTitle: "Debes ingresar todos los datos en los campos")
    }
    
    
}
