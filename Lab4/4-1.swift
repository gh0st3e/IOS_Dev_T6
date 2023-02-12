var myIntArray = Array(5...125)
for _ in 0...4{
    myIntArray.removeFirst()
}

myIntArray[myIntArray.count - 5...myIntArray.count - 1] = [0, 0]
print(myIntArray)

for ( index, value ) in myIntArray.enumerated(){
    print("index: \(index)")
    print("value: \(value)")
}

