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
    print("1 - Registrar uma nova senha \n2 - Gerar uma senha\n0 - para sair")
    guard let entrada = readLine(), let choice = Int(entrada), let teste = ChoicesToRegisterNewPassowrd.init(rawValue: choice) else { return ChoicesToRegisterNewPassowrd.error }
    return teste
}




// App
var registerManager: RegisterManager = RegisterManager()
var choice: Choices
var registerAux: Register
var passwordAux: String = ""
var urlAux: String = ""
var usuarioAux: String = ""
while(true){
    choice = generalMenu()
    switch choice {
    case .registerNewPassword:
        var submenuCreatePassowrdChoice = generalCreatePasswordMenu()
        switch submenuCreatePassowrdChoice {
        case .error:
            print("0")
        case .automatic:

            print("Digite a quantidade de digitos da senha aleatória: ")
            if let entrada = readLine(), let choice = Int(entrada){
                passwordAux = registerManager.generatePassword(digits: choice);
                print("Sua senha será: ", passwordAux)
            } else{
                print("erro")
            }
            
            print("\nDigite seu usuario: ")
            if let entrada = readLine(){
                usuarioAux = entrada
            } else{
                print("erro")
            }
            
            print("\nDigite o URL: ")
            if let entrada = readLine(){
                urlAux = entrada
            } else{
                print("erro")
            }
            registerManager.createNewPassword(usuario: usuarioAux, senha: passwordAux, url: urlAux)
            
        case .manual:
            
            print("\nDigite seu usuario: ")
            if let entrada = readLine(){
                usuarioAux = entrada
            } else{
                print("erro")
            }
            
            print("\nDigite sua senha: ")
            if let entrada = readLine(){
                passwordAux = entrada
            } else{
                print("erro")
            }
            
            print("\nDigite o URL: ")
            if let entrada = readLine(){
                urlAux = entrada
            } else{
                print("erro")
            }
            registerManager.createNewPassword(usuario: usuarioAux, senha: passwordAux, url: urlAux)
            print("Novo registro realizado com sucesso!")
            print("Usuário: ", usuarioAux, " Senha: ", passwordAux, " Url: ", urlAux, "\n\n")
        }
    case .showOnePassword:
        print("Digite a senha que será procurada:")
        if let senhaProcurada = readLine(){
            passwordAux = registerManager.findPassword(password: senhaProcurada)
            print("Esses são os dados relacionados a essa senha: ")
            
        }else{
            print("erro")
        }
    case .error:
        print("error")
    }
   
}
