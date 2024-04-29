import Foundation

struct Question {
    var text: String
    var type: ResponseType
    var answers: [Answer]
}

enum ResponseType {
    case single, multiple, ranged
}

struct Answer {
    var text: String
    var type: AnimalType
}

enum AnimalType: Character {
    case lion = "🦁", cat = "🐱", rabbit = "🐰", turtle = "🐢"
    var definition: String {
        switch self {
        case .lion:
            return "You're a social butterfly who thrives in the spotlight. You love being around others and trying new things."
        case .cat:
            return "You're a free spirit who likes to do your own thing. You're independent and enjoy your alone time."
        case .rabbit:
            return "You're a gentle soul who loves comfort and coziness. You're a bit of a homebody and enjoy taking care of yourself."
        case .turtle:
            return "You're a wise and thoughtful individual who takes your time to make decisions. You're patient and focused on your goals."
        }
    }
}
