import Foundation

struct DonationlogItem: Identifiable, Codable, Equatable {
    var id: UUID = UUID()
    var createdAt: Date = Date()
    var charity: String
    var amount: Double
    var date: String
}
