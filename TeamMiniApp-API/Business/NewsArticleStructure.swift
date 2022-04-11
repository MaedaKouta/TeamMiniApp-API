//
//  NewsArticleStructure.swift
//  TeamMiniApp-API
//
//  Created by 前田航汰 on 2022/04/09.
//

import Foundation

struct Article: Codable {
    let articles: [Detail]

    struct Detail: Codable {
        let description: String?
        let title: String?
        let url: String?
    }
}
