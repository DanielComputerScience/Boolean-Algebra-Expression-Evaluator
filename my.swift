/* func tables(First: String, Second: String) {//-> String {
    var first = " " + First + " "
    
    var second = " " + Second + " "
    // swapping the variables in alphabetical order
    let hold = second
    second = first
    first = hold
    // defining the truth table
    var fLine = [ 0, 0, 1, 1]
    var sLine = [0, 1, 0, 1]
    var result = [Int]()
    let times = fLine.count - 1
    for characters in 0 ..< times {
            if fLine[characters + 1] + sLine[characters + 1] != 2 {
                result.append(0)
            }
            else {
                result.append(1)
            }
        }
        
    
    var table =  first + "|" + second + "|" + "Res"
      
      print(table)
      print("\(fLine[1])  |  \(sLine[1])  |  \(result[1])")
    //return table
}
tables(First:"Sre", Second:"Goh")
*/    
/*typealias OperationType = (Int) -> Int
func evaluate(expression: Sring) -> Int {
    return 2 * atIndex + 1
}
func square(atIndex index: Int) -> Int {
    return index * index
}
func sumOf(from: Int, through: Int, operation: OperationType) -> Int {
    precondition(from <= through,
                 "from must be less than or equeal to through")
    var accumulator = 0
    for index in from ... through {
        accumulator += operation(index)
    }
    return accumulator
}
//print(sumOf(from: 5, through: 15, operation: { 2 * $0}))
print(sumOf(from: 5, through: 10) { 2 * $0 + 1})
*/ //My new file this one works
 
