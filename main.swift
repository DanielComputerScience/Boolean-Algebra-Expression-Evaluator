import Foundation

enum Lexeme {
    enum LexemeError : Error {
        case failedToFindLexeme(inLine: String) 
    }
    case variableDeclaration

    static func  nextLexeme(from line: Substring) throws {
        if let match = try /\s*var\s*/.prefixMatch(in:line) {
            print("Found keyword var: \(match.0)")
        } else if let match = try /\s*=\s*/.prefixMatch(in: line) {
            print("Found assignment operator")

        } else {
            
            throw LexemeError.failedToFindLexeme(inLine: String(line))
        }
    }
    
}
func main() {
    do {
        try Lexeme.nextLexeme(from: "  x = 123")
    } catch {
        print("Failed because \(error).")
    }
}
main()