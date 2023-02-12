let assumedString: String! = "Неявно развернутая опциональная строка"
print(assumedString)
if let definiteString = assumedString {
    print(definiteString)
}