// 6.1.1

enum Months: Int {
    case january = 1
    case february
    case march
    case april
    case may
    case june
    case july
    case august
    case september
    case october
    case november
    case december
    
    func timeOfYear() -> String {
        switch self {
            case .january, .december, .february:
                return "Winter"
            case .march, .april, .may:
                return "Spring"
            case .june, .july, .august:
                return "Summer"
            case .september, .october, .november:
                return "Autumn"
        }
    }
}

// 6.1.2

let april = Months.april
let july = Months.init(rawValue: 7)!
print("\(april) is \(april.timeOfYear())")
print("\(july) is \(july.timeOfYear())")

// 6.1.3

enum ArithmeticExpression {
    case number(Int)
    indirect case addition(ArithmeticExpression, ArithmeticExpression)
    indirect case subtraction(ArithmeticExpression,  ArithmeticExpression)
    indirect case multiplication(ArithmeticExpression,  ArithmeticExpression)
    indirect case division(ArithmeticExpression,  ArithmeticExpression)
    
    func evaluate(expression: ArithmeticExpression? =  nil ) -> Int{
        let expression = (expression == nil ? self : expression)
        switch expression! {
            case .number(let value):
                return value
            case .addition(let valueLeft, let valueRight):
                return self.evaluate(expression: valueLeft) + self.evaluate(expression: valueRight)
            case .subtraction(let valueLeft, let valueRight):
                return self.evaluate(expression: valueLeft) - self.evaluate(expression: valueRight)
            case .multiplication(let valueLeft, let valueRight):
                return self.evaluate(expression: valueLeft) * self.evaluate(expression: valueRight)
            case .division(let valueLeft, let valueRight):
                return self.evaluate(expression: valueLeft) / self.evaluate(expression: valueRight)
        }
    }
}

let expression = ArithmeticExpression.addition(
    ArithmeticExpression.number(5),
    ArithmeticExpression.multiplication(
        ArithmeticExpression.number(2),
        ArithmeticExpression.number(3)
    )
)

let result = expression.evaluate()
print(result) // Output: 11
