//: [Previous](@previous)
import Foundation

let decoder = JSONDecoder()

/***************************************************
 1번 문제
 - 다음 JSON 내용을 Fruit 타입으로 변환
 ***************************************************/
print("\n---------- [ 1번 문제 (Fruits) ] ----------\n")
let jsonFruits = """
[
{
"name": "Orange",
"cost": 100,
"description": "A juicy orange"
},
{
"name": "Apple",
"cost": 200,
},
{
"name": "Watermelon",
"cost": 300,
}
]
""".data(using: .utf8)!


struct Fruit: Codable {
    let name: String
    let cost: Int
    let description: String?
}

if let fruit1 = try? JSONDecoder().decode([Fruit].self, from: jsonFruits) {
    fruit1.forEach { print($0) }
}

/***************************************************
 2번 문제
 - 다음 JSON 내용을 Report 타입으로 변환
 ***************************************************/
print("\n---------- [ 2번 문제 (Report) ] ----------\n")
let jsonReport = """
{
  "name": "Final Results for iOS",
  "report_id": "905",
  "read_count": "10",
  "report_date": "2019-02-14",
}
""".data(using: .utf8)!

struct Report: Decodable {
    let name: String
    let reportId: String
    let readCount: String
    let reportDate: String
    
    private enum CodingKeys: String, CodingKey {
        case name = "name"
        case reportId = "report_id"
        case readCount = "read_count"
        case reportDate = "report_date"
    }
}

let report = try decoder.decode(Report.self, from: jsonReport)
print(report)


/***************************************************
 3번 문제
 - Nested Codable 내용을 참고하여 다음 JSON 내용을 파싱
 ***************************************************/
print("\n---------- [ 3번 문제 (Movie) ] ----------\n")
let jsonMovie = """
[
{
"name": "Edward",
"favorite_movies": [
{
"title": "Big Fish",
"release_year": 2003
},
{
"title": "Gran Torino",
"release_year": 2008
},
{
"title": "3 Idiots",
"release_year": 2009
},
]
}
]
""".data(using: .utf8)!

struct Person: Codable {
    let name: String
    let favoriteMovie: [Movie]
    
    struct Movie: Codable {
        let title: String
        let releaseYear: Int
        
        enum CodingKeys: String, CodingKey {
            case title
            case releaseYear = "release_year"
        }
  }
    
    enum CodingKeys: String, CodingKey {
        case name
        case favoriteMovie = "favorite_movies"
    }
}


do {
    let movie = try JSONDecoder().decode([Person].self, from: jsonMovie)
    print(movie)
} catch {
    print(error.localizedDescription)
}



/***************************************************
 4번 문제
 - 다음 URL의 Repository 정보 중에서 다음 속성만을 골라서 데이터 모델로 만들고 출력
 - full_name, description, stargazers_count, forks_count, html_url
 - https://api.github.com/search/repositories?q=user:92pino
 - 위 URL의 user 부분을 자신의 아이디로 변경
 ***************************************************/
print("\n---------- [ 4번 문제 ] ----------\n")

struct Repositories: Codable {
    
    let items: [repoDetail]
    
    struct repoDetail: Codable {
        let fullName: String
        let description: String?
        let stargazersCount: Int
        let forksCount: Int
        let htmlUrl: String
        
        enum CodingKeys: String, CodingKey {
            case fullName = "full_name"
            case description
            case stargazersCount = "stargazers_count"
            case forksCount = "forks_count"
            case htmlUrl = "html_url"
        }
    }
}


func fetchGitHubRepositories() {
    let urlString = "https://api.github.com/search/repositories?q=user:92pino"
    let url = URL(string: urlString)!
    
    URLSession.shared.dataTask(with: url) { (data, response, error) in
        
        guard error == nil else { return print(error!) }
        guard let response = response as? HTTPURLResponse,
            200..<400 ~= response.statusCode
            else { return print("StatusCode is not valid")}
        
        let repo = try? JSONDecoder().decode(Repositories.self, from: data!)
        
        repo.flatMap { print($0) }
        
    }.resume()
}

fetchGitHubRepositories()



//: [Table of Contents](Contents) | [Previous](@previous) | [Next](@next)
