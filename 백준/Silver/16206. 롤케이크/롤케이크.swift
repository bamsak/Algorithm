let nm = readLine()!.split(separator: " ").map { Int($0)! }
var (n, m) = (nm[0], nm[1])
var cakes = readLine()!.split(separator: " ").map { Int($0)! }

cakes.sort {
    if $0 % 10 == $1 % 10 {
        return $0 < $1
    }
    return $0 % 10 < $1 % 10
}

var result = cakes.filter { $0 == 10 }.count

for cake in cakes where cake > 10 {
    let count = cake / 10
    let temp = cake % 10 == 0 ? (count - 1) : count
    
    if m >= temp {
        result += count
        m -= temp
    } else {
        result += m
        break
    }
}

print(result)
