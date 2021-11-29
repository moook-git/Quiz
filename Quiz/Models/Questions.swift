//
//  Data.swift
//  Quiz
//
//  Created by Кирилл Моисеев on 26.11.2021.
//

import Foundation

enum Animal {
    case cat
    case dog
    case bird
    case rabbit
    
    var description: String {
        switch self {
        case .cat:
            return "Кошка - Вам нравится быть с друзьями. Вы окружаете себя людьми, которые вам нравятся и всегда готовы помоч."
        case .dog:
            return "Собака - Вы лидер, который постоянно идет к своей цели. Любите быть в центре внимания. Интересуетесь новинками техники и гаджетами. "
        case .bird:
            return "Птица - Вы всегда знаете, что в моде, на каком «поле» самая вкусная трава, как обратить на себя внимание в большой толпе.  "
        case .rabbit:
            return "Кролик - Идеальное сочетание ума и красоты. Редко признаете свои ошибки. Вы находитесь в постоянном движении, вам нужна динамика и скорость."
        }
    }
}

struct Question {
    var title: String
    var answers: [Answer]
}

struct Answer {
    var text: String
    var type: Animal
}

var questions: [Question] = [
    Question(
        title: "Что ты любишь есть?",
        answers: [
            Answer(text: "Рыба", type: .cat),
            Answer(text: "Мясо", type: .dog),
            Answer(text: "Хлеб", type: .bird),
            Answer(text: "Овощи", type: .rabbit)
        ]
    ),
    Question(
        title: "Что ты любишь делать?",
        answers: [
            Answer(text: "Спать", type: .cat),
            Answer(text: "Бегать", type: .dog),
            Answer(text: "Летать", type: .bird),
            Answer(text: "Прыгать", type: .rabbit)
        ]
    ),
    Question(
        title: "Любите ли вы поездки",
        answers: [
            Answer(text: "Да", type: .cat),
            Answer(text: "Нет", type: .dog)
        ]
    )
]
