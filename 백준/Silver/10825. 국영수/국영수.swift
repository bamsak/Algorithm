var reports = [(name: String, k: Int, e: Int, m: Int)]()

for _ in 0..<Int(readLine()!)! {
    let nkem = readLine()!.split(separator: " ")
    reports.append((String(nkem[0]), Int(nkem[1])!, Int(nkem[2])!, Int(nkem[3])!))
}

reports.sort {
    if $0.k != $1.k {
        return $0.k > $1.k
    }
    
    if $0.e != $1.e {
        return $0.e < $1.e
    }
    
    if $0.m != $1.m {
        return $0.m > $1.m
    }
    
    return $0.name < $1.name
}

reports.forEach { print($0.name) }