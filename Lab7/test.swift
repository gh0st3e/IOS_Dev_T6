class Human {
    let name: String
    var child = [Human?]()
    var father: Human?
    var mother: Human?
  
    init(name: String){
        self.name = name
    }
    deinit {
        print(self.name+"  — удален")
    }
}
if 1==1 {
    var Kirill = Human(name: "Кирилл")
    var Olga = Human(name: "Ольга")
    var Aleks = Human(name: "Алексей")
    Kirill.father = Aleks
    Kirill.mother = Olga
    Aleks.child.append(Kirill)
    Olga.child.append(Kirill)
}
