package ansible

module: cisco_spark: {
	module:            "cisco_spark"
	short_description: "Send a message to a Cisco Spark Room or Individual."
	description: [
		"Send a message to a Cisco Spark Room or Individual with options to control the formatting.",
	]
	version_added: "2.3"
	author:        "Drew Rusell (@drew-russell)"
	notes: [
		"The C(recipient_id) type must be valid for the supplied C(recipient_id).",
		"Full API documentation can be found at U(https://developer.ciscospark.com/endpoint-messages-post.html).",
	]

	options: {

		recipient_type: {
			description: [
				"The request parameter you would like to send the message to.",
				"Messages can be sent to either a room or individual (by ID or E-Mail).",
			]
			required: true
			choices: ["roomId", "toPersonEmail", "toPersonId"]
		}

		recipient_id: {
			description: [
				"The unique identifier associated with the supplied C(recipient_type).",
			]
			required: true
		}

		message_type: {
			description: [
				"Specifies how you would like the message formatted.",
			]
			required: false
			default:  "text"
			choices: ["text", "markdown"]
		}

		personal_token: {
			description: [
				"Your personal access token required to validate the Spark API.",
			]
			required: true
			aliases: ["token"]
		}

		message: {
			description: [
				"The message you would like to send.",
			]
			required: true
		}
	}
}
