//
//  geraSenhaAleatoria.swift
//  armazenador de senhas
//
//  Created by userext on 12/05/23.
//

import Foundation


func generatePassword() -> String{
    let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789@!#$%ˆ&*()_."
    print("\nDigite a quantidade de digitos da senha aleatória: ")
    if let entrada = readLine(), let digits = Int(entrada){
        //Não precisa conferir se é um número pois já acontece isso no Int(entrada) da linha anterior
        return String((0..<digits).map{ _ in letters.randomElement()! })
        
    } else{
        return "Quantidade de dígitos inválida"
        
    }
}
