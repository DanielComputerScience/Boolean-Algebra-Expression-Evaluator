import Foundation

enum Lexeme {
    enum LexemeError: Error {
        case failedToFindLexeme(inLine: String)
        case inconsistentSpacingForOperator(operator: String, inLine: String)
        case literalIntegerTooLarge(inLine: String)
    }

    case variableDeclaration
    case operatorAssignment
    case identifier(name: String)
    case literalInteger(value: Int)
    case booleanOperatorAND
    case booleanOperatorOR
    case booleanOperatorNOT

    static func nextLexeme(from line: Substring) throws -> (lexeme: Lexeme, text: Substring, charactersConsumed: Int, opperator: Int) {
        // Existing code...
        var opperator = 0
        if let match = try /\s*var\s/.prefixMatch(in: line) {
            //            print("Found keyword var: \(match.0)")
            return (lexeme: .variableDeclaration, text: match.0, charactersConsumed: match.0.count, opperator: 0)
        } else if let match = try /(\s*)=(\s*)/.prefixMatch(in: line) {
            guard (match.1.count == 0 && match.2.count == 0)  ||
                    (match.1.count > 0 && match.2.count > 0) else {
                throw LexemeError.inconsistentSpacingForOperator(operator: "=", inLine: String(line))
                //code for = sign
            }
            let opp = opperator * 10 + 1
            return (lexeme: .operatorAssignment, text: match.0, charactersConsumed: match.0.count, opperator: opp)
            // Testing for ∧ (AND) sign
        } else if let match = try /\s*∧\s*/.prefixMatch(in: line) {
            let opp = opperator * 10 + 2
            return (lexeme: .booleanOperatorAND, text: match.0, charactersConsumed: match.0.count, opperator: opp)
            // Testing for ∨ (OR) sign
        } else if let match = try /\s*∨\s*/.prefixMatch(in: line) {
            let opp = opperator * 10 + 3
            return (lexeme: .booleanOperatorOR, text: match.0, charactersConsumed: match.0.count, opperator: opp)
            // Testing for ¬ (NOT) sign
        } else if let match = try /\s*¬\s*/.prefixMatch(in: line) {
            let opp = opperator * 10 + 4
            return (lexeme: .booleanOperatorNOT, text: match.0, charactersConsumed: match.0.count, opperator: opp)
            // Existing code...

        } else {
            throw LexemeError.failedToFindLexeme(inLine: String(line))
        }
    }
}

// Rest of the code remains unchanged...
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
        print(" \(var1)  |  \(var2)  |  \(opp1)  \n   0  0  ")
    } catch {
        print("Failed because \(error).")
        
    }
}

main()
