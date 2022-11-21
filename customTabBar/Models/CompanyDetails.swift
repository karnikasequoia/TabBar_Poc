
import Foundation

struct CompanyDetails : Codable {
	let clientOnboardingStatus : String?
	let companyColor : String?
	let companyName : String?
	let hrxDashboardVersion : String?
	let lob : String?
	let profileScreenBackgroundColor : String?

	enum CodingKeys: String, CodingKey {

		case clientOnboardingStatus = "clientOnboardingStatus"
		case companyColor = "companyColor"
		case companyName = "companyName"
		case hrxDashboardVersion = "hrxDashboardVersion"
		case lob = "lob"
		case profileScreenBackgroundColor = "profileScreenBackgroundColor"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		clientOnboardingStatus = try values.decodeIfPresent(String.self, forKey: .clientOnboardingStatus)
		companyColor = try values.decodeIfPresent(String.self, forKey: .companyColor)
		companyName = try values.decodeIfPresent(String.self, forKey: .companyName)
		hrxDashboardVersion = try values.decodeIfPresent(String.self, forKey: .hrxDashboardVersion)
		lob = try values.decodeIfPresent(String.self, forKey: .lob)
		profileScreenBackgroundColor = try values.decodeIfPresent(String.self, forKey: .profileScreenBackgroundColor)
	}

}
