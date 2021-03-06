package ansible

module: cloudwatchevent_rule: {
	module:            "cloudwatchevent_rule"
	short_description: "Manage CloudWatch Event rules and targets"
	description: [
		"This module creates and manages CloudWatch event rules and targets.",
	]
	version_added: "2.2"
	extends_documentation_fragment: [
		"aws",
		"ec2",
	]
	author: "Jim Dalton (@jsdalton) <jim.dalton@gmail.com>"
	requirements: [
		"python >= 2.6",
		"boto3",
	]
	notes: [
		"A rule must contain at least an I(event_pattern) or I(schedule_expression). A rule can have both an I(event_pattern) and a I(schedule_expression), in which case the rule will trigger on matching events as well as on a schedule.",
		"When specifying targets, I(input) and I(input_path) are mutually-exclusive and optional parameters.",
	]

	options: {
		name: {
			description: [
				"The name of the rule you are creating, updating or deleting. No spaces or special characters allowed (i.e. must match C([\\.\\-_A-Za-z0-9]+)).",
			]

			required: true
			type:     "str"
		}
		schedule_expression: {
			description: [
				"A cron or rate expression that defines the schedule the rule will trigger on. For example, C(cron(0 20 * * ? *)), C(rate(5 minutes)).",
			]

			required: false
			type:     "str"
		}
		event_pattern: {
			description: [
				"A string pattern (in valid JSON format) that is used to match against incoming events to determine if the rule should be triggered.",
			]

			required: false
			type:     "str"
		}
		state: {
			description: [
				"Whether the rule is present (and enabled), disabled, or absent.",
			]
			choices: ["present", "disabled", "absent"]
			default:  "present"
			required: false
			type:     "str"
		}
		description: {
			description: [
				"A description of the rule.",
			]
			required: false
			type:     "str"
		}
		role_arn: {
			description: [
				"The Amazon Resource Name (ARN) of the IAM role associated with the rule.",
			]
			required: false
			type:     "str"
		}
		targets: {
			type:     "list"
			elements: "dict"
			description: [
				"A list of targets to add to or update for the rule.",
			]
			suboptions: {
				id: {
					type:        "str"
					required:    true
					description: "The unique target assignment ID."
				}
				arn: {
					type:        "str"
					required:    true
					description: "The ARN associated with the target."
				}
				role_arn: {
					type:        "str"
					description: "The ARN of the IAM role to be used for this target when the rule is triggered."
				}
				input: {
					type: "str"
					description: [
						"A JSON object that will override the event data when passed to the target.",
						"If neither I(input) nor I(input_path) is specified, then the entire event is passed to the target in JSON form.",
					]
				}

				input_path: {
					type: "str"
					description: [
						"A JSONPath string (e.g. C($.detail)) that specifies the part of the event data to be passed to the target.",
						"If neither I(input) nor I(input_path) is specified, then the entire event is passed to the target in JSON form.",
					]
				}

				ecs_parameters: {
					type: "dict"
					description: [
						"Contains the ECS task definition and task count to be used, if the event target is an ECS task.",
					]
					suboptions: {
						task_definition_arn: {
							type:        "str"
							description: "The full ARN of the task definition."
						}
						task_count: {
							type:        "int"
							description: "The number of tasks to create based on I(task_definition)."
						}
					}
				}
			}
			required: false
		}
	}
}
