//
//  WebTecArticleViewController.swift
//  TeamMiniApp-API
//
//  Created by 近藤米功 on 2022/04/09.
//

import UIKit
import WebKit
class WebTecArticleViewController: UIViewController {
    public var catchWebUrl: String = ""
    @IBOutlet private weak var webView: WKWebView!

    override func viewDidLoad() {
        super.viewDidLoad()
        let url = URL(string: catchWebUrl)
        guard let url = url else {
            return
        }
        webView.load(URLRequest(url: url))
    }
}
