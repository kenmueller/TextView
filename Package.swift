// swift-tools-version:5.1

import PackageDescription

let package = Package(
	name: "TextView",
	products: [
		.library(
			name: "TextView",
			targets: ["TextView"]
		)
	],
	targets: [
		.target(name: "TextView"),
		.testTarget(
			name: "TextViewTests",
			dependencies: ["TextView"]
		)
	]
)
