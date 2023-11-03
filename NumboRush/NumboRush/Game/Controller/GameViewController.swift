//
//  GameViewController.swift
//  NumboRush
//
//  Created by Sviatoslav Samoilov on 16.07.2023.
//

import UIKit

class GameViewController: UIViewController {
    //MARK: - IBOutlets
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var taskLabel: UILabel!
    @IBOutlet var buttonsCollection: [UIButton]!
    @IBOutlet weak var emojiLabel: UILabel!
    @IBOutlet weak var repeatButton: UIButton!
    
    //MARK: - Properties
    var randomArray = RandomArray()
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        configureGameScreen()
        randomArray.configureArray()
        configureButtons()
        configureNumber()
    }
    
    // MARK: - Actions
    @IBAction func button1(_ sender: UIButton) {
        check(answer: numberLabel.text ?? "", for: sender)
    }
    
    @IBAction func button2(_ sender: UIButton) {
        check(answer: numberLabel.text ?? "", for: sender)
    }
    
    @IBAction func button3(_ sender: UIButton) {
        check(answer: numberLabel.text ?? "", for: sender)
    }
    
    @IBAction func button4(_ sender: UIButton) {
        check(answer: numberLabel.text ?? "", for: sender)
    }
    
    @IBAction func button5(_ sender: UIButton) {
        check(answer: numberLabel.text ?? "", for: sender)
    }
    
    @IBAction func button6(_ sender: UIButton) {
        check(answer: numberLabel.text ?? "", for: sender)
    }
    
    @IBAction func button7(_ sender: UIButton) {
        check(answer: numberLabel.text ?? "", for: sender)
    }
    
    @IBAction func button8(_ sender: UIButton) {
        check(answer: numberLabel.text ?? "", for: sender)
    }
    
    @IBAction func button9(_ sender: UIButton) {
        check(answer: numberLabel.text ?? "", for: sender)
    }
    
    @IBAction func button10(_ sender: UIButton) {
        check(answer: numberLabel.text ?? "", for: sender)
    }
    
    @IBAction func button11(_ sender: UIButton) {
        check(answer: numberLabel.text ?? "", for: sender)
    }
    
    @IBAction func button12(_ sender: UIButton) {
        check(answer: numberLabel.text ?? "", for: sender)
    }
    
    @IBAction func button13(_ sender: UIButton) {
        check(answer: numberLabel.text ?? "", for: sender)
    }
    
    @IBAction func button14(_ sender: UIButton) {
        check(answer: numberLabel.text ?? "", for: sender)
    }
    
    @IBAction func button15(_ sender: UIButton) {
        check(answer: numberLabel.text ?? "", for: sender)
    }
    
    @IBAction func repeatButton(_ sender: UIButton) {
        viewDidLoad()
    }
    
    // MARK: - Methods
    private func configureButtons() {
        var i = 0
        buttonsCollection.forEach { button in
            button.setTitle(String(randomArray.arrayInt[i]), for: .normal)
            i += 1
        }
    }
    
    private func configureNumber() {
        randomArray.arrayInt.shuffle()
        numberLabel.text = String(randomArray.arrayInt[0])
    }
    
    private func check(answer: String, for button: UIButton) {
        let isRightNumber = button.currentTitle == numberLabel.text
        let isArrayEmpty = randomArray.arrayInt.count > 1
        
        if isArrayEmpty {
            if isRightNumber {
                button.isHidden = true
                randomArray.arrayInt.remove(at: 0)
                configureNumber()
            } else {
                taskLabel.text = "ПОРАЖЕНИЕ"
                emojiLabel.text = "🙈"
                buttonsCollection.forEach { button in
                    button.isHidden = true
                }
                configureWinOrLoseScreen()
            }
        } else {
            button.isHidden = true
            taskLabel.text = "ПОБЕДА"
            emojiLabel.text = "🥳"
            configureWinOrLoseScreen()
        }
    }
    
    private func configureGameScreen() {
        emojiLabel.isHidden = true
        repeatButton.isHidden = true
        taskLabel.text = "Найди все числа"
        numberLabel.isHidden = false
        buttonsCollection.forEach{ button in
            button.isHidden = false
        }
    }
    
    private func configureWinOrLoseScreen() {
        repeatButton.isHidden = false
        emojiLabel.isHidden = false
        numberLabel.isHidden = true
    }
}
