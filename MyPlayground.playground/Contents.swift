import Foundation

var greeting: Int? = nil
var name=greeting ?? 10
print("string is \(name.magnitude)")

func userInput(str:String?,str2:String?)->String{
//    if let str=str{
//        return str
//    }
//    return "N/A"
    guard let str,let str2 else{ //creating a variable with same name like let str=str
        return "N/A"
    }
    return str+str2
}

print(userInput(str:"brain",str2:"craft"))
print(userInput(str:nil,str2:"craft"))

func optionalChaining(str: String?)
{
    let a=str?.first
    let b=a?.lowercased()
    print(b ?? "N/A")
}
optionalChaining(str:"Hello")
optionalChaining(str:nil)


//worst practice
let force:String?="Hello"
print(force!.uppercased())


//tuple
let num1=10,num2=20
let strTu="hii"
let tuple=(num1,num2,strTu)
print(tuple)

func userInfo(str: String, num: Int, bo: Bool)->(name:String,age:Int,Maried:Bool)
{
    return (str,num,bo)
}
let info=userInfo(str: "Rafi", num: 10, bo: true)
print(info)
print(info.name)
print(info.0)


struct Car {
    let name: String
    let price: Double
    let color: String
    init(name: String, price: Double, color: String){
        self.name=name
        if price<0{
            self.price=0
        }else{
            self.price=price
        }
        self.color=color
        
    }
}

let car=Car(name: "BMW", price: 100000, color: "Black")
print(car.name)
print(car.price)
print(car.color)



struct CarBrand {
    private(set) var type: CarType
    let model: String
    mutating func changeBrand(type: CarType)
    {
        self.type=type
    }
    
    
}
enum CarType {
    case toyota,honda,bmw
    var brand:String{
        switch self {
        case .toyota:
            return "toyota"
        case .honda:
            return "honda"
        case .bmw:
            return "bmw"
        }
    }
}
var car1 = CarBrand(type: .toyota, model: "Corolla")
print(car1.type.brand)

var car2=CarBrand(type: .bmw, model: "X5")
car2.changeBrand(type: .honda)
print(car2.type.brand)

class ScreenViewModel {
    let title:String
    private var buttonFlag:Bool=false
    init(title:String,buttonFlag:Bool)
    {
        self.title=title
        self.buttonFlag=buttonFlag
    }
    func pressButton()
    {
        buttonFlag.toggle()
    }
    func getButtonFlag()->Bool
    {
        return buttonFlag
    }
    
}

let viewModel=ScreenViewModel(title: "Hello World", buttonFlag: false)
viewModel.pressButton()
print(viewModel.getButtonFlag())


var fruitsArray: [String] = ["Apple", "Banana", "Orange"]
fruitsArray.append("Mango")
fruitsArray.append(contentsOf: ["Grapes", "Pineapple"])
print(fruitsArray[1])
print(fruitsArray.last!)
if fruitsArray.indices.contains(4)
{
    fruitsArray.remove(at: 4)
}
print(fruitsArray.count)
//fruitsArray.removeAll()
print(fruitsArray.count)

print("\n")

var fruitsSet: Set<String> = ["Apple", "Banana", "Orange","Apple"]
fruitsSet.insert("Mango")
print(fruitsSet.count)
fruitsSet.remove("Apple")
print(fruitsSet.count)
//fruitsSet.removeAll()
print(fruitsSet.count)


var fruitDic: [String:String] = [
    "Apple":"Red",
    "Banana":"Yellow",
    "Orange":"Orange"
]
fruitDic["Mango"]="Green"
print(fruitDic)
print(fruitDic["Mango"] ?? "Not Found")
fruitDic.removeValue(forKey: "Orange")
print(fruitDic["Orange"] ?? "Not Found")
print("\n")

var n=3
for i in 1...n
{
    print(i)
}
for i in fruitsSet
{
    print(i)
}

for i in fruitDic
        .keys
{
    print(fruitDic[i] ?? "NOT FOUND")
}

for (i,fruit) in fruitDic.enumerated()
{
    print("\(i) \(fruit)")
}

n=4
while n>0
{
    print(n)
    n-=1
}



struct Employee {
    let name: String
    let age: Int
    let dept: String
}
var employees: [Employee] = [
    Employee(name: "John", age: 20, dept: "IT"),
    Employee(name: "Jane", age: 21, dept: "HR"),
    Employee(name: "Jim", age: 42, dept: "Sales"),
    Employee(name: "Jill", age: 43, dept: "Marketing"),
]
var allYoungEmployees: [Employee] = employees.filter{ $0.age<30
    //user in user.age<30
    //return user.age<30
    //if else
}
//for i in employees {
//    if(i.age<30)
//    {
//        allYoungEmployees.append(i)
//    }
//}

print(allYoungEmployees)


var sortedEmployess: [Employee] = employees.sorted {$0.age<$1.age
    //user1,user2 in return user1.age<user2.age
}
//for i in sortedEmployess { print(i.name) }

var employeeNames: [String] = sortedEmployess.map{ $0.name
    //user in return user.name
}
print (employeeNames)


struct EmployeeModel : EmployeeProtocol{
    let name: String
    var age: Int
    let dept: String
}
protocol EmployeeProtocol {
    //var age: Int
    var name: String { get }
}
