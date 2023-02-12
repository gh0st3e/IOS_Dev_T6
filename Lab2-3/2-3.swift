typealias Text = String

let first: Text = "3228"
let second: Text = "123456789"
let third: Text = "Den4ik"

if Int(first) != nil{print(first)}
if Int(second) != nil{print(second)}
if Int(third) != nil{print(third)}

var firstTupple = (year: 2019, faculty: "FIT", num: 4)

print(firstTupple.0, firstTupple.1, firstTupple.2)
print(firstTupple.year, firstTupple.faculty, firstTupple.num)

firstTupple = (1234,"LESHOZ",666)
let (fr,sc,th) = firstTupple

var secondTupple = (4321,"BOLDMAN",999)
(firstTupple,secondTupple) = (secondTupple,firstTupple)

print(firstTupple,secondTupple)