//
//  SettingViewController.swift
//  LEDBoard
//
//  Created by won on 2022/08/29.
//

import UIKit

protocol LEDBoardSettingDelegate: AnyObject{
    func changedSetting(text: String?, textColor: UIColor, backgroudColor: UIColor)
}

class SettingViewController: UIViewController {

    @IBOutlet weak var inputText: UITextField!
    
    @IBOutlet weak var blackButton: UIButton!
    @IBOutlet weak var blueButton: UIButton!
    @IBOutlet weak var greenButton: UIButton!
    
    @IBOutlet weak var orangeButton: UIButton!
    @IBOutlet weak var purpleButton: UIButton!
    @IBOutlet weak var yellowButton: UIButton!
    
    var contents: String?
    var contentsColor: UIColor = .black
    var backgroundColor: UIColor = .yellow
    
    weak var delegate: LEDBoardSettingDelegate? // delegate 변수
    
    // 저장 버튼
    @IBAction func saveColorButton(_ sender: Any) {
        self.delegate?.changedSetting(text: self.inputText.text, textColor: self.contentsColor, backgroudColor: self.backgroundColor)
        self.navigationController?.popViewController(animated: true)
    }
    
    // 텍스트 색상 변경
    @IBAction func tapTextColorButton(_ sender: UIButton) {
        if sender == blackButton {
            self.contentsColor = .black
            self.settingTextColor(color: .black)
        } else if sender == blueButton {
            self.contentsColor = .blue
            self.settingTextColor(color: .blue)
        } else {
            self.contentsColor = .green
            self.settingTextColor(color: .green)
        }
    }
    
    // 배경 색상 변경
    @IBAction func tapBackgroundColorButton(_ sender: UIButton) {
        if sender == orangeButton {
            self.backgroundColor = .orange
            self.settingBackGroundColor(color: .orange)
        } else if sender == purpleButton {
            self.backgroundColor = .purple
            self.settingBackGroundColor(color: .purple)
        } else {
            self.backgroundColor = .yellow
            self.settingBackGroundColor(color: .yellow)
        }
    }
    
    // 화면 진입시 초기값
    override func viewDidLoad() {
        super.viewDidLoad()
        self.inputText.text = self.contents
        self.settingTextColor(color: self.contentsColor)
        self.settingBackGroundColor(color: self.backgroundColor)
    }
    
    private func settingTextColor(color: UIColor) {
        self.blackButton.alpha = (color == .black ? 1 : 0.2)
        self.blueButton.alpha = (color == .blue ? 1 : 0.2)
        self.greenButton.alpha = (color == .green ? 1 : 0.2)
    }
    
    private func settingBackGroundColor(color: UIColor) {
        self.orangeButton.alpha = (color == .orange ? 1 : 0.2)
        self.purpleButton.alpha = (color == .purple ? 1 : 0.2)
        self.yellowButton.alpha = (color == .yellow ? 1 : 0.2)
    }
}
