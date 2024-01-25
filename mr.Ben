import Foundation

enum Lexeme {
    enum LexemeError : Error {
        case failedToFindLexeme(inLine: String)
        case inconsistentSpacingForOperator(operator: String, inLine: String)
        case literalIntegerTooLarge(inLine: String)
    }
    case variableDeclaration
    case operatorAssignment
    case identifier(name: String)
    case literalInteger(value: Int)

    static func  nextLexeme(from line: Substring) throws -> (lexeme: Lexeme, text: Substring, charactersConsumed: Int) {
        // testing for var
        if let match = try /\s*var\s/.prefixMatch(in: line) {
            //            print("Found keyword var: \(match.0)")
            return (lexeme: .variableDeclaration, text: match.0, charactersConsumed: match.0.count)
            //testing for = sign
        } else if let match = try /\s*=\s*/.prefixMatch(in: line) {
            //            print("Found assignment operator \(match.0)")
            return (lexeme: .operatorAssignment, text: match.0, charactersConsumed: match.0.count)
        } else if let match = try /(\s*)=(\s*)/.prefixMatch(in: line) {
            guard (match.1.count == 0 && match.2.count == 0)  ||
                    (match.1.count > 0 && match.2.count > 0) else {
                throw LexemeError.inconsistentSpacingForOperator(operator: "=", inLine: String(line))
            }
            return (lexeme: .operatorAssignment, text: match.0, charactersConsumed: match.0.count)
            
            // testing for and sign
            //        } else if let match = try /∧/.prefixMatch(in: line) {
            //          print("Found assignment operator \(match.0)")
            //        return .operatorAssignment
            // testing for or sign
            //       } else if let match = try /∨/.prefixMatch(in: line) {
            //         print("Found assignment operator \(match.0)")
            //       return .operatorAssignment
            // test for minus sign
            //     } else if let match = try /-/.prefixMatch(in: line) {
            //       print("Found assignment operator \(match.0)")
            //     return .operatorAssignment
            // 
        } else if let match = try /\s*([a-z])+\s*/.prefixMatch(in: line) {
        //    print("Found identifier \(match.1)")
            return (lexeme: .identifier(name: String(match.1)), text: match.0, charactersConsumed: match.0.count)
            //could write /d to represent digits instead of [0-9]
        }else if let match = try /\s*(\d+)\s*/.prefixMatch(in: line) {
            return (lexeme: .identifier(name: String(match.1)), text: match.0, charactersConsumed: match.0.count)
            //guard let value = Int(match.1) else {
             //   throw LexemeError .literalInteger(value: value), text: match.0, charactersConsumed: match.0.count) 
            } else {
            
            throw LexemeError.failedToFindLexeme(inLine: String(line))
        }
    }
}

struct LexemeSource {
    let lexeme: Lexeme
    let text: String
    let lineIndex: Int
    let columnIndex: Int

    static func lex(line: String) throws {
        var workingLine = Substring(line)
        while workingLine.count > 0 {
            let (lexeme, text, charactersConsumed) = try Lexeme.nextLexeme(from: workingLine)
            workingLine = workingLine.dropFirst(charactersConsumed)
            print("workingLine: '\(workingLine)'")
            print("Characters: \(charactersConsumed) text: \(text) lexeme: \(lexeme)")
        }

        
        

        
    }
}
func main() {
    do {
        let myString = "   = 123"
        //        var pointer = 0
        try LexemeSource.lex(line: myString)

    } catch {
        print("Failed because \(error).")
        
    }
}

main()
