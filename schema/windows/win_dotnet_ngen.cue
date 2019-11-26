package ansible

module: win_dotnet_ngen: {
	module:            "win_dotnet_ngen"
	version_added:     "2.0"
	short_description: "Runs ngen to recompile DLLs after .NET  updates"
	description: [
		"After .NET framework is installed/updated, Windows will probably want to recompile things to optimise for the host.",
		"This happens via scheduled task, usually at some inopportune time.",
		"This module allows you to run this task on your own schedule, so you incur the CPU hit at some more convenient and controlled time.",
		"U(https://docs.microsoft.com/en-us/dotnet/framework/tools/ngen-exe-native-image-generator#native-image-service)",
		"U(http://blogs.msdn.com/b/dotnet/archive/2013/08/06/wondering-why-mscorsvw-exe-has-high-cpu-usage-you-can-speed-it-up.aspx)",
	]
	options: {}
	notes: [
		"There are in fact two scheduled tasks for ngen but they have no triggers so aren't a problem.",
		"There's no way to test if they've been completed.",
		"The stdout is quite likely to be several megabytes.",
	]
	author: ["Peter Mounce (@petemounce)"]
}
