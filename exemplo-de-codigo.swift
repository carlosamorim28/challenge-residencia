import Foundation

let int = 1, int2 = 2
var numero = int
let sei = String(int)
let sei2 = String(int2)


//struct FileHelper {
//	private let manager = FileManager.default
//	
//	func createDocument(named fileName: String, with data: Data)-> Bool {
//		let documentURL = manager.urls(for: .documentDirectory, in: .userDomainMask).first!
//		let url = documentURL.appendingPathComponent(fileName)
//		manager.createFile(atPath: url.path, contents: data)
//		print(documentURL)
//		return manager.fileExists(atPath: url.path)
//	}
//
//	func readDocument(at path: String) -> Data? {
//		let documentURL = manager.urls(for: .documentDirectory, in: .userDomainMask).first!
//		let url = documentURL.appendingPathComponent(path)
//		return try? Data(contentsOf: url)
//	}
//}

let file = FileHelper()
class Teste: Codable {
	var teste: String 
	init(teste:String ){
		self.teste = teste
	}
}
struct GroceryProduct: Codable {
    var name: String
    var points: Int
    var description: String?
}

//let pear = Teste(teste: "String")
//let encoder = JSONEncoder()
//let data = try encoder.encode(pear)

// file.createDocument(named: "cebolas", with: data)
// print(String(data: data, encoding: .utf8)!)

let teste = file.readDocument(at: "batata")
print(teste)
