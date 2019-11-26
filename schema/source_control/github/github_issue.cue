package ansible

module: github_issue: {
	module:            "github_issue"
	short_description: "View GitHub issue."
	description: [
		"View GitHub issue for a given repository and organization.",
	]
	version_added: "2.4"
	options: {
		repo: {
			description: [
				"Name of repository from which issue needs to be retrieved.",
			]
			required: true
		}
		organization: {
			description: [
				"Name of the GitHub organization in which the repository is hosted.",
			]
			required: true
		}
		issue: {
			description: [
				"Issue number for which information is required.",
			]
			required: true
		}
		action: {
			description: [
				"Get various details about issue depending upon action specified.",
			]
			default: "get_status"
			choices: [
				"get_status",
			]
		}
	}
	author: ["Abhijeet Kasurde (@Akasurde)"]
}
