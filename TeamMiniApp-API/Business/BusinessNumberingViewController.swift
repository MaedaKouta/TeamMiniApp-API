//
//  BusinessNumberingViewController.swift
//  TeamMiniApp-API
//
//  Created by 前田航汰 on 2022/04/08.
//

import UIKit

class BusinessNumberingViewController: UIViewController {

    @IBOutlet private(set) weak var sliderValue: UISlider!
    @IBOutlet private weak var SliderValueLabel: UILabel!

    @IBAction private func changeSlider(_ sender: Any) {
        SliderValueLabel.text = String(Int(sliderValue.value))
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toArticlesVCSegue" {
            let nextVC = segue.destination as! SomeBusinessArticlesTableViewController
            nextVC.setSize(size: Int(sliderValue.value))
        }
    }

}
