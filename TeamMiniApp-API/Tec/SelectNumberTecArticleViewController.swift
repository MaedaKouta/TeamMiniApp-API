//
//  SelectNumberTecArticeViewController.swift
//  TeamMiniApp-API
//
//  Created by 近藤米功 on 2022/04/09.
//

import UIKit

class SelectNumberTecArticleViewController: UIViewController {
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var numberTecArticle: UILabel!
    var getArticle = GetArticle()
    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad")

    }

    @IBAction func tappedSlider(_ sender: Any) {
        numberTecArticle.text = String(Int(slider.value))
    }

    @IBAction func tappedArticleViewButton(_ sender: Any) {
        performSegue(withIdentifier: "tecArticleViewControllerSegue", sender: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "tecArticleViewControllerSegue"{
            let tecArticleVC = segue.destination as! TecArticleViewController
            tecArticleVC.numberTecArticle = Int(slider.value)
            // スライダーの値を渡す
        }
    }
}
