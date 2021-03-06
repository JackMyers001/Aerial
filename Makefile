.DEFAULT_GOAL := default

XCODEBUILD := xcodebuild
BUILD_FLAGS = -scheme $(SCHEME)

SCHEME ?= $(TARGET)
TARGET ?= AerialApp

clean:
	$(XCODEBUILD) clean $(BUILD_FLAGS)

build: clean
	$(XCODEBUILD) build $(BUILD_FLAGS)

test: clean
	$(XCODEBUILD) test $(BUILD_FLAGS) -enableCodeCoverage YES

test-travis: clean
	$(XCODEBUILD) test -workspace Aerial.xcworkspace $(BUILD_FLAGS) -enableCodeCoverage YES CODE_SIGNING_ALLOWED=NO

lint:
	@echo SwiftLint Version: $(shell swiftlint version)
	@echo PWD: $(shell pwd)
	@swiftlint lint --reporter json --strict

lint-autocorrect:
	swiftlint autocorrect

xcode-lint:
	swiftlint lint --lenient

default: bootstrap
