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

let sampleServices: [EssentialService] = [
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
        phone: ["(123) 456-2222"],
        email: ["medicalcenter@university.edu"]
    ),
    EssentialService(
            name: "Sports Club",
            overview: "Manages various sports teams, recreational clubs, and fitness facilities on campus.",
            services: [
                "Organization of intramural sports leagues",
                "Access to gym and fitness classes",
                "Booking of courts/fields for practice"
            ],
            location: "Sports Complex, Building C",
            hours: "Monday–Friday, 9 AM–6 PM",
            phone: ["(123) 456-7893"],
            email: ["sportsclub@university.edu"]
        ),
        EssentialService(
            name: "Career Guidance Unit",
            overview: "Provides resources for career planning, resume reviews, job placement, and internship coordination.",
            services: [
                "Resume/CV and cover letter workshops",
                "Career counseling and aptitude testing",
                "Campus recruitment and internship placements"
            ],
            location: "Student Services Building, 1st Floor",
            hours: "Monday–Friday, 9 AM–5 PM",
            phone: ["(123) 456-7894"],
            email: ["careers@university.edu"]
        ),
        EssentialService(
            name: "School of Business Program Office",
            overview: "Manages course enrollment, academic advising, and administrative tasks for business majors.",
            services: [
                "Registration and scheduling for business courses",
                "Guidance on academic policies and graduation requirements",
                "Coordination of co-op and internship programs"
            ],
            location: "Business Building, Room 210",
            hours: "Monday–Friday, 8 AM–4 PM",
            phone: ["(123) 456-7895"],
            email: ["businessoffice@university.edu"]
        ),
        EssentialService(
            name: "School of Engineering Program Office",
            overview: "Provides academic support and manages administrative processes for engineering majors.",
            services: [
                "Course registration and lab scheduling",
                "Advising on capstone projects and research opportunities",
                "Liaison for engineering student clubs and societies"
            ],
            location: "Engineering Building, Room 105",
            hours: "Monday–Friday, 8 AM–4 PM",
            phone: ["(123) 456-7896"],
            email: ["engineeringoffice@university.edu"]
        ),
        EssentialService(
            name: "School of Computing Program Office",
            overview: "Handles course enrollment, lab assignments, and academic guidance for computing students.",
            services: [
                "Scheduling of programming labs and project demos",
                "Advising on tech-related electives and research",
                "Coordination of hackathons and tech workshops"
            ],
            location: "Computing Building, Room 302",
            hours: "Monday–Friday, 8 AM–4 PM",
            phone: ["(123) 456-7897"],
            email: ["computingoffice@university.edu"]
        ),
        EssentialService(
            name: "School of Language Program Office",
            overview: "Supports language majors by coordinating course enrollments, cultural events, and language labs.",
            services: [
                "Course and lab scheduling for language studies",
                "Assistance with study-abroad programs",
                "Organization of language-related clubs and workshops"
            ],
            location: "Language Building, Room 101",
            hours: "Monday–Friday, 8 AM–4 PM",
            phone: ["(123) 456-7898"],
            email: ["languageoffice@university.edu"]
        )
]
