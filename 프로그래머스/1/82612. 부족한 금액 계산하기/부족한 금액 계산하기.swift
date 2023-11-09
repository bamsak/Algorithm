import Foundation

func solution(_ price:Int, _ money:Int, _ count:Int) -> Int64 {
    let exchange = money - (1...count).map{$0 * price}.reduce(0, +)    
    return exchange > -1 ? 0 : Int64(abs(exchange))
}