//
//  ResultViewController.swift
//  Quiz
//
//  Created by Кирилл Моисеев on 26.11.2021.
//

import UIKit

class ResultViewController: UIViewController {
    
    var answers: [Animal] = []
    
    @IBOutlet weak var resultText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Вариант через Foreach
        var animalsDict: [Animal: Int] = [:]
        answers.forEach({ animalsDict[$0] = (animalsDict[$0] ?? 0) + 1 })
        let mostAnimal = animalsDict.max(by: { $0.1 < $1.1 })
        
        // Вариант через NSCountedSet
        // let animalSet = NSCountedSet(array: answers)
        // let mostAnimal2 = animalSet.max { animalSet.count(for: $0) < animalSet.count(for: $1) } as? Animal
        
        // Вариант через Reduce
        // let animalReduce = answers.reduce(into: [:]) { dict, Animal in dict[Animal, default: 0] += 1 }
        // let mostAnimal3 = animalReduce.max(by: { $0.1 < $1.1 })
        
        
        // Вывод
        resultText.text = mostAnimal?.key.description
        
    }
    
    @IBAction func endQuiz(_ sender: UIButton) {
        navigationController?.popToRootViewController(animated: true)
    }
    
}
