var meetings = [(start: Int, end: Int)]()

for _ in 0..<Int(readLine()!)! {
    let time = readLine()!.split(separator: " ").map { Int($0)! }
    meetings.append((time[0], time[1]))
}

meetings.sort {
    if $0.end == $1.end {
        return $0.start < $1.start
    }
    return $0.end < $1.end
}

var temp = meetings[0]
var result = 1

for meeting in meetings[1...] {
    if temp.end <= meeting.start {
        temp = meeting
        result += 1
    }
}

print(result)