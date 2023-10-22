func solution(_ a:Int, _ b:Int) -> Int64 {
    let someA = Int64(a)
    let someB = Int64(b)
    
    return a > b ? (someB...someA).reduce(0, +) : (someA...someB).reduce(0, +)
}