// Cheat - stolen from stackoverflow, but a nice use of an Extension.
extension Collection where Self.Iterator.Element: RandomAccessCollection {
    // PRECONDITION: `self` must be rectangular, i.e. every row has equal size.
    func transposed() -> [[Self.Iterator.Element.Iterator.Element]] {
        guard let firstRow = self.first else { return [] }
        return firstRow.indices.map { index in
            self.map{ $0[index] }
        }
    }
}

/// Load the whole file, split into lines, convert to Int
private func loadIntsFromFile() -> [[Int]] {
    return try! String(contentsOfFile: "./inputs/day3/input.txt", encoding: String.Encoding.ascii)
                        .split{$0 == "\n"}
                        .map(String.init)
                        .map {$0.compactMap{ $0.wholeNumberValue }}
                        // .map(Int.init)
}

private func part1() {
    let ints = loadIntsFromFile()
    let trans_ints = ints.transposed()

    // Sum the digits; if the total is more than half the size there were more 1's
    // Yields an array with a digit for each column of the original input.
    let gamma = trans_ints
        .map {$0.reduce(0, +)}
        .map {$0 > (trans_ints[0].count/2) ? 1 : 0}

    // Convert this array as if it were a binary number (Shouldn't use a string here!)
    let gamma2 = Int(gamma.map(String.init).joined(), radix: 2)!

    // Epsilon is just the inverse of gamma
    let epsilon = gamma.map {1-$0}
    let epsilon2 = Int(epsilon.map(String.init).joined(), radix: 2)!
    print("Part 1 answer: \(gamma2 * epsilon2)")
}

func day3() {
    part1()
    // part2()
}
