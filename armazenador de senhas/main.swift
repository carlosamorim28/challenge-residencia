//
//  main.swift
//  armazenador de senhas
//
//  Created by userext on 09/05/23.
//

import Foundation

// Estruturas e classes





// MARK: - Funções
func generalMenu() -> Choices {
    print("\n1 - Registrar uma nova senha \n2 - Vizualizar uma senha\n3 - Vizualizar todas as senhas\n4 - Editar uma senha\n5 - Remover uma senhas\n0 - Sair")
    guard let entrada = readLine(), let choice = Int(entrada), let teste = Choices.init(rawValue: choice) else { return Choices.exit }
    return teste
}

func generalCreatePasswordMenu() ->ChoicesToRegisterNewPassowrd {
    print("\n1 - Registrar uma nova senha \n2 - Gerar uma senha\n0 - para sair")
    guard let entrada = readLine(), let choice = Int(entrada), let teste = ChoicesToRegisterNewPassowrd.init(rawValue: choice) else { return ChoicesToRegisterNewPassowrd.error }
    return teste
}



// MARK: - Variáveis
var registerManager: RegisterManager = RegisterManager()
var choice: Choices
var registerAux: [Register]
var passwordAux: String = ""
var urlAux: String = ""
var usuarioAux: String = ""
var exit: Bool = true
while(exit){
    choice = generalMenu()
    switch choice {
        
// MARK: - Register new password
        
    case .registerNewPassword:
        var submenuCreatePassowrdChoice = generalCreatePasswordMenu()
        switch submenuCreatePassowrdChoice {
        case .error:
            print("0")
        case .automatic:

            print("\nDigite a quantidade de digitos da senha aleatória: ")
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
                if(!entrada.isEmpty){
                    usuarioAux = entrada
                }else{ print("\n\n Entrada inválida ! \n\n") ; break}
            } else{
                print("erro")
            }
            
            print("\nDigite o URL: ")
            if let entrada = readLine(){
                if(!entrada.isEmpty){
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
                if(!entrada.isEmpty){
                    usuarioAux = entrada
                }else{ print("\n\n Entrada inválida ! \n\n") ; break}
            } else{
                print("erro")
                break
            }
            
            print("\nDigite sua senha: ")
            if let entrada = readLine(){
                if(!entrada.isEmpty){
                    passwordAux = entrada
                }else{ print("\n\n Entrada inválida ! \n\n") ; break}
            } else{
                print("erro")
            }
            
            print("\nDigite o URL: ")
            if let entrada = readLine(){
                if(!entrada.isEmpty){
                    urlAux = entrada
                }else{ print("\n\n Entrada inválida ! \n\n") ; break}
            } else{
                print("erro")
            }
            registerManager.createNewPassword(usuario: usuarioAux, senha: passwordAux, url: urlAux)
            print("\n\nNovo registro realizado com sucesso!")
            print("Usuário: ", usuarioAux, " Senha: ", passwordAux, " Url: ", urlAux, "\n\n")
        }
        
// MARK: - Show one password
        
    case .showOnePassword:
        print("\nDigite a senha que será procurada:")
        if let senhaProcurada = readLine(){
            if(!senhaProcurada.isEmpty){
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
    
// MARK: - Show all passwords
        
    case .showAllPasswords:
        if (registerManager.registers.isEmpty == false){
            for i in 0..<registerManager.registers.count{
                print("\n\nUsuário: ", registerManager.registers[i].usuario, " Senha: ", registerManager.registers[i].senha, " Url: ", registerManager.registers[i].url)
            }
        }else{
            print("Não possui senhas cadastradas!")
        }
        

// MARK: - Edit one password
        
    case .editOnePassword:
        print("\nDigite o ID da senha a ser alterada:")
        if let entrada = readLine(), let id = Int(entrada){
            //Não precisa conferir se é um número pois já acontece isso no Int(entrada) da linha anterior
            let indice: Int = registerManager.findIndexID(id: id)
            if(indice>=0){
                print("Digite a nova senha:")
                if let entrada = readLine(){
                    if(!entrada.isEmpty){
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
        
// MARK: - Remove one password
        
    case .removeOnePassword:
        
        print("\nDigite o ID da senha a ser excluída:")
        if let entrada = readLine(), let id = Int(entrada){
            //Não precisa conferir se é um número pois já acontece isso no Int(entrada) da linha anterior
            let indice: Int = registerManager.findIndexID(id: id)
            if(indice>=0){
                registerManager.removePassword(idRemoved: indice)
                print("Removido com sucesso!")
            }else{
                print("Id não encontrado")
                break
            }
        } else{
            print("Entrada deve ser um número Inteiro")
            break
        }

// MARK: - Erro
        
    case .exit:
        exit = false
    }
   
}
