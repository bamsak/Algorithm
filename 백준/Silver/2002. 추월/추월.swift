let n = Int(readLine()!)!
var count = 0
var inCars = [String]()
var outCars = [String]()
var state = [String: Bool]()

for _ in 0..<n {
    let s = readLine()!
    
    inCars.append(s)
    state[s] = false
}

for _ in 0..<n {
    let e = readLine()!
    outCars.append(e)
}

inCars.reverse()
outCars.reverse()

while !inCars.isEmpty && !outCars.isEmpty {
    let inFirst = inCars.last!
    let outFirst = outCars.last!
    
    if state[inFirst]! {
        inCars.removeLast()
        continue
    }
    
    if inFirst == outFirst {
        state[inFirst] = true
        inCars.removeLast()
        outCars.removeLast()
    } else {
        count += 1
        state[outFirst] = true
        outCars.removeLast()
    }
}

print(count)
