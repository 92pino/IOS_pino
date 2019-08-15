//: [Previous](@previous)
/*:
 # JSON
 */
import Foundation

struct Person: Codable {
    var name: String
    var age: Int
    var sayHello: String
}
let encoder = JSONEncoder()
encoder.outputFormatting = [.sortedKeys, .prettyPrinted]

let pino = Person(name: "pino", age: 28, sayHello: "Hello")
let jsonData = try? encoder.encode(pino)
if let jsonData = jsonData, let jsonString = String(data: jsonData, encoding: .utf8) {
    print(jsonString)
}

struct MacBook: Codable {
  let model: String
  let modelYear: Int
  let display: Int
}

let macBook = MacBook(
  model: "MacBook Pro", modelYear: 2018, display: 15
)

// 인코딩을 안하고 커스텁 타입을 저장할 경우 오류 발생
// NSCodingdl나 NSSecureCoding을 사용하여 먼저 인코딩을 한 후 Userdefaults에 저장해야함
// UserDefaults.standard.set(macBook, forKey: "MacBook")

// Codable 이전 - JSONSerialization
// Codable 이후 - JSONEncoder / JSONDecoder

/*:
 ---
 ## Encoder
 ---
 */
print("\n---------- [ Encoder ] ----------\n")
//let jsonEncoder = JSONEncoder()
//let encodedMacBook = try! jsonEncoder.encode(macBook)
//print(encodedMacBook)

let jsonEncoder = JSONEncoder()
let encodedMacBook = try! jsonEncoder.encode(macBook)
print(encodedMacBook)

// userdefaults

UserDefaults.standard.set(encodedMacBook, forKey: "myMacbook")

// JSON파일로 저장
let appSupportDir = FileManager.default.urls(
  for: .documentDirectory, in: .userDomainMask
  ).first!
let archiveURL = appSupportDir
  .appendingPathComponent("macBookData")
  .appendingPathExtension("json")

//print(archiveURL)
// 결과값 : file:///var/folders/6t/6plszrp17h1f0mdzf1v3nxgw0000gn/T/com.apple.dt.Xcode.pg/containers/com.apple.dt.playground.stub.iOS_Simulator.CodableExample-79FFF27F-9350-42E5-AAF8-1415CC1880E8/Library/Application%20Support/macBookData.json

try? encodedMacBook.write(to: archiveURL)

do {
    try encodedMacBook.write(to: archiveURL, options: .noFileProtection)
//    try encodedMacBook.write(to: archiveURL)
} catch {
    print(error.localizedDescription)
}
/*:
 ---
 ## Decoder
 ---
 */
print("\n---------- [ Decoder ] ----------\n")
let jsonDecoder = JSONDecoder()
if let decodedMacBook = try? jsonDecoder.decode(MacBook.self, from: encodedMacBook) {
  print(decodedMacBook)
}

// 파일에서 불러오기
if let retrievedData = try? Data(contentsOf: archiveURL),
  let decodedMacBook = try? jsonDecoder.decode(MacBook.self, from: retrievedData) {
  print(retrievedData)
  print(decodedMacBook)
}


/***************************************************
 Array
 ***************************************************/
print("\n---------- [ Array ] ----------\n")
let arr = [macBook, macBook, macBook]

let encodedArr = try! jsonEncoder.encode(arr)
try? encodedArr.write(to: archiveURL)

if let decodedArr = try? jsonDecoder.decode([MacBook].self, from: encodedArr) {
  print(decodedArr)
}

if let retrievedData = try? Data(contentsOf: archiveURL),
  let decodedArr = try? jsonDecoder.decode([MacBook].self, from: retrievedData) {
  print(retrievedData)
  print(decodedArr)
}


/***************************************************
 Dictionary
 ***************************************************/
print("\n---------- [ Dictionary ] ----------\n")
let dict = ["mac": macBook, "mac1": macBook, "mac2": macBook]

let encodedDict = try! jsonEncoder.encode(dict)
try? encodedDict.write(to: archiveURL)

if let decodedDict = try? jsonDecoder.decode([String: MacBook].self, from: encodedDict) {
    print(decodedDict)
}

if let retrievedData = try? Data(contentsOf: archiveURL),
    let decodedDict = try? jsonDecoder.decode([String: MacBook].self, from: retrievedData) {
    print(retrievedData)
    print(decodedDict)
}


//: [Table of Contents](Contents) | [Previous](@previous) | [Next](@next)
