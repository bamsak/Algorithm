let kl = readLine()!.split(separator: " ").map { Int($0)! }
let (k, l) = (kl[0], kl[1])

var dict = [String: Int]()

for i in 1...l {
  dict[readLine()!] = i
}

let temp = dict.sorted { $0.value < $1.value }

for i in 0..<k {
  if i >= temp.count { break }
  print(temp[i].key)
}