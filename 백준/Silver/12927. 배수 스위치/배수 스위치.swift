var array = readLine()!.map { $0 == "Y" ? true : false }
var result = 0

for i in 0..<array.count where array[i] {
    result += 1
    
    for j in i..<array.count where (j + 1) % (i + 1) == 0 {
        array[j].toggle()
    }
}

print(array.contains(true) ? -1 : result)
