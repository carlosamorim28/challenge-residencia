//
//  showOnePassword.swift
//  armazenador de senhas
//
//  Created by userext on 12/05/23.
//

import Foundation

class ShowOnePassword: ShowAllPasswordsProtocol {
    func execute(registerManager: RegisterManager) -> String {
        var retorno: String = ""
        print("\nDigite a senha que será procurada:")
        if let senhaProcurada = readLine(){
            if(!senhaProcurada.isEmpty){
                registerAux = registerManager.findPasswords(password: senhaProcurada)
                if(registerAux.isEmpty == false){
                    print("\n")
                    for i in 0..<registerAux.count{
                        retorno += "Usuário: \(registerAux[i].usuario) ; Senha:  \(registerAux[i].senha) ; Url:  \(registerAux[i].url) \n"
                    }
                    return retorno
                }else {
                    return "Senha não encontrada"
                }
            } else{ return "Entrada inválida!"}
        }else{
            return "erro"
            
        }
    }
    
    
}
