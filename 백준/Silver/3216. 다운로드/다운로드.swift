let n = Int(readLine()!)!
var songs = [(d: Int, v: Int)]()

for _ in 0..<n {
  let dv = readLine()!.split(separator: " ").map { Int($0)! }
  songs.append((dv[0], dv[1]))
}

var total = 0
var result = 0

for song in songs {
  total -= song.v
  if total < 0 {
    result -= total
    total = 0
  }
  total += song.d
}

print(result)