let j = readLine()!.split(separator: " ").map { Int($0)! }
let s = readLine()!.split(separator: " ").map { Int($0)! }

var check = false
var nJ = 0 
var nS = 0

for i in 0..<j.count {
    nJ += j[i]
    if nJ > nS {
        check = true
    }
    nS += s[i]
}

print(check ? "Yes" : "No")