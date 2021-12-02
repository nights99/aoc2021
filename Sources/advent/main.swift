let default_day = day2
if CommandLine.argc == 1 {
    default_day()
} else {
    switch CommandLine.arguments[1] {
        case "day1":
            day1()
        case "day2":
            day2()
        default:
            default_day()
    }
}