# .circleci/config.yml
version: 2
jobs:
build-and-test:
macos:
xcode: "10.1.0"
environment:
FL_OUTPUT_DIR: output
steps:
- checkout
- run:
name: Fetch CocoaPods Specs
command: |
curl https://cocoapods-specs.circleci.com/fetch-cocoapods-repo-from-s3.sh | bash -s cf
- run:
name: Install CocoaPods
command: pod install --verbose

- run:
name: Build and run tests
command: fastlane scan
environment:
SCAN_DEVICE: iPhone 8
SCAN_SCHEME: WebTests

- store_test_results:
path: output/scan
- store_artifacts:
path: output

workflows:
version: 2
build-and-test:
jobs:
- build-and-test
