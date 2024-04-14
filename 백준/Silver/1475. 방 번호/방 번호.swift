let num = readLine()!.map { Int(String($0))! }
var arr = Array(repeating: 0, count: 10)

for n in num {
    arr[n] += 1
}

let temp = (arr[6] + arr[9] + 1) / 2

arr[6] = temp
arr[9] = temp

print(arr.max()!)