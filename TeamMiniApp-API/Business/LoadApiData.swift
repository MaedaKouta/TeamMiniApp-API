//
//  LoadApiData.swift
//  TeamMiniApp-API
//
//  Created by 前田航汰 on 2022/04/09.
//

import Foundation
import Alamofire

protocol LoadApiDataDelegate: AnyObject {
    func presentInfo(articles: [Article.Detail])
}

enum NewsCategory: String {
    case technology = "technology"
    case business = "business"
}

class LoadApiData {

    weak var delegate: LoadApiDataDelegate?

    func load(category: NewsCategory, size: Int) {

        let url = URL(string: "https://newsapi.org/v2/top-headlines?country=jp&pageSize=\(size)&category=\(category)&apiKey=cf9d0892883f46fd88c3c1740496cbfc")!

        AF.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default).responseJSON {
            response in
            switch response.result{
            case .success:
                do{
                    let articles = [try JSONDecoder().decode(Article.self, from: response.data!).articles]
                    DispatchQueue.main.async {
                        self.delegate?.presentInfo(articles: articles[0])
                    }
                }
                catch{
                    print("取得失敗")
                }
            case .failure(_):
                print("失敗")
            }
        }
    }
}
