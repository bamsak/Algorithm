let n = Int(readLine()!)!

let temp = readLine()!.split(separator: " ").map { String($0) }
var dict = [String: Int]()
for i in 0..<n {
    dict[temp[i]] = i
}

let input = readLine()!.split(separator: " ").map { String($0) }

var count = 0

for i in 0..<(n-1) {
    for j in (i+1)..<n {
        if dict[input[i]]! < dict[input[j]]! {
            count += 1
        }
    }
}

print("\(count)/\(n * (n - 1) / 2)")