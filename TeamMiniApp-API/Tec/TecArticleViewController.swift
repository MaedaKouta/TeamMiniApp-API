//
//  TecArticleViewController.swift
//  TeamMiniApp-API
//
//  Created by 近藤米功 on 2022/04/09.
//

import UIKit

class TecArticleViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!

    private var getArticle = GetArticle()
    private var selectedArticleUrl: String?
    private (set) var catchArticles: Article?
    public var catchNumberTecArticle: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        getArticle.delegate = self
        // 取得した記事数分、NewsAPIにリクエストを送る
        getArticle.request(size: catchNumberTecArticle)
        setUpTableView()
    }

    private func setUpTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "TecArticleTableViewCell", bundle: nil), forCellReuseIdentifier: "tecArticleCell")
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "WebTecArticleViewControllerSegue"{
            let webTecArticleVC = segue.destination as! WebTecArticleViewController
            webTecArticleVC.catchWebUrl = selectedArticleUrl ?? "URLなしs"
        }
    }

}

extension TecArticleViewController: UITableViewDelegate,UITableViewDataSource{
    // 指定された記事数分、tableViewを返す
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        catchNumberTecArticle
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tecArticleCell", for: indexPath) as! TecArticleTableViewCell
        cell.titleLabel.text = catchArticles?.articles[indexPath.row].title
        cell.publishedAtLabel.text = catchArticles?.articles[indexPath.row].publishedAt
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }

    // セルをタップした時にWebURL記事に飛ぶ
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedArticleUrl = catchArticles?.articles[indexPath.row].url ?? "URLなし"
        performSegue(withIdentifier: "WebTecArticleViewControllerSegue", sender: nil)
    }
}

extension TecArticleViewController: GetArticleDelegate{
    func catchArticleData(articles: Article) {
        catchArticles = articles
        tableView.reloadData()
    }
}
