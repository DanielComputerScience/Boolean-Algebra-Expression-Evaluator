/*import Foundation

enum Lexeme {
    enum LexemeError : Error {
        case failedToFindLexeme(inLine: String) 
    }
    case variableDeclaration
    case operatorAssignment
    case identifier(name: String)
    case literalInteger(value: Int)

    static func  nextLexeme(from line: Substring) throws  -> Lexeme{
        if let match = try /\s*var\s*/.prefixMatch(in:line) {
  /*          print("Found keyword var: \(match.0)")
            return .variableDeclaration
        } else if let match = try /\s*=\s*/.prefixMatch(in: line) {
    /*        print("Found assignment operator \(match.0)")
            return .operatorAssignment
        } else if let match = try /∧/.prefixMatch(in: line) {
            print("Found assignment operator \(match.0)")
            return .operatorAssignment
        } else if let match = try /∨/.prefixMatch(in: line) {
            print("Found assignment operator \(match.0)")
            return .operatorAssignment
        } else if let match = try /-/.prefixMatch(in: line) {
            print("Found assignment operator \(match.0)")
            return .operatorAssignment
        } else if let match = try /\s*([a-z])+\s*/.prefixMatch(in: line) {
     /*       print("Found identifier \(match.1)")
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
*/