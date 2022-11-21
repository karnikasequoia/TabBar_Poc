
import Foundation

struct Data : Codable {
	let companyDetails : CompanyDetails?
	let isActivated : Int?
	let isTerminated : Int?
	let showWelcome : Int?
	let userDetails : UserDetails?

	enum CodingKeys: String, CodingKey {

		case companyDetails = "companyDetails"
		case isActivated = "isActivated"
		case isTerminated = "isTerminated"
		case showWelcome = "showWelcome"
		case userDetails = "userDetails"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		companyDetails = try values.decodeIfPresent(CompanyDetails.self, forKey: .companyDetails)
		isActivated = try values.decodeIfPresent(Int.self, forKey: .isActivated)
		isTerminated = try values.decodeIfPresent(Int.self, forKey: .isTerminated)
		showWelcome = try values.decodeIfPresent(Int.self, forKey: .showWelcome)
		userDetails = try values.decodeIfPresent(UserDetails.self, forKey: .userDetails)
	}

}
