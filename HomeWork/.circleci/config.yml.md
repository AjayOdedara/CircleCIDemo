jobs:
    build-and-test:
        macos:
            xcode: "10.1"
        steps:
            - run:
                name: Run tests
                command: fastlane scan
                environment:
                SCAN_DEVICE: iPhone 6
                SCAN_SCHEME: WebTests
                
workflows:
    version: 2
    test_release:
        jobs:
            - test
            - deploy:
                    requires:
                        test
                filters:
                    branches:
                        only: release
