let n = Int(readLine()!)!
var except = [Int]()
var rank = Array(1...n)
var result = 0

for _ in 0..<n {
    except.append(Int(readLine()!)!)
}

except.sort()

for i in 0..<n {
    result += abs(except[i] - rank[i])
}

print(result)