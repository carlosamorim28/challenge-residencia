//
//  pegaSenha.swift
//  armazenador de senhas
//
//  Created by userext on 12/05/23.
//

import Foundation

func getSenha() -> String{
    print("\nDigite sua senha: ")
    if let entrada = readLine(){
        if(!entrada.isEmpty){
            return entrada
        }
    } else{
        print("erro")
    }
    return "Entrada inválida!"
}
