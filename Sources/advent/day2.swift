/// Load the whole file, split into lines, convert to Int
func loadTokensFromFile() -> [[Substring]]? {
    return try! String(contentsOfFile: "./inputs/day2/input.txt", encoding: String.Encoding.ascii)
                        .split{$0 == "\n"}
                        .map {$0.split(separator: " ")}
}

private func part1() {
    let toks = loadTokensFromFile()!
    var pos = 0, depth = 0

    for x in toks {
        switch x[0] {
            case "forward":
                pos += Int(x[1])!
            case "down":
                depth += Int(x[1])!
            case "up":
                depth -= Int(x[1])!
            default:
                assert(false, String(x[0]))
        }
    }
    print("Part 1 answer: \(pos*depth)")
}

private func part2() {
    let toks = loadTokensFromFile()!
    var pos = 0, depth = 0, aim = 0

    for x in toks {
        switch x[0] {
            case "forward":
                pos += Int(x[1])!
                depth += (Int(x[1])! * aim)
            case "down":
                aim += Int(x[1])!
            case "up":
                aim -= Int(x[1])!
            default:
                assert(false, String(x[0]))
        }
    }
    print("Part 2 answer: \(pos*depth)")
}


func day2() {
    part1()
    part2()
}
