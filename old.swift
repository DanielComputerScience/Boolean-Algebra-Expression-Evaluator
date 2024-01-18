/* //typealias OperationType = (Int) -> Int
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
 
import Foundation

// Function to evaluate a binary expression
func evaluateBinaryExpression(_ expression: String) -> Double? {
    // Tokenize the expression into operands and operators
    let tokens = expression.components(separatedBy: CharacterSet.whitespacesAndNewlines)
    
    // Create a stack to hold operands
    var operandStack: [Double] = []
    
    // Create a stack to hold operators
    var operatorStack: [String] = []
    
    // Helper function to perform the operation and update the stacks
    func performOperation() {
        if let b = operandStack.popLast(), let a = operandStack.popLast(), let op = operatorStack.popLast() {
            switch op {
            case "+": operandStack.append(a + b)
            case "-": operandStack.append(a - b)
            case "*": operandStack.append(a * b)
            case "/": operandStack.append(a / b)
            default: break
            }
        }
    }
    
    // Iterate through tokens
    for token in tokens {
        if let operand = Double(token) {
            // If token is an operand, push it onto the operand stack
            operandStack.append(operand)
        } else if "+-/*".contains(token) {
            // If token is an operator, perform operations until the operator stack is empty or the top operator has lower precedence
            while let topOperator = operatorStack.last, "+-*/".contains(topOperator), token.precedence <= topOperator.precedence {
                performOperation()
            }
            // Push the current operator onto the operator stack
            operatorStack.append(token)
        }
    }
    
    // Perform any remaining operations
    while !operatorStack.isEmpty {
        performOperation()
    }
    
    // The result should be the only element in the operand stack
    return operandStack.first
}

// Extension to determine the precedence of operators
extension String {
    var precedence: Int {
        switch self {
        case "+", "-": return 1
        case "*", "/": return 2
        default: return 0
        }
    }
}
// Example usage
//if let result = 
//    print("Result: \(result)")
//} else {
//    print("Invalid expression")
//}
print(evaluateBinaryExpression("3 + 5 * 2 - 8 / 4"))
 
import Foundation

func evaluateBooleanExpression(expression: String) {
    // Parse the expression to get variables
    let variables = Set(expression.filter { $0.isLetter })

    // Generate all possible combinations for variables
    let combinations = generateCombinations(variables: Array(variables))

    // Print header for truth table
    print(variables.joined(separator: "\t"), "|\tResult")
    print(String(repeating: "-", count: (variables.count * 8) + 8))

    // Evaluate expression for each combination
    for combination in combinations {
        let result = evaluateExpressionWithValues(expression: expression, values: combination)
        print(combination.map { $0 ? "true" : "false" }.joined(separator: "\t"), "|\t\(result)")
    }
}

func generateCombinations(variables: [Character]) -> [[Bool]] {
    let count = variables.count
    let totalCombinations = Int(pow(2.0, Double(count)))

    return (0..<totalCombinations).map { index in
        return (0..<count).map { bit in
            return (index & (1 << bit)) != 0
        }
    }
}

func evaluateExpressionWithValues(expression: String, values: [Bool]) -> Bool {
    let variableValues = Dictionary(uniqueKeysWithValues: zip(expression.filter { $0.isLetter }, values))
    let substitutedExpression = expression.reduce("") { result, char in
        return result + (variableValues[char] != nil ? (variableValues[char]! ? "true" : "false") : String(char))
    }

    let expressionValue = NSExpression(format: substitutedExpression)
    return expressionValue.expressionValue(with: nil, context: nil) as! Bool
}

// Example usage:
let booleanExpression = "(A AND B) OR (NOT C)"
evaluateBooleanExpression(expression: booleanExpression)
*/


