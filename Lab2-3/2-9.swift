typealias Operation = (operandOne: Float, operandTwo: Float, operation: Character)
let operation: Operation = (3.1, 33, "+")
switch operation {
    case let (first, second, op) where op == "+":
        print(first + second)
    case let (first, second, op) where op == "*":
        print(first * second)
    case let (first, second, op) where op == "-":
        print(first - second)
    case let (first, second, op) where op == "/":
        print(first / second)
    default:
        print("No math operation")
}