import Foundation

enum Lexeme {
    enum LexemeError : Error {
        case failedToFindLexeme(inLine: String)
        inconsistentSpacingForOperator(operator: String, inLine: String)
    }
    case variableDeclaration
    case operatorAssignment
    case identifier(name: String)
    case literalInteger(value: Int)

    static func  nextLexeme(from line: Substring) throws  {
        // testing for var
        if let match = try /\s*var\s*/.prefixMatch(in:line) {
            print("Found keyword var: \(match.0)")
            return .variableDeclaration
            //testing for = sign
        } else if let match = try /\s*=\s*/.prefixMatch(in: line) {
            print("Found assignment operator \(match.0)")
            return .operatorAssignment
        } else if let _ = try /(\s*)=(\s*)/.prefixMatch(in: line) {
            guard (match.1.count == 0 && mach.2.count == 0)  ||
                    (match.1.count > 0 && match.2.count > 0) else {
            throw LexemeError.inconsistentSpacingForOperator(operator: "=" inLine: String(line))
           
            // testing for and sign
        } else if let match = try /∧/.prefixMatch(in: line) {
            print("Found assignment operator \(match.0)")
            return .operatorAssignment
            // testing for or sign
        } else if let match = try /∨/.prefixMatch(in: line) {
            print("Found assignment operator \(match.0)")
            return .operatorAssignment
            // test for minus sign
        } else if let match = try /-/.prefixMatch(in: line) {
            print("Found assignment operator \(match.0)")
            return .operatorAssignment
            // 
        } else if let match = try /\s*([a-z])+\s*/.prefixMatch(in: line) {
            print("Found identifier \(match.1)")
            return .identifier

        } else {
            
            throw LexemeError.failedToFindLexeme(inLine: String(line))
        }
    }
    
}
func main() {
    do {
        let myString = "   = 123"
//        var pointer = 0
        try Lexeme.nextLexeme(from: "   = 123") 
        print(myString)
    } catch {
        print("Failed because \(error).")
    
    }
}
main()
