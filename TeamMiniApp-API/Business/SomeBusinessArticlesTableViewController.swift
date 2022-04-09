//
//  SomeBusinessArticlesTableViewController.swift
//  TeamMiniApp-API
//
//  Created by 前田航汰 on 2022/04/09.
//

import UIKit

class SomeBusinessArticlesTableViewController: UITableViewController {

    private var articles: [Article.Detail] = []
    private let loadApiData = LoadApiData()
    private var articlesSize = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        loadApiData.delegate = self
        loadApiData.load(category: NewsCategory.business, size: articlesSize)
        tableView.register(UINib(nibName: "ArticleTableViewCell", bundle: nil), forCellReuseIdentifier: "ArticleCell")
        tableView.rowHeight = 138
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ToOnlyBusinessArticleSegue" {
            if let index = tableView.indexPathForSelectedRow?.row {
                let OnlyBusinessArticleVC = segue.destination as! OnlyBusinessArticleViewController
                OnlyBusinessArticleVC.setArticle(url: articles[index].url ?? "")
                print("here is 処理")
            }
        }
    }

    func setSize(size: Int){
        articlesSize = size
    }


    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        articles.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleCell", for: indexPath) as! ArticleTableViewCell
        cell.titleLabel.text = articles[indexPath.row].title ?? "タイトルなし"
        cell.descriptionLabel.text = articles[indexPath.row].description ?? "詳細なし"

        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "ToOnlyBusinessArticleSegue", sender: nil)
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension SomeBusinessArticlesTableViewController: LoadApiDataDelegate {
    func presentInfo(articles: [Article.Detail]) {
        self.articles = articles
        print("articles:\(articles)")
        print("self.articles:\(self.articles)")
        tableView.reloadData()
    }
}
