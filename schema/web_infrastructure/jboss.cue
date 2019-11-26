package ansible

module: jboss: {
	module:            "jboss"
	version_added:     "1.4"
	short_description: "Deploy applications to JBoss"
	description: [
		"Deploy applications to JBoss standalone using the filesystem.",
	]
	options: {
		deployment: {
			required: true
			description: [
				"The name of the deployment.",
			]
			type: "str"
		}
		src: {
			description: [
				"The remote path of the application ear or war to deploy.",
				"Required when I(state=present).",
				"Ignored when I(state=absent).",
			]
			type: "path"
		}
		deploy_path: {
			default: "/var/lib/jbossas/standalone/deployments"
			description: [
				"The location in the filesystem where the deployment scanner listens.",
			]
			type: "path"
		}
		state: {
			choices: ["present", "absent"]
			default: "present"
			description: [
				"Whether the application should be deployed or undeployed.",
			]
			type: "str"
		}
	}
	notes: [
		"The JBoss standalone deployment-scanner has to be enabled in standalone.xml",
		"The module can wait until I(deployment) file is deployed/undeployed by deployment-scanner. Duration of waiting time depends on scan-interval parameter from standalone.xml.",
		"Ensure no identically named application is deployed through the JBoss CLI",
	]
	seealso: [{
		name:        "WildFly reference"
		description: "Complete reference of the WildFly documentation."
		link:        "https://docs.wildfly.org"
	}]
	author: ["Jeroen Hoekx (@jhoekx)"]
}
