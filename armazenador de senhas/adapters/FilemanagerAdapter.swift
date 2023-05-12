//
//  FilemanagerAdapter.swift
//  armazenador de senhas
//
//  Created by userext on 10/05/23.
//

import Foundation

struct FileHelper {
    private let manager = FileManager.default
    
    func createDocument(named fileName: String, with data: Data)-> Bool {
        let documentURL = manager.urls(for: .documentDirectory, in: .userDomainMask).first!
        let url = documentURL.appendingPathComponent(fileName)
        manager.createFile(atPath: url.path, contents: data)
        print(documentURL)
        return manager.fileExists(atPath: url.path)
    }

    func readDocument(at path: String) -> Data? {
        let documentURL = manager.urls(for: .documentDirectory, in: .userDomainMask).first!
        let url = documentURL.appendingPathComponent(path)
        return try? Data(contentsOf: url)
    }
}

final class FilemanagerAdapter: DatabaseAdapter {
    
    
    private var file: FileHelper
    private var encoder: JSONEncoder
    private var fileName: String
    private var fileNextIdName: String
    private var decoder: JSONDecoder
    
    init(fileName: String, fileNextIdName: String){
        self.file = FileHelper()
        self.encoder = JSONEncoder()
        self.fileName = fileName
        self.decoder = JSONDecoder()
        self.fileNextIdName = fileNextIdName
    }
    
    func loadData() -> [Register] {
        do {
            let manager = FileManager.default
            let documentURL = manager.urls(for: .documentDirectory, in: .userDomainMask).first!
            let url = documentURL.appendingPathComponent(self.fileName)
            if(manager.fileExists(atPath: url.path)){
                var registersList = file.readDocument(at: self.fileName)!
                let regitersDecoded = try decoder.decode([Register].self, from: registersList)
                return regitersDecoded
            } else {
                return []
            }
        }catch{
            print("Error")
            return []
        }
        
        
    }
    func saveRegisterList(registers: [Register]) -> Bool {
        do {
            let data = try self.encoder.encode(registers)
            file.createDocument(named: self.fileName, with: data)
            return true
        } catch {
            return false
        }
    }
    
    func getLastIdRegistred() -> Int {
        do {
        let manager = FileManager.default
        let documentURL = manager.urls(for: .documentDirectory, in: .userDomainMask).first!
        let url = documentURL.appendingPathComponent(self.fileNextIdName)
        if(manager.fileExists(atPath: url.path)){
            var nextIdEncripted = file.readDocument(at: self.fileNextIdName)!
            let nextIdDecoded = try decoder.decode(Int.self, from: nextIdEncripted)
            return nextIdDecoded
        } else {
            return -1
        }
    }catch{
        print("Error")
        return -1
    }
        
    }
     
    func setLastIdRegistred(nextId: Int) -> Bool {
        do{
            let data = try self.encoder.encode(nextId)
            file.createDocument(named: self.fileNextIdName, with: data)
            return true
        } catch {
            return false
        }
        
    }
    
}
