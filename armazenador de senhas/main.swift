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


func confereEntrada(entrada: String)-> Bool{
    if(entrada.isEmpty){
        return false
    }
    if(entrada.allSatisfy({ char in
        (char.isLetter || char.isNumber || char == " ")
    })){
        return true
    } else{
        return false
    }
}

// App
var registerManager: RegisterManager = RegisterManager()
var choice: Choices
var registerAux: [Register]
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
            if let entrada = readLine(), let digits = Int(entrada){
                //Não precisa conferir se é um número pois já acontece isso no Int(entrada) da linha anterior
                passwordAux = registerManager.generatePassword(digits: digits);
                print("Sua senha será: ", passwordAux)
            } else{
                print("Quantidade de dígitos inválida")
                break
            }
            
            print("\nDigite seu usuario: ")
            if let entrada = readLine(){
                if(confereEntrada(entrada: entrada)){
                    usuarioAux = entrada
                }else{ print("\n\n Entrada inválida ! \n\n") ; break}
            } else{
                print("erro")
            }
            
            print("\nDigite o URL: ")
            if let entrada = readLine(){
                if(confereEntrada(entrada: entrada)){
                    urlAux = entrada
                } else{ print("\n\n Entrada inválida ! \n\n") ; break}
            } else{
                print("erro")
                break
            }
            registerManager.createNewPassword(usuario: usuarioAux, senha: passwordAux, url: urlAux)
            
        case .manual:
            
            print("\nDigite seu usuario: ")
            if let entrada = readLine(){
                if(confereEntrada(entrada: entrada)){
                    usuarioAux = entrada
                }else{ print("\n\n Entrada inválida ! \n\n") ; break}
            } else{
                print("erro")
                break
            }
            
            print("\nDigite sua senha: ")
            if let entrada = readLine(){
                if(confereEntrada(entrada: entrada)){
                    passwordAux = entrada
                }else{ print("\n\n Entrada inválida ! \n\n") ; break}
            } else{
                print("erro")
            }
            
            print("\nDigite o URL: ")
            if let entrada = readLine(){
                if(confereEntrada(entrada: entrada)){
                    urlAux = entrada
                }else{ print("\n\n Entrada inválida ! \n\n") ; break}
            } else{
                print("erro")
            }
            registerManager.createNewPassword(usuario: usuarioAux, senha: passwordAux, url: urlAux)
            print("\n\nNovo registro realizado com sucesso!")
            print("Usuário: ", usuarioAux, " Senha: ", passwordAux, " Url: ", urlAux, "\n\n")
        }
    case .showOnePassword:
        print("Digite a senha que será procurada:")
        if let senhaProcurada = readLine(){
            if(confereEntrada(entrada: senhaProcurada)){
                registerAux = registerManager.findPasswords(password: senhaProcurada)
                if(registerAux.isEmpty == false){
                    print("\n")
                    for i in 0..<registerAux.count{
                        print("Usuário: ", registerAux[i].usuario, " Senha: ", registerAux[i].senha, " Url: ", registerAux[i].url)
                    }
                    print("\n")
                }
            } else{ print("\n\n Entrada inválida ! \n\n") ; break}
        }else{
            print("erro")
            break
        }
    case .editOnePassword:
        print("Digite o ID da senha a ser alterada:")
        if let entrada = readLine(), let id = Int(entrada){
            //Não precisa conferir se é um número pois já acontece isso no Int(entrada) da linha anterior
            let indice: Int = registerManager.findIndexID(id: id)
            if(indice>=0){
                print("Digite a nova senha:")
                if let entrada = readLine(){
                    if(confereEntrada(entrada: entrada)){
                        passwordAux = entrada
                    }else{ print("\n\n Entrada inválida ! \n\n") ; break}
                } else{
                    print("erro")
                }
                registerManager.registers[indice].senha = passwordAux
                print("Senha alterada com sucesso!")
            }else{
                print("Id não encontrado")
                break
            }
        } else{
            print("Entrada deve ser um número Inteiro")
            break
        }
        
    case .error:
        print("error")
    }
   
}
