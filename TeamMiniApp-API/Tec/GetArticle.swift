//
//  GetArticleData.swift
//  TeamMiniApp-API
//
//  Created by 近藤米功 on 2022/04/09.
//
import Foundation
import Alamofire
protocol GetArticleDelegate: AnyObject{
    func catchArticleData(articles: Article)
}

class GetArticle{
    weak var delegate: GetArticleDelegate?
    func request(size: Int){
        let url = URL(string: "https://newsapi.org/v2/top-headlines?country=jp&pageSize=\(size)&category=technology&apiKey=2dadbe9531074cfe86934358180c7e24")
        guard let url = url else {
            return
        }
        AF.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default).responseJSON {
            response in
            switch response.result{
            case .success:
                do{
                    let articles = try JSONDecoder().decode(Article.self, from: response.data!)
                    self.delegate?.catchArticleData(articles: articles)
                }
                catch{
                    print("取得失敗")
                }
            case .failure(_):
                print("switchFail")
            }
        }
    }
}
