//
//  DatabaseAcapters.swift
//  armazenador de senhas
//
//  Created by userext on 10/05/23.
//

import Foundation

protocol DatabaseAdapter {
    func loadData() -> [Register]
    func saveRegisterList(registers: [Register]) -> Bool
    func getLastIdRegistred() -> Int
    func setLastIdRegistred(nextId: Int) -> Bool
}
