//
//  ViewController.swift
//  LEDBoard
//
//  Created by won on 2022/08/29.
//

import UIKit

class ViewController: UIViewController, LEDBoardSettingDelegate {

    @IBOutlet weak var contentsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .yellow // yellow를 지정해주는 이유? backgroundColor를 가져오면 UIColor의 yellow가 아니기 때문에
       
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let viewController = segue.destination as? SettingViewController {
            viewController.delegate = self
            viewController.contents = self.contentsLabel.text
            viewController.contentsColor = self.contentsLabel.textColor
            viewController.backgroundColor = self.view.backgroundColor ?? .yellow
        }
    }
    
    func changedSetting(text: String?, textColor: UIColor, backgroudColor: UIColor) {
        self.contentsLabel.text = text
        self.contentsLabel.textColor = textColor
        self.view.backgroundColor = backgroudColor
    }

}

