var chessField: [String: (alpha:Character,num:Int)?] = [
    "Black King": ("B",3),
    "Black Queen": ("D", 4),
    "Black Horse": ("H", 1),
]

chessField["Black Horse"] = nil

print(chessField)

for i in chessField{
    if let coords = chessField[i.key]{
        print("\(coords!.alpha):\(coords!.num)")
    }else{
        print("figure is killed.")
    }    
}

func checkFigure(f: String){
    if let coords = chessField[f]{
        print("The \(f) is at (\(coords!.alpha), \(coords!.num))")
    } else {
        print("The \(f) has been killed.")
    }
}

checkFigure(f: "Black King")
checkFigure(f: "Black Horse")