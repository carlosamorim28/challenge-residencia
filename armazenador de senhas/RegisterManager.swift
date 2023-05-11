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
    
    
    func createNewPassword(usuario: String, senha: String, url: String){
        let novo: Register = Register(id: self.nextId, usuario: usuario, senha: senha, url: url)
        registers.append(novo)
        nextId+=1
    }
    
    
    func generatePassword(digits: Int) -> String{
        let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        return String((0..<digits).map{ _ in letters.randomElement()! })
    }
    
    
    func removePassword(removed: Int){
        self.registers.removeAll(where: { registro in
            registro.id == removed
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
    

    func findPassword(password: String) -> Register{
        for i in registers{
            if(i.senha == password){
                return i;
            }
        }
        //A senha procurada não existe:
        return Register(id: -1, usuario: "", senha: "", url: "");
    }
    
    
}

