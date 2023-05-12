//
//  createPassword.swift
//  armazenador de senhas
//
//  Created by userext on 12/05/23.
//

import Foundation


func generalCreatePasswordMenu() ->ChoicesToRegisterNewPassowrd {
    print("\n1 - Registrar uma senha manualmente\n2 - Gerar uma senha automaticamente\n0 - para sair")
    guard let entrada = readLine(), let entrada_inteiro = Int(entrada), let choice = ChoicesToRegisterNewPassowrd.init(rawValue: entrada_inteiro) else { return ChoicesToRegisterNewPassowrd.error }
    return choice
}
