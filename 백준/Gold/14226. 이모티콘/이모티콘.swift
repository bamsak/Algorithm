struct Queue<T> {
  private var input = [T]()
  private var output = [T]()
  
  mutating func enqueue(_ newElement: T) {
    input.append(newElement)
  }
  
  mutating func dequeue() -> T? {
    if output.isEmpty {
      output = input.reversed()
      input = []
    }
    return output.popLast()
  }
}

let s = Int(readLine()!)!

var queue = Queue<(screen: Int, clip: Int, time: Int)>()
queue.enqueue((0, 1, 0))
var visited = Array(repeating: Array(repeating: false, count: 1001), count: 1001)
visited[1][0] = true 

while let current = queue.dequeue() {
  if current.screen == s {
    print(current.time)
    break
  }
  
  let pasteScreen = current.screen + current.clip
  let removeScreen = current.screen - 1
  
  if current.screen > 0 && current.screen < 1001 {
    if !visited[current.screen][current.screen] {
      visited[current.screen][current.screen] = true
      queue.enqueue((current.screen, current.screen, current.time + 1))
    }
  }
  
  if removeScreen > 0 && removeScreen < 1001 {
    if !visited[removeScreen][current.clip] {
      visited[removeScreen][current.clip] = true
      queue.enqueue((removeScreen, current.clip, current.time + 1))
    }
  }
  
  if pasteScreen > 0 && pasteScreen < 1001 {
    if !visited[pasteScreen][current.clip] {
      visited[pasteScreen][current.clip] = true
      queue.enqueue((pasteScreen, current.clip, current.time + 1))
    }
  }
}
