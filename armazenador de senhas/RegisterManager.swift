//
//  RegisterManager.swift
//  armazenador de senhas
//
//  Created by userext on 10/05/23.
//

import Foundation

final class RegisterManager{
    var registers: [Register] = []
    var nextId: Int = 0
   
    
    func manualCreatePassword(usuario: String, senha: String, url: String){
        let novo: Register = Register(id: self.nextId, usuario: usuario, senha: senha, url: url)
        if registers.contains(where: { registro in
            registro.id == novo.id
        }){
            print("ID já está sendo utilizado")
        }else{
            registers.append(novo)
            nextId+=1
        }
    }
    
    func generatePassword(digits: Int) -> String{
        
        let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        return String((0..<digits).map{ _ in letters.randomElement()! })
        
    }
    
    func automaticCreatePassword(id: String, usuario: String, url: String){
        var newPassword: String = ""
        self.manualCreatePassword(usuario: usuario, senha: newPassword, url: url)
    }
    
    func removePassword(removed: Int){
        self.registers.removeAll(where: { registro in
            registro.id == removed
        })
    }
    
    func viewAllPasswords(){
        
    }
}
