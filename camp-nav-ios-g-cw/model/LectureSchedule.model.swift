import Foundation

struct LectureSchedule: Identifiable {
    var id = UUID()
    var location: String
    var batch: String
    var module: String
    var startTime: Date
    var endTime: Date
}
