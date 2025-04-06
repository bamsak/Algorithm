import Foundation
var str = readLine()!
str = str.replacingOccurrences(of: "XXXX", with: "AAAA")
str = str.replacingOccurrences(of: "XX", with: "BB")
print(str.contains("X") ? "-1" : str)