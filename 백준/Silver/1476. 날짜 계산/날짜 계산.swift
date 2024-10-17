let esm = readLine()!.split(separator: " ").map { Int($0)! }
let (e, s, m) = (esm[0], esm[1], esm[2])
var result = 1
var (tempE, tempS, tempM) = (1, 1, 1)
while true {
    if tempE == e && tempS == s && tempM == m { break }
    result += 1
    tempE += 1
    tempS += 1
    tempM += 1
    
    if tempE > 15 { tempE = 1 }
    if tempS > 28 { tempS = 1 }
    if tempM > 19 { tempM = 1 }
}

print(result)
