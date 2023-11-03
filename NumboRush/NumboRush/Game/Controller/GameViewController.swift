//
//  GameViewController.swift
//  NumboRush
//
//  Created by Sviatoslav Samoilov on 16.07.2023.
//

import UIKit

final class GameViewController: UIViewController {
    //MARK: - IBOutlets
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var taskLabel: UILabel!
    @IBOutlet var numbersButtonsCollection: [UIButton]!
    @IBOutlet weak var emojiLabel: UILabel!
    @IBOutlet weak var repeatButton: UIButton!
    
    //MARK: - Properties
    var randomArray = RandomArray()
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        configureGameScreen()
    }
    
    // MARK: - Actions
    @IBAction func numbersButtonsAction(_ sender: UIButton) {
        check(answer: numberLabel.text ?? "", for: sender)
    }
    
    @IBAction func repeatButton(_ sender: UIButton) {
        configureGameScreen()
    }
    
    // MARK: - Methods
    private func configureGameScreen() {
        randomArray.configureArray()
        configureNumber()
        configureButtons()
        
        emojiLabel.isHidden = true
        repeatButton.isHidden = true
        taskLabel.text = "Найди все числа"
        numberLabel.isHidden = false
        numbersButtonsCollection.forEach{ button in
            button.isHidden = false
        }
    }
    
    private func configureNumber() {
        randomArray.arrayInt.shuffle()
        numberLabel.text = String(randomArray.arrayInt.first ?? 0)
    }
    
    private func configureButtons() {
        randomArray.arrayInt.enumerated().forEach { (index, value) in
            numbersButtonsCollection[index].setTitle(String(value), for: .normal)
        }
    }
    
    private func check(answer: String, for button: UIButton) {
        let isRightNumber = button.currentTitle == numberLabel.text
        let isArrayNotEmpty = randomArray.arrayInt.count > 1
        
        if isArrayNotEmpty {
            if isRightNumber {
                button.isHidden = true
                randomArray.arrayInt.removeFirst()
                configureNumber()
            } else {
                numbersButtonsCollection.forEach { button in
                    button.isHidden = true
                }
                configureWinLoseScreen(isWin: false)
            }
        } else {
            button.isHidden = true
            configureWinLoseScreen(isWin: true)
        }
    }
    
    private func configureWinLoseScreen(isWin: Bool) {
        if isWin {
            taskLabel.text = "ПОБЕДА"
            emojiLabel.text = "🥳"
        } else {
            taskLabel.text = "ПОРАЖЕНИЕ"
            emojiLabel.text = "🙈"
        }
        emojiLabel.isHidden = false
        repeatButton.isHidden = false
        numberLabel.isHidden = true
    }
}
