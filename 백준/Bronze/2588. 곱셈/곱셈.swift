let num1 = Int(readLine()!)!
let num2 = Int(readLine()!)!

let result1 = num1 * (num2 % 10)
let result2 = num1 * ((num2 / 10) % 10)
let result3 = num1 * (num2 / 100)
let finalResult = num1 * num2

print(result1)
print(result2)
print(result3)
print(finalResult)