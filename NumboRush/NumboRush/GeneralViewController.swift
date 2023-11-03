//
//  GeneralViewController.swift
//  NumboRush
//
//  Created by Sviatoslav Samoilov on 16.07.2023.
//

import UIKit

class GeneralViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Actions
    @IBAction func newGameButton(_ sender: UIButton) {
        performSegue(withIdentifier: "goToGameScreen", sender: sender)
    }
    
    @IBAction func unwindAction(unwindSegue: UIStoryboardSegue) { }
}
