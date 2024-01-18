/* enum TokenError : Error {
    case unableToFindToken
    case dividingByZeroIsForbidden
}
func divide(dividend: Int, divisor:Int) throws -> Int {
    throw TokenError.dividingByZeroIsForbidden
    return dividend / divisor}

func main() {


    do {
        print(try divide(dividend: 5, divisor: 0))
    } catch {
        print("Failed because \(error)")
    }
}
main()
*/
