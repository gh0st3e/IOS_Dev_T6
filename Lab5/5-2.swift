// 5.2.1
let nums = [322,228,17,84,30,196,1,2,59,100,10000000]
let ascSort = nums.sorted(by: {
    (a: Int, b: Int) -> Bool in
    return a < b
})
print(ascSort)
let descSort = nums.sorted(by: {
    (a: Int, b: Int) -> Bool in
    return a > b
})
print(descSort)
print("\n")

// 5.2.2
let bigNums: [Int?] = [100, 92, nil, 11, 123456789, 56, nil]
let numsSum = bigNums.map { (number) -> String in
    var sum = 0
    if let n = number {
        for s in String(n) {
            sum += Int(String(s))!
        }
        return String(sum)
    } else {
        return "nil"
    }
}
print(numsSum)
print("\n")

// 5.2.3
let twoArr = [[100,200,300],[17,100000000],[484,0,3]]
let convertToOneArr = { (array: [[Int]]) -> [Int] in
    var result = [Int]()
    for subArray in array {
        for value in subArray {
            result.append(value)
        }
    }
    return result
}
let oneArr = convertToOneArr(twoArr)
print(oneArr)
print("\n")

// 5.2.4
let values = [10, 1, 2, 3]
let maxValue = values.reduce(values[0]) { (currentMax, value) in
    return max(currentMax, value)
}
print(maxValue)
