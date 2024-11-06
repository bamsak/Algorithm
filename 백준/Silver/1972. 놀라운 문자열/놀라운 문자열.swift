while let input = readLine(), input != "*" {
    let array = input.map { $0 }
    var trigger = true
    
    for i in 0..<array.count - 1 where trigger {
        var temp = Set<String>()
        
        for j in 0..<array.count - 1 - i {
            if temp.contains("\(array[j])\(array[j + 1 + i])") {
                trigger = false
                break
            }
            temp.insert("\(array[j])\(array[j + 1 + i])")
        }
    }
    
    print("\(input) \(trigger ? "is surprising." : "is NOT surprising.")")
}