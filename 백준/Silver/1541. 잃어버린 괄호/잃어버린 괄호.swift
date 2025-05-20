let input = readLine()!.split(separator: "-")
var result = input[0].split(separator: "+").map { Int($0)! }.reduce(0, +)

for i in input[1...] {
  result -= i.split(separator: "+").map { Int($0)! }.reduce(0, +)
}
print(result)