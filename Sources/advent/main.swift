import Foundation

let lines = try? String(contentsOfFile: "./input.txt", encoding: String.Encoding.ascii)
                     .split{$0 == "\n"}
                     .map(String.init)
                     .map(Int.init)

let diffs = zip(lines!, lines!.dropFirst()).map {($0.0! < $0.1! ? 1 : 0)}
print(diffs.reduce(0,+))