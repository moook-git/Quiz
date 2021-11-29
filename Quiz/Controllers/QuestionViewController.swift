//
//  FirstViewController.swift
//  Quiz
//
//  Created by Кирилл Моисеев on 26.11.2021.
//

import UIKit

class QuestionViewController: UIViewController {
    
    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var headerTitle: UILabel!
    @IBOutlet weak var headerRange: UIProgressView!
    @IBOutlet weak var questionStack: UIStackView!
    
    var result: [Animal] = []
    var current = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        questionStack.alignment = .fill
        questionStack.distribution = .fillEqually
        
        setQuestionHeader(questions: questions, index: current )
        setQuestionAnswers(questions: questions, index: current )
    }
    
    func setQuestionHeader (questions: [Question], index: Int) {
        let range: Float = 1.0 / Float(questions.count) * Float(index)
        
        headerLabel.text = "Вопрос \(index + 1) из \(questions.count)"
        headerTitle.text = questions[ index ].title
        headerRange.setProgress(range, animated: true)
    }
    
    func setQuestionAnswers (questions: [Question], index: Int) {
        for answer in questions[index].answers {
            let button = createButton(answer: answer)
            questionStack.addArrangedSubview(button)
        }
    }
    
    func createButton (answer: Answer) -> UIButton {
        let button = UIButton()
        
        button.setTitle(answer.text, for: .normal)
        button.backgroundColor = UIColor.systemBlue
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        return button
    }
    
    func changeQuestion () {
        guard current < questions.count - 1 else {
            let resultViewController = storyboard?.instantiateViewController(withIdentifier: "ResultViewController") as! ResultViewController
            navigationController?.pushViewController(resultViewController, animated: true)
            resultViewController.answers = result
            return
        }
        current += 1
        questionStack.subviews.forEach { $0.removeFromSuperview() }
        setQuestionHeader(questions: questions, index: current )
        setQuestionAnswers(questions: questions, index: current )
    }
    
    @objc func buttonAction (sender: UIButton!) {
        let answers = questions[current].answers
        let title = sender.title(for: .normal)
        let answer = answers.filter({ $0.text == title })
        
        result.append( answer[0].type )
        changeQuestion()
    }

}
