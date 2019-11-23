//
//  UsersViewController.swift
//  digipro_JosePablo
//
//  Created by Jose Pablo Perez Estrada on 11/23/19.
//  Copyright © 2019 Jose Pablo Perez Estrada. All rights reserved.
//

import UIKit

class UsersViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    var usuarios = db.getUsers()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        usuarios = db.getUsers()
        tableView.reloadData()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return usuarios.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "cellUser", for: indexPath) as! UsersTableViewCell
        
        cell.userName.text = usuarios[indexPath.row].nombre
        cell.userMail.text = usuarios[indexPath.row].correo
        cell.userPhone.text = usuarios[indexPath.row].telefono
        
        return cell
    }
    

    

}
