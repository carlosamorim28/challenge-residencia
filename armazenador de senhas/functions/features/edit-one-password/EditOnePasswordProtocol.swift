//
//  EditOnePasswordProtocol.swift
//  armazenador de senhas
//
//  Created by userext on 12/05/23.
//

import Foundation

protocol EditOnePasswordProtocol {
    func execute(registerManager: RegisterManager) -> (Int, String)
}


