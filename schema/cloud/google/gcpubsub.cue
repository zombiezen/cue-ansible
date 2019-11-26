package ansible

module: gcpubsub: {
	module:            "gcpubsub"
	version_added:     "2.3"
	short_description: "Create and Delete Topics/Subscriptions, Publish and pull messages on PubSub"
	description: [
		"Create and Delete Topics/Subscriptions, Publish and pull messages on PubSub. See U(https://cloud.google.com/pubsub/docs) for an overview.",
	]

	requirements: [
		"google-auth >= 0.5.0",
		"google-cloud-pubsub >= 0.22.0",
	]
	notes: [
		"Subscription pull happens before publish.  You cannot publish and pull in the same task.",
	]
	author: [
		"Tom Melendez (@supertom) <tom@supertom.com>",
	]
	options: {
		topic: {
			description: [
				"GCP pubsub topic name.",
				"Only the name, not the full path, is required.",
			]
			required: true
		}
		subscription: description: [
			"Dictionary containing a subscription name associated with a topic (required), along with optional ack_deadline, push_endpoint and pull. For pulling from a subscription, message_ack (bool), max_messages (int) and return_immediate are available as subfields. See subfields name, push_endpoint and ack_deadline for more information.",
		]

		name: description: "Subfield of subscription. Required if subscription is specified. See examples."
		ack_deadline: description: "Subfield of subscription. Not required. Default deadline for subscriptions to ACK the message before it is resent. See examples."
		pull: description: [
			"Subfield of subscription. Not required. If specified, messages will be retrieved from topic via the provided subscription name. max_messages (int; default None; max number of messages to pull), message_ack (bool; default False; acknowledge the message) and return_immediately (bool; default True, don't wait for messages to appear). If the messages are acknowledged, changed is set to True, otherwise, changed is False.",
		]

		push_endpoint: description: [
			"Subfield of subscription.  Not required.  If specified, message will be sent to an endpoint. See U(https://cloud.google.com/pubsub/docs/advanced#push_endpoints) for more information.",
		]

		publish: description: [
			"List of dictionaries describing messages and attributes to be published.  Dictionary is in message(str):attributes(dict) format. Only message is required.",
		]

		state: {
			description: [
				"State of the topic or queue.",
				"Applies to the most granular resource.",
				"If subscription isspecified we remove it.",
				"If only topic is specified, that is what is removed.",
				"NOTE - A topic can be removed without first removing the subscription.",
			]
			choices: ["absent", "present"]
			default: "present"
		}
	}
}
