import Foundation

var score = [1: 0, 2: 0]
var minutes = [1: 0, 2: 0]
var previous = 0

for _ in 0..<Int(readLine()!)! {
    let input = readLine()!.split(separator: " ").map { $0 }
    let team = Int(input[0])!
    let temp = input[1].split(separator: ":").map { Int($0)! }
    let minute = (temp[0] * 60) + temp[1]
    
    if score[1]! > score[2]! {
        minutes[1]! += minute - previous
    } 
    if score[2]! > score[1]! {
        minutes[2]! += minute - previous
    }
    
    score[team]! += 1
    previous = minute
}

if score[1]! > score[2]! {
    minutes[1]! += 48 * 60 - previous
} 
if score[2]! > score[1]! {
    minutes[2]! += 48 * 60 - previous
}

print("\(String(format: "%02d", minutes[1]! / 60)):\(String(format: "%02d", minutes[1]! % 60))")
print("\(String(format: "%02d", minutes[2]! / 60)):\(String(format: "%02d", minutes[2]! % 60))")