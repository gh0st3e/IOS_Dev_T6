// 5.1
func SumOfDouble(_ nums: Double...) -> Double{
    var sum :Double = 0.0
    for number in nums{
        sum += number
    } 
    return sum
}
// 5.2
func AverageOfDouble(_ numbers: Double...) -> Double{
    let sum = SumOfDouble(numbers[0], numbers[1], numbers[2], numbers[3], numbers[4])
    return sum / Double(numbers.count)
}

var sumResult = SumOfDouble(1.1,2.2,3.3,4.4,56.56)
print(sumResult)

var averageResult = AverageOfDouble(1.0,2.0,3.0,4.0,56.0)
print(averageResult)

// 5.3
func invertSign(a: inout Int) { a = -a }
var a = 10
invertSign(a: &a)
print(a)

// 5.4
func doWithTwo(doFunc: (Double...) -> Double, d1: Double, d2: Double ) -> Double {
    return doFunc(d1, d2)
}
let result = doWithTwo(doFunc: SumOfDouble, d1: 1.0, d2: 2.0)
print(result)

// 5.5
func operation(which: String) -> (Double...) -> Double {
    switch which {
        case "sum":
            return SumOfDouble
        case "avg":
            return AverageOfDouble
        default:
            return SumOfDouble
    }
}

let method = operation(which: "sum")
let res = method(1.1,2.2,3.3,4.4,56.56)
print(res)

// 5.6
func doOperation(operation: String) -> ((Double, Double) -> Double)? {
    switch operation {
        case "+":
            return {
                (a: Double, b: Double) in a + b
            }
        case "-":
            return {
                (a: Double, b: Double) in a - b
            }
        case "*":
            return {
                (a: Double, b: Double) in a * b
            }
        case "/":
            return {
                (a: Double, b: Double) in a / b
            }
        default:
            return nil
    }
}
let op = doOperation(operation: "+")
if let result = op?(2, 3) {
    print("Result: \(result)")
}