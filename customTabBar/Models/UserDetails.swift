
import Foundation

struct UserDetails : Codable {
	let apiToken : String?
	let assignedCompanies : [String]?
	let contactId : String?
	let contactType : String?
	let dob : String?
	let email : String?
	let firstName : String?
	let isEmployee : Int?
	let isLimitedAccess : Int?
	let isReviewEnabled : Int?
	let lastName : String?
	let lob : String?
	let oktaId : String?
	let oktaSessionId : String?
	let oktaSessionToken : String?
	let oktaStatus : String?
	let pushNotificationStatus : Int?
	let secondaryEmail : String?
	let status : String?
	let userId : String?
	let userRole : String?
	let userType : String?

	enum CodingKeys: String, CodingKey {

		case apiToken = "apiToken"
		case assignedCompanies = "assignedCompanies"
		case contactId = "contactId"
		case contactType = "contactType"
		case dob = "dob"
		case email = "email"
		case firstName = "firstName"
		case isEmployee = "isEmployee"
		case isLimitedAccess = "isLimitedAccess"
		case isReviewEnabled = "isReviewEnabled"
		case lastName = "lastName"
		case lob = "lob"
		case oktaId = "oktaId"
		case oktaSessionId = "oktaSessionId"
		case oktaSessionToken = "oktaSessionToken"
		case oktaStatus = "oktaStatus"
		case pushNotificationStatus = "pushNotificationStatus"
		case secondaryEmail = "secondaryEmail"
		case status = "status"
		case userId = "userId"
		case userRole = "userRole"
		case userType = "userType"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		apiToken = try values.decodeIfPresent(String.self, forKey: .apiToken)
		assignedCompanies = try values.decodeIfPresent([String].self, forKey: .assignedCompanies)
		contactId = try values.decodeIfPresent(String.self, forKey: .contactId)
		contactType = try values.decodeIfPresent(String.self, forKey: .contactType)
		dob = try values.decodeIfPresent(String.self, forKey: .dob)
		email = try values.decodeIfPresent(String.self, forKey: .email)
		firstName = try values.decodeIfPresent(String.self, forKey: .firstName)
		isEmployee = try values.decodeIfPresent(Int.self, forKey: .isEmployee)
		isLimitedAccess = try values.decodeIfPresent(Int.self, forKey: .isLimitedAccess)
		isReviewEnabled = try values.decodeIfPresent(Int.self, forKey: .isReviewEnabled)
		lastName = try values.decodeIfPresent(String.self, forKey: .lastName)
		lob = try values.decodeIfPresent(String.self, forKey: .lob)
		oktaId = try values.decodeIfPresent(String.self, forKey: .oktaId)
		oktaSessionId = try values.decodeIfPresent(String.self, forKey: .oktaSessionId)
		oktaSessionToken = try values.decodeIfPresent(String.self, forKey: .oktaSessionToken)
		oktaStatus = try values.decodeIfPresent(String.self, forKey: .oktaStatus)
		pushNotificationStatus = try values.decodeIfPresent(Int.self, forKey: .pushNotificationStatus)
		secondaryEmail = try values.decodeIfPresent(String.self, forKey: .secondaryEmail)
		status = try values.decodeIfPresent(String.self, forKey: .status)
		userId = try values.decodeIfPresent(String.self, forKey: .userId)
		userRole = try values.decodeIfPresent(String.self, forKey: .userRole)
		userType = try values.decodeIfPresent(String.self, forKey: .userType)
	}

}
