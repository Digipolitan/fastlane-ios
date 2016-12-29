fastlane documentation
================
# Installation
```
sudo gem install fastlane
```
# Available Actions
### appfile_init
```
fastlane appfile_init
```
Init the Fastlane Appfile with a user interaction

#### How to install ?

This lane require actions define in [Digipolitan/fastlane-common](https://github.com/Digipolitan/fastlane-common)

```
import_from_git(
  url: 'https://github.com/Digipolitan/fastlane-common'
)
```

#### Example : Fetch only the app_identifier

```
fastlane appfile_init fetch_app_identifier:false
```

#### Options

* __**xcodeproj**__: The Xcode project path, if the project isn't in your root directory

  * **environment_variable**: XCODEPROJ

  * **type**: string

  * **optional**: true

* __**fetch_app_identifier**__: Ask the user about the app_identifier

  * **type**: boolean

  * **default_value**: true

* __**fetch_apple_id**__: Ask the user about the apple account

  * **type**: boolean

  * **default_value**: true

* __**fetch_team_name**__: Ask the user about the Dev Portal Team

  * **type**: boolean

  * **default_value**: true

* __**fetch_itc_team_name**__: Ask the user about the iTunes Connect Team

  * **type**: boolean

  * **default_value**: true


### run_tests
```
fastlane run_tests
```
Build and run all Xcode tests

#### Example:

```
fastlane tests workspace:NAME.xcworkspace
```

#### How to install ?

This lane require actions define in [Digipolitan/fastlane-common](https://github.com/Digipolitan/fastlane-common)

```
import_from_git(
  url: 'https://github.com/Digipolitan/fastlane-common'
)
```

#### Options

* __**test_scheme**__: The scheme into the Xcode project to execute, the scheme is required on the CI environement

  * **environment_variable**: TEST_SCHEME

  * **type**: string

  * **optional**: true

* __**xcworkspace**__: The workspace to use.

  * **environment_variable**: XCWORKSPACE

  * **type**: string

  * **optional**: true

* __**xcodeproj**__: The Xcode project to select

  * **environment_variable**: XCODEPROJ

  * **type**: string

  * **optional**: true

#### Environment variables

* __**SLACK_URL**__: The slack Hook URL

  * **type**: string

  * **optional**: true



----

This README.md is auto-generated and will be re-generated every time [fastlane](https://fastlane.tools) is run.
More information about fastlane can be found on [https://fastlane.tools](https://fastlane.tools).
The documentation of fastlane can be found on [GitHub](https://github.com/fastlane/fastlane/tree/master/fastlane).
