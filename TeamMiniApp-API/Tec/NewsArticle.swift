//
//  NewsArticle.swift
//  TeamMiniApp-API
//
//  Created by 近藤米功 on 2022/04/09.
//

struct NewsArticle: Codable {
    let articles: [NewsData]
}

struct NewsData: Codable {
    let description: String?
    let title: String?
    let url: String?
}
