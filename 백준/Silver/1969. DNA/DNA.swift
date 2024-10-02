let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (nm[0], nm[1])

var dnas = [[Character]](repeating: [], count: n)

for i in 0..<n {
    dnas[i] = readLine()!.map { $0 }
}

var dna = ""
var hd = 0

for i in 0..<m {
    var dict: [Character: Int] = ["A": 0, "T": 0, "G": 0, "C": 0]
    
    for j in 0..<dnas.count {
        dict[dnas[j][i]]! += 1
    }
    
    var temp = ""
    var count = -1
    
    for c in dict.keys.sorted() where dict[c]! > count {
        temp = "\(c)"
        count = dict[c]!
    }
    
    dna += temp
    hd += n - count
}

print(dna)
print(hd)
