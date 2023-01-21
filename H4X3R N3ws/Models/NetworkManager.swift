//
//  NetworkManager.swift
//  H4X3R N3ws
//
//  Created by Marcel Mravec on 20.01.2023.
//

import Foundation

class NetworkManager: ObservableObject {
    
    @Published var posts = [Post]()
    
    func fetchData() {
        if let url = URL(string: "https://hacker-news.firebaseio.com/v0/beststories.json") {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if error == nil {
                    let decoder = JSONDecoder()
                    if let safeData = data  {
                        do {
                            let decodedData = try decoder.decode([Int].self, from: safeData)
                            //self.posts = decodedData
                            for data in decodedData {
                                self.fetchArticle(data)
                            }
                            
                        } catch {
                            print("Caught error:")
                            print(error.localizedDescription)
                        }
                    }
                }
            }
            task.resume()
        }
    }
    
    func fetchArticle(_ article: Int) {
        let pathToArcticle = "https://hacker-news.firebaseio.com/v0/item/\(article).json"
        print(pathToArcticle)
        if let url = URL(string: pathToArcticle) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if error == nil {
                    let decoder = JSONDecoder()
                    if let safeData = data  {
                        do {
                            let decodedData = try decoder.decode(Post.self, from: safeData)
                            self.posts.append(decodedData)
                            
                        } catch {
                            print("fetchArticle Error")
                            print(error.localizedDescription)
                        }
                    }
                }
            }
            task.resume()
        }
    }
}
