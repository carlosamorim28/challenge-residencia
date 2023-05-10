//
//  RegisterManager.swift
//  armazenador de senhas
//
//  Created by userext on 10/05/23.
//

import Foundation

class RegisterManager{
    var registers: [Register]
    
    init(){
        registers = []
    }
    
    func manualCreatePassword(usuario: String, senha: String, url: String){
        
    }
    
    func generatePassword(digits: Int) -> String{
        return ""
    }
    
    func automaticCreatePassword(usuario: String,automaticPassword: String, url: String){
        
    }
    
    func removePassword(removed: String){
        
    }
    
    func viewAllPasswords(){
        
    }
}
