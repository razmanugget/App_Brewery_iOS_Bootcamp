import UIKit

// Fibonacci #'s -> 0,1,1,2,3,5,8

// my work -> messy, but works.  see below for better example
let sequenceCount = 10
var first = 0, second = 1, next = 0

print("start: ", first, second)

func addFib(first: Int, second: Int) -> Int {
  return (first + second)
}

for _ in 1...sequenceCount {
  next = addFib(first: first, second: second)
  print(next)
  first = second
  second = next
}


// exercise solved by Angela
// all tied into a function and made to look clean
func fibonacci (until n : Int) {
  print(0)
  print(1)
  
  var num1 = 0
  var num2 = 1
  
  for _ in 0...n {
    let num = num1 + num2
    print(num)
    
    num1 = num2
    num2 = num
    
  }
}

fibonacci(until: 20)
