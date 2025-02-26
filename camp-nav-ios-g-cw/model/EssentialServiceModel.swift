import Foundation

struct EssentialService: Identifiable {
    let id = UUID()
    let name: String
    let overview: String
    let services: [String]
    let location: String
    let hours: String
    let phone: [String]
    let email: [String]
}

let essentialServiceData: [EssentialService] = [
    EssentialService(
        name: "Exam Unit",
        overview: "Responsible for creating and managing exam timetables, publishing results, and enforcing exam regulations.",
        services: ["Exam scheduling and room allocation.", "Handling exam-related special accommodations.", "Result Publication", "Exam Regulations", "Issuing exam permits and seating arrangements"],
        location: "Administration Building, 2nd Floor",
        hours: "Monday–Friday, 9 AM–4 PM",
        phone: ["(123) 456-7890"],
        email: ["examunit@university.edu"]
    ),
    EssentialService(
        name: "IT Help Desk",
        overview: "Provides support for campus Wi-Fi, university email, software installations, and hardware troubleshooting.",
        services: ["Password resets and account management.", "Software/hardware diagnostics and repairs.", "Assistance with online learning platforms."],
        location: "IT Building, Room 101",
        hours: "Monday–Friday, 8 AM–6 PM",
        phone: ["(123) 456-7890"],
        email: ["ithelp@university.edu"]
    ),
    EssentialService(
        name: "Medical Center",
        overview: "Offers on-campus medical consultations, minor treatments, and referrals for further care.",
        services: ["General health check-ups.", "Basic first aid and immunizations.", "Mental health referrals and counseling coordination."],
        location: "Health & Wellness Center",
        hours: "Monday–Friday, 9 AM–5 PM",
        phone: "(123) 456-2222",
        email: "medicalcenter@university.edu"
    ),
]
