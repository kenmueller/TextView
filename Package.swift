// swift-tools-version:5.1

import PackageDescription

let package = Package(
	name: "TextView",
	platforms: [
		.iOS(.v13),
		.tvOS(.v13)
	],
	products: [
		.library(
			name: "TextView",
			targets: ["TextView"]
		)
	],
	targets: [
		.target(name: "TextView")
	]
)
