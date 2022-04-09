//
//  TecArticleViewController.swift
//  TeamMiniApp-API
//
//  Created by 近藤米功 on 2022/04/09.
//

import UIKit

class TecArticleViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var numberTecArticle: Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
}
extension TecArticleViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        numberTecArticle
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 後で書く
        let cell = tableView.dequeueReusableCell(withIdentifier: "tecArticleCell", for: indexPath)
        return cell
    }
}
