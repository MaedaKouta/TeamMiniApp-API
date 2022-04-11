//
//  OnlyBusinessArticleViewController.swift
//  TeamMiniApp-API
//
//  Created by 前田航汰 on 2022/04/09.
//

import UIKit
import WebKit

class OnlyBusinessArticleViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    private var articleUrl: URL?

    func setArticle(url: String) {
        articleUrl = URL(string: url)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        if let url = articleUrl {
            self.webView.load(URLRequest(url: url))
        } else {
            print("URLが取得できませんでした。")
        }
    }
}
