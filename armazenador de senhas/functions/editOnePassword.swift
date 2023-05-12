//
//  editOnePassword.swift
//  armazenador de senhas
//
//  Created by userext on 12/05/23.
//

import Foundation

func editOnePassword(registerManager: RegisterManager) -> (Int, String){
    
    print("\nDigite o ID da senha a ser alterada:")
    if let entrada = readLine(), let id = Int(entrada){
        //Não precisa conferir se é um número pois já acontece isso no Int(entrada) da linha anterior
        let indice: Int = registerManager.findIndexID(id: id)
        if(indice>=0){
            print("Digite a nova senha:")
            if let entrada = readLine(){
                
                return (indice, entrada)
                
            } else{
                
                return (-1,"erro")
                
            }
            
        }else{
            return (-1, "Id não encontrado")
        }
    } else{
        return (-1, "Entrada deve ser um número Inteiro")
        
    }
}
