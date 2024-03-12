for _ in 0..<Int(readLine()!)! {
    let sounds = readLine()!.split(separator: " ").map { String($0) }
    var dict = [String: String]()
    var result = ""
    
    while true {
        let input = readLine()!
        if input == "what does the fox say?" { break }
        let s = input.split(separator: " ").map { String($0) }
        
        dict[s.last!] = s.first!
    }
    
    for sound in sounds {
        if dict[sound] == nil {
            result += "\(sound) "
        }
    }
    
    print(result)
}