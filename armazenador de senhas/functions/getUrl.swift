//
//  pegaUrl.swift
//  armazenador de senhas
//
//  Created by userext on 12/05/23.
//

import Foundation

func getUrl() -> String{
    print("\nDigite o URL: ")
    if let entrada = readLine(){
        if(!entrada.isEmpty){
            return entrada
        }
    } else{
        print("erro")
    }
    return "Entrada inválida!"
}
