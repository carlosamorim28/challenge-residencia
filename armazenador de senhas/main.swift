//
//  main.swift
//  armazenador de senhas
//
//  Created by userext on 09/05/23.
//

import Foundation

// Estruturas e classes





// implementacao de funcao
func generalMenu() -> Choices {
    print("1 - Registrar uma nova senha \n2 - Vizualizar uma senha\n3 - Vizualizar todas as senhas\n4 - Editar uma senha\n5 - Remover uma senhas\n0 - Sair")
    guard let entrada = readLine(), let choice = Int(entrada), let teste = Choices.init(rawValue: choice) else { return Choices.error }
    return teste
}

func generalCreatePasswordMenu() ->ChoicesToRegisterNewPassowrd {
    print("1 - Registrar uma nova senha \n2 - Vizualizar uma senha\n0 - para sair")
    guard let entrada = readLine(), let choice = Int(entrada), let teste = ChoicesToRegisterNewPassowrd.init(rawValue: choice) else { return ChoicesToRegisterNewPassowrd.error }
    return teste
}




// App
var choice: Choices
while(true){
    choice = generalMenu()
    switch choice {
    case .registerNewPassword:
        var submenuCreatePassowrdChoice = generalCreatePasswordMenu()
        switch submenuCreatePassowrdChoice {
        case .error:
            print("0")
        case .automatic:
            print("1")
        case .manual:
            print("2")
        }
    case .showOnePassword:
            print("2")
    case .error:
        print("error")
    }
   
}
