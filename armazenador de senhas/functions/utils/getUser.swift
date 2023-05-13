//
//  pegaUser.swift
//  armazenador de senhas
//
//  Created by userext on 12/05/23.
//

import Foundation

func getUser() -> String{
    print("\nDigite seu usuario: ")
    if let entrada = readLine(){
        if(!entrada.isEmpty){
            return entrada
        }
    } else{
        print("erro")
    }
    return "Entrada inválida!"
}
