import Foundation

struct LectureSchedule: Identifiable {
    var id = UUID()
    var day: String
    var time: String
    var location: String
    var title: String
    var batch: String
}
