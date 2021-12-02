import Foundation

/// Load the whole file, split into lines, convert to Int
func loadIntsFromFile() -> [Int?]? {
    return try? String(contentsOfFile: "./inputs/day1/input.txt", encoding: String.Encoding.ascii)
                        .split{$0 == "\n"}
                        .map(String.init)
                        .map(Int.init)
}

private func part1() {
    let lines = loadIntsFromFile()

    // Use zip to create a list of tuples of consecutive numbers, compare them, 
    // and set 1 for the case we care about.
    let diffs = zip(lines!, lines!.dropFirst()).map {($0.0! < $0.1! ? 1 : 0)}

    // Print the total number of cases found.
    print(diffs.reduce(0,+))
}

private func part2() {
    let lines = loadIntsFromFile()

    // Use zip to create a list of tuples of consecutive numbers, compare them, 
    // and set 1 for the case we care about.
    let diffs2 = zip(lines!, zip(lines!.dropFirst(), lines!.dropFirst(2))).map {$0.0! + $0.1.0! + $0.1.1!}
    let diffs = zip(diffs2, diffs2.dropFirst()).map {($0.0 < $0.1 ? 1 : 0)}

    // Print the total number of cases found.
    print(diffs.reduce(0,+))
}

func day1() {
    part1()
    part2()
}