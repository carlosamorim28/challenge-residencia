//
//  removeOnePassword.swift
//  armazenador de senhas
//
//  Created by userext on 12/05/23.
//

import Foundation

class RemoveOnePassword: RemoveOnePasswordProtocol {
    
    func execute(registerManager: RegisterManager) -> String {
        print("\nDigite o ID da senha a ser excluída:")
        if let entrada = readLine(), let id = Int(entrada){
            //Não precisa conferir se é um número pois já acontece isso no Int(entrada) da linha anterior
            let indice: Int = registerManager.findIndexID(id: id)
            if(indice>=0){
                registerManager.removePassword(idRemoved: registerManager.registers[indice].id)
                return "Removido com sucesso!"
            }else{
                return "Id não encontrado"
            }
        } else{
            return "Entrada deve ser um número Inteiro"
        }
    }
    
    
}
