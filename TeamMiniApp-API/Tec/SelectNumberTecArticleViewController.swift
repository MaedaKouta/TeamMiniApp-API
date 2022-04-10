//
//  SelectNumberTecArticeViewController.swift
//  TeamMiniApp-API
//
//  Created by 近藤米功 on 2022/04/09.
//

import UIKit

class SelectNumberTecArticleViewController: UIViewController {
    @IBOutlet private weak var slider: UISlider!
    @IBOutlet private weak var numberTecArticle: UILabel!
    
    @IBAction private func tappedSlider(_ sender: Any) {
        numberTecArticle.text = String(Int(slider.value))
    }

    @IBAction private func tappedTecArticleViewButton(_ sender: Any) {
        performSegue(withIdentifier: "tecArticleViewControllerSegue", sender: nil)
    }


    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // 画面遷移時にスライダーの値（記事数）を渡す
        if segue.identifier == "tecArticleViewControllerSegue" {
            let tecArticleVC = segue.destination as! TecArticleViewController
            tecArticleVC.catchNumberTecArticle = Int(slider.value)
        }
    }
}
