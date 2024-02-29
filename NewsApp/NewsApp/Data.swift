//
//  Data.swift
//  NewsApp
//
//  Created by Polina Stelmakh on 28.02.2024.
//

import Foundation
import SwiftyJSON

struct DataType: Identifiable {
    var id: String
    var title: String
    var desc: String
    var url: String
    var image: String
}

class GetData: ObservableObject {
    
    @Published var datas = [DataType]()
    var search: String = "apple"
    
    init(search: String = "apple") {
        let urlString = "https://newsapi.org/v2/everything?q=" + search + "&apiKey=43bad964a94e4185b464d6eb3976c1d7"
                
        // convert url string to url
        guard let url = URL(string: urlString) else {
            // invalid
            print("Invalid URL")
            return
        }
        let session = URLSession(configuration: .default)
        session.dataTask(with: url) { (data, _, err) in
            if err != nil {
                print((err?.localizedDescription)!)
                return
            }
            let json = try! JSON(data: data!)
            
            for i in json["articles"] {
                let title = i.1["title"].stringValue
                let description = i.1["description"].stringValue
                let url = i.1["url"].stringValue
                let image = i.1["urlToImage"].stringValue
                let id = i.1["publishedAt"].stringValue
                
                DispatchQueue.main.async {
                    
                    self.datas.append(DataType(id: id, title: title, desc: description, url: url, image: image))
                }
                
                
            }
        }.resume()
    }
}
