//
//  mainMenu.swift
//  armazenador de senhas
//
//  Created by userext on 12/05/23.
//

import Foundation

func generalMenu() -> Choices {
    print("\n1 - Registrar uma nova senha \n2 - Vizualizar uma senha\n3 - Vizualizar todas as senhas\n4 - Editar uma senha\n5 - Remover uma senha\n0 - Sair")
    guard let entrada = readLine(), let choice = Int(entrada), let teste = Choices.init(rawValue: choice) else { return Choices.exit }
    return teste
}
