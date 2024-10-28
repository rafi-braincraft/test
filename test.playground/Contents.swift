import Foundation

var greeting = "Hello, playground"
print(greeting)
greeting = "Hello, World!"
print(greeting)


let wel = 10
var wel2: Int? = nil
var wel3: Int = wel2 ?? 10
print(wel)

let date = Date()
print(date)

var flo:Double = 10.02
print(flo)

var flo2:Double = 10.02
print(flo2)

let flo3:Float = 10.03
print(flo3)

let fb:Bool = true
print(fb)
print("\n")

if !fb{
    print("braincraft")
} else if flo == 10.01{
    print("level 4")
} else {
    print(478)
}


var multi:Int = 10
multi *= 2
multi+=1
print(multi)

var x=10.05
var y=5
var z = x/Double(y)
var formattedString = String (format: "%.2f",z)
print("the num is \(z)")
print(formattedString)



func add(a: Int, b: Int) -> Int {
    return a + b
}
func add(a: Double, b: Double) -> Double {
    return a + b
}

print(add(a: 100.01, b: 200))


func doElse(x:Int){
    guard x>=10 else {
        print("x<10")
        return
    }
    print("x>=10")
}
print("\n")
doElse(x: 100)
doElse(x: 9)


@MainActor func calcul() -> Double{
    return flo + flo2
}
func calcul(a:Double, b:Double)->Double{
    return a + b
}


let xx = calcul()
//instead
var calculVar:Double {
    return flo+flo2
}
print(calculVar)
flo=12.0
print(calculVar)

