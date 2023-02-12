let numbers = [843,1234,4321,0,150,3000]
for n in numbers {
    print(n)
}

var sum = 0
var i = 0
while i < numbers.count {
    sum += numbers[i]
    i += 1
}
print("\nSum: \(sum)")

sum = 0
i = 0
repeat {
    sum += numbers[i]
    i += 1
} while i < numbers.count
print("\nSum: \(sum)")

sum = 0
for i in stride(from: numbers.count - 1, through: 0, by: -1) {
    sum += numbers[i]
}
print("\nSum: \(sum)\n")

for n in numbers {
    guard n > 1000 else {
        print(n)
        continue
    }
}