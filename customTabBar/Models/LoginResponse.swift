
import Foundation

struct LoginResponse : Codable {
	let data : Data?
	let success : Int?

	enum CodingKeys: String, CodingKey {

		case data = "data"
		case success = "success"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		data = try values.decodeIfPresent(Data.self, forKey: .data)
		success = try values.decodeIfPresent(Int.self, forKey: .success)
	}

}
