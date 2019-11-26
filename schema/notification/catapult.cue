package ansible

module: catapult: {
	module:            "catapult"
	version_added:     2.4
	short_description: "Send a sms / mms using the catapult bandwidth api"
	description: [
		"Allows notifications to be sent using sms / mms via the catapult bandwidth api.",
	]
	options: {
		src: {
			description: [
				"One of your catapult telephone numbers the message should come from (must be in E.164 format, like C(+19195551212)).",
			]
			required: true
		}
		dest: {
			description: [
				"The phone number or numbers the message should be sent to (must be in E.164 format, like C(+19195551212)).",
			]
			required: true
		}
		msg: {
			description: [
				"The contents of the text message (must be 2048 characters or less).",
			]
			required: true
		}
		media: description: [
			"For MMS messages, a media url to the location of the media to be sent with the message.",
		]
		user_id: {
			description: [
				"User Id from Api account page.",
			]
			required: true
		}
		api_token: {
			description: [
				"Api Token from Api account page.",
			]
			required: true
		}
		api_secret: {
			description: [
				"Api Secret from Api account page.",
			]
			required: true
		}
	}

	author: "Jonathan Mainguy (@Jmainguy)"
	notes: [
		"Will return changed even if the media url is wrong.",
		"Will return changed if the destination number is invalid.",
	]
}
