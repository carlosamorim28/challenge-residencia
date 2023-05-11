//
//  RegisterManager.swift
//  armazenador de senhas
//
//  Created by userext on 10/05/23.
//

import Foundation

final class RegisterManager: Codable{
    var registers: [Register] = []
    var nextId: Int = 0
    
    
    func createNewPassword(usuario: String, senha: String, url: String){
        let novo: Register = Register(id: self.nextId, usuario: usuario, senha: senha, url: url)
        registers.append(novo)
        nextId+=1
    }
    
    
    func generatePassword(digits: Int) -> String{
        let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        return String((0..<digits).map{ _ in letters.randomElement()! })
    }
    
    
    func removePassword(idRemoved: Int){
        self.registers.removeAll(where: { registro in
            registro.id == idRemoved
        })
    }
    
    func viewAllPasswords(){
        
    }
    
    func setPassword(id: Int, newSenha: String){
        
        if(registers.isEmpty == false){
            for i in 1...registers.count{
                if(registers[i].id == id){
                    registers[i].senha = newSenha
                }
            }
        }
        
    }
    

    func findPasswords(password: String) -> [Register]{
        return registers.filter { registers in
            registers.senha == password
        }
    }
    
    func findIndexID(id: Int) -> Int{
        if(registers.isEmpty == false){
            for i in 0..<registers.count{
                if (registers[i].id == id){
                    return i
                }
            }
        }
        return -1
    }
    
    
}

