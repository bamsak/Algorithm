var books = [String: Int]()

for _ in 0..<Int(readLine()!)! {
    let title = readLine()!
    if let book = books[title] {
        books[title] = book + 1
    } else {
        books[title] = 1
    }
}

let max = books.values.max()!
let result = books.filter { $0.value == max }.sorted { $0.key > $1.key }

print(result.last!.key)