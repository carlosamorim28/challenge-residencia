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
        if let valorProcurado = readLine(){
            if(!valorProcurado.isEmpty){
                registerAux = registerManager.registers.filter { registers in
                    registers.senha == valorProcurado || registers.id == Int(valorProcurado) || valorProcurado == registers.url
                }
                if(registerAux.isEmpty == false){
                    print("\n")
                    for i in 0..<registerAux.count{
                        retorno +=  "ID: \(registerAux[i].id) ; Usuário: \(registerAux[i].usuario) ; Senha:  \(registerAux[i].senha) ; Url:  \(registerAux[i].url) \n"
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
