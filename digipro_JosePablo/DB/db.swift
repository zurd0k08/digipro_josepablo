//
//  db.swift
//
//
//  Created by Jose Pablo Perez Estrada on 11/5/19.
//  Copyright © 2019 Jose Pablo Perez Estrada. All rights reserved.
//


import Foundation
import SQLite3

class BD {
    var db : OpaquePointer?
    var stmt : OpaquePointer?
    
    init() {
        crearBD()
        let fileURL = try!
            FileManager.default.url (for: .documentDirectory, in: .userDomainMask, appropriateFor : nil, create : false ).appendingPathComponent("usr.sqlite")
        if sqlite3_open(fileURL.path, &db) != SQLITE_OK{
            print ("no se pude abrir la base de datos")
        }else {//print ("se abrio la bd")
            
        }
    }
    
    struct datos {
        var nombre : String
        var apellidoP : String
        var apellidoM : String
        var telefono : String
        var correo : String
    }
    
    
    func crearBD (){
        let fileURL = try!
            FileManager.default.url (for: .documentDirectory, in: .userDomainMask, appropriateFor : nil, create : false ).appendingPathComponent("usr.sqlite")
        if sqlite3_open(fileURL.path, &db) != SQLITE_OK{
            print ("no se pude abrir la base de datos")
        }
        let createTableQuery = "CREATE TABLE IF NOT EXISTS usuarios (nombre CHAR(48), apellidoP CHAR(48), apellidoM CHAR(48), telefono CHAR(10), correo CHAR(64))"
        if sqlite3_exec(db, createTableQuery, nil, nil, nil) != SQLITE_OK {
            print ("error al crear la table ")
        }
        else {
            print ("se creo la table \"usuarios \" ")
            
        }
        sqlite3_close(db)
    }
    
    
    func insertPeli(nombre : String, apellidoP : String, apellidoM : String, telefono : String, correo : String)->Bool{
        var insertCompletado = false
        let nombreL: NSString = nombre as NSString
        let apellidoPL: NSString = apellidoP as NSString
        let apellidoML: NSString = apellidoM as NSString
        let telefonoL: NSString = telefono as NSString
        let correoL: NSString = correo as NSString
        
        let insertQuery = "INSERT INTO usuarios (nombre , apellidoP , apellidoM , telefono , correo ) VALUES (?, ?, ?, ?, ?)"
        if sqlite3_prepare(db, insertQuery, -1, &stmt, nil) != SQLITE_OK {
            print ("binding query")
        }
        if sqlite3_bind_text(stmt, 1, nombreL.utf8String, -1, nil) == SQLITE_OK{
            print ("se cargo correctamente  nombre")
        }
        if sqlite3_bind_text(stmt, 2, apellidoPL.utf8String, -1, nil) == SQLITE_OK{
            print ("se cargo correctamente  apellidoP")
        }
        if sqlite3_bind_text(stmt, 3, apellidoML.utf8String, -1, nil) == SQLITE_OK{
            print ("se cargo correctamente apellidoM")
        }
        if sqlite3_bind_text(stmt, 4, telefonoL.utf8String, -1, nil) == SQLITE_OK{
            print ("se cargo correctamente  telefono")
        }
        if sqlite3_bind_text(stmt, 5, correoL.utf8String, -1, nil) == SQLITE_OK{
            print ("se cargo correctamente  correo")
        }
      
      
        if sqlite3_step(stmt) == SQLITE_DONE{
            print ("se guardo correctamente el usuario")
            insertCompletado = true
        }
        sqlite3_close(db)
        return insertCompletado
    }
    
    
    func getUsers() -> [datos] {
        var usuarios : [datos] = []
        let selectQuery = "SELECT * FROM usuarios "
        var queryStatement: OpaquePointer? = nil
        if sqlite3_prepare_v2(db, selectQuery , -1, &queryStatement, nil) == SQLITE_OK {
            while (sqlite3_step(queryStatement) == SQLITE_ROW ){
                
                let queryResultCol1 = sqlite3_column_text(queryStatement, 0)
                let queryResultCol2 = sqlite3_column_text(queryStatement, 1)
                let queryResultCol3 = sqlite3_column_text(queryStatement, 2)
                let queryResultCol4 = sqlite3_column_text(queryStatement, 3)
                let queryResultCol5 = sqlite3_column_text(queryStatement, 4)
               
                let nombre = String(cString: queryResultCol1!)
                let apellidoP = String(cString: queryResultCol2!)
                let apellidoM = String(cString: queryResultCol3!)
                let telefono = String(cString: queryResultCol4!)
                let correo = String(cString: queryResultCol5!)
                
                usuarios.append(datos(nombre: nombre, apellidoP: apellidoP,apellidoM : apellidoM, telefono: telefono,correo: correo ))
            }
        }
        else {
            print("No se pudo hacer la consulta del carrito de compras")
        }
        sqlite3_finalize(queryStatement)
        return usuarios
    }
    
    
  
    
    
   
    
    
    

    
    
    
}
