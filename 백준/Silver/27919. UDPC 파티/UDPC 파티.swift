let V = readLine()!.map { String($0) }

var uc = 0
var dp = 0
var result = ""

for v in V {
    if v == "D" || v == "P" {
        dp += 1
    } else {
        uc += 1
    }
}

var compareCount = 0

if dp % 2 == 0 {
    compareCount = dp / 2
} else { 
    compareCount = dp / 2 + 1
}

if uc > compareCount {
    result += "U"
}

if dp > 0 {
    result += "DP"
}

print(result.isEmpty ? "C" : result)
