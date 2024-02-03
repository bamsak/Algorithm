let nums = readLine()!.split(separator:  " ")
let number = readLine()!
var count = 0

for num in nums {
    if num != number && num.hasPrefix(number) {
        count += 1
    }
}

print(count)
