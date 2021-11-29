//
//  ViewController.swift
//  Quiz
//
//  Created by Кирилл Моисеев on 26.11.2021.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func startQuiz(_ sender: UIButton) {
        let questionViewController = storyboard?.instantiateViewController(withIdentifier: "QuestionViewController") as! QuestionViewController
        navigationController?.pushViewController(questionViewController, animated: true)
    }
}
