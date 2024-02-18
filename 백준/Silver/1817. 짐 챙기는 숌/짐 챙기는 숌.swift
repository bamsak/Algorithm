let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (nm[0], nm[1])

var now = 0
var count = 0

if n == 0 {
    print(0)
} else {
    let books = readLine()!.split(separator: " ").map { Int($0)! }
    for book in books {
        if now + book <= m {
            now += book
        } else {
            count += 1
            now = book
        }
    }

    if now != 0 {
        count += 1
    }

    print(count)
}