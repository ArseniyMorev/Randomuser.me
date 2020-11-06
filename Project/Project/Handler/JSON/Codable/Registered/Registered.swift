import Foundation

public struct Registered: Codable, Equatable, Identifiable {
    public let id: UUID
    public let date: String
    public let age: Int

    private enum CodingKeys: String, CodingKey {
        case date = "date"
        case age = "age"
    }

    init(date: String?, age: Int?) {
        self.date = date ?? ""
        self.age = age ?? 0
        self.id = UUID()
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        date = try values.decode(String.self, forKey: .date)
        age = try values.decode(Int.self, forKey: .age)
        id = UUID()
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(date, forKey: .date)
        try container.encode(age, forKey: .age)
    }
}
