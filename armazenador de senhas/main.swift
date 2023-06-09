//
//  main.swift
//  armazenador de senhas
//
//  Created by userext on 09/05/23.
//

import Foundation

// Estruturas e classes





// MARK: - Funções


// MARK: - Variáveis
var db: DatabaseAdapter = FilemanagerAdapter(fileName: "arquivo_teste", fileNextIdName: "id_teste")
var registerManager: RegisterManager = RegisterManager()
var choice: Choices
var registerAux: [Register]
var passwordAux: String = ""
var urlAux: String = ""
var usuarioAux: String = ""
var exit: Bool = true

registerManager.registers = db.loadData()
registerManager.nextId = db.getLastIdRegistred()

while(exit){
    choice = generalMenu()
    switch choice {
        
// MARK: - Register new password
        
    case .registerNewPassword:
        let submenuCreatePassowrdChoice = generalCreatePasswordMenu()
        switch submenuCreatePassowrdChoice {
        case .error:
            print("0")
        case .automatic:
            
            passwordAux = generatePassword()
            if(passwordAux != "Quantidade de dígitos inválida"){
                print("Sua senha será: ", passwordAux)
            }else{
                print(passwordAux, "\n\n")
                break
            }
            
            usuarioAux = getUser()
            if(usuarioAux == "Entrada inválida!"){
                print(usuarioAux, "\n\n")
                break;
            }
            
            urlAux = getUrl()
            if(urlAux == "Entrada inválida!"){
                print(urlAux, "\n\n")
                break;
            }
            
            registerManager.createNewPassword(usuario: usuarioAux, senha: passwordAux, url: urlAux)
            db.saveRegisterList(registers: registerManager.registers)
            db.setLastIdRegistred(nextId: registerManager.nextId)
            
        case .manual:
            
            usuarioAux = getUser()
            if(usuarioAux == "Entrada inválida!"){
                print(usuarioAux, "\n\n")
                break;
            }
            
            passwordAux = getSenha()
            if(passwordAux == "Entrada inválida!"){
                print(passwordAux, "\n\n")
                break;
            }
            
            urlAux = getUrl()
            if(urlAux == "Entrada inválida!"){
                print(urlAux, "\n\n")
                break;
            }

            registerManager.createNewPassword(usuario: usuarioAux, senha: passwordAux, url: urlAux)
            print("\n\nNovo registro realizado com sucesso!")
            db.saveRegisterList(registers: registerManager.registers)
            db.setLastIdRegistred(nextId: registerManager.nextId)
        }
        
// MARK: - Show one password
        
    case .showOnePassword:
        
        print("\n", ShowOnePassword().execute(registerManager: registerManager))
    
// MARK: - Show all passwords
        
    case .showAllPasswords:
        print(ShowAllPassword().execute(registerManager: registerManager))
        

// MARK: - Edit one password
        
    case .editOnePassword:
        var indice: Int
        (indice, passwordAux) = EditOnePassword().execute(registerManager: registerManager)
        if(indice == -1){
            print(passwordAux)
            break
        }
        registerManager.registers[indice].senha = passwordAux
        print("Senha alterada com sucesso!")
        
        
        db.saveRegisterList(registers: registerManager.registers)
        db.setLastIdRegistred(nextId: registerManager.nextId)
        
// MARK: - Remove one password
        
    case .removeOnePassword:
        
        print(RemoveOnePassword().execute(registerManager: registerManager))
        
        db.saveRegisterList(registers: registerManager.registers)
        db.setLastIdRegistred(nextId: registerManager.nextId)
// MARK: - Erro
        
    case .exit:
        exit = false
    }
    
}

/// teste: any
///
/// func(testa  Int)
