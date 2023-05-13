//
//  showAllPasswords.swift
//  armazenador de senhas
//
//  Created by userext on 12/05/23.
//

import Foundation




class ShowAllPassword: ShowAllPasswordsProtocol{
    func execute(registerManager: RegisterManager) -> String {
        var retorno: String = ""
        if (registerManager.registers.isEmpty == false){
            for i in 0..<registerManager.registers.count{
                retorno += "\n\n ID:  \(registerManager.registers[i].id) Usuário:  \(registerManager.registers[i].usuario)  Senha:  \(registerManager.registers[i].senha)  Url:  \(registerManager.registers[i].url)"
            }
            return retorno
        }else{
            return "Não possui senhas cadastradas!"
        }
    }
    
    
}

