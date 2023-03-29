# Pollfish iOS SDK #

<br/>

Detailed specifications can be found [here](https://pollfish.atlassian.net/wiki/spaces/PSD/pages/1570865153/Mobile+SDKs+New+Kotlin+Swift)

<br/>

# Usage #

## Initialization ##

Import ``Pollfish`` based on the selected configuration

**Mock**

```swift
import PollfishMock
````

**Dev**

```swift
import PollfishDev
````

**Prod**

```swift
import Pollfish
````

Build **``PollfishParams``** object (Builder Pattern)

```swift
let params = PollfishParams("API_KEY")
    .indicatorPadding(Int)
    .rewardMode(Boolean)
    .releaseMode(Boolean)
    .offerwallMode(Boolean)
    .indicatorPosition(IndicatorPosition)
    .surveyFormat(SurveyFormat)
    .viewContainer(UIView)
    .requestUUID(String)
    .clickId(String)
    .signature(String)
    .requestUUID(String)
    .rewardInfo(RewardInfo)
    .userProperties(UserProperties)
```

**Dev and Mock** only options

```swift
    .serverToConnect(String)
    .surveyId(Int)
```

**`RewardInfo`**
```swift
RewardInfo(rewardName: String, rewardConversion: Float)
```

**`UserProperties`** | [more here]()
```swift
UserProperties([UserProperty])

UserProperties([
    .gender(.male),
    .spokenLanguages([
        .english,
        .greek
    ]),
    .income(.highI)
])

```

**`IndicatorPosition`** options
```swift
.topLeft, .middleLeft, .bottomLeft, .topRight, .middleRight, .bottomRight 
```

**`SurveyFormat`** options
```swift
.none, .basic, .random, .playful, .thirdParty
```

**Initialize Pollfish SDK**

```swift
Pollfish.initWith(params: PollfishParams, delegate: PollfishDelegate)
```

## Callbacks ##

If you want to receive **Pollfish** lifecycle events just comform to `PollfishDelegate`, override the methods of your choice and set the `delegate` field during initialisation accordingly.

```swift
Pollfish.initWith(API_KEY, params: params, delegate: self)

extension ViewController: PollfisDelegate {

    func pollfishClosed() {}
    
    func pollfishOpened() {}
    
    func pollfishUserRejectedSurvey() {}
    
    func pollfishUserNotEligible() {}
    
    func pollfishSurveyNotAvailable() {}
    
    func pollfishSurveyCompleted(surveyInfo: SurveyInfo) {}
    
    func pollfishSurveyReceived(surveyInfo: SurveyInfo?) {}

}
```

# Development #

Contribution on this repository is pretty much plug & play. Just clone the repo and open the `Pollfish.xcworkspace` file on XCode. Make sure you are **NOT** writting on the `master` branch.

```sh
git clone git@bitbucket.org:pollfish-git/ios-sdk-swift5.git
```

## Contribution guidelines ###
### Configuration
Select the appropriate Target based on the current file you working on.
Some files such as ```CompositionRoot.swift``` are members of one target only.

### Dependency injection 
DI happens on ```CompositionRoot.swift```. Two Roots are in place based on the configuration.

* **MOCK:** ```Mock/CmopositionRoot.swift```
* **DEV, PROD:** ```Source/Core/CompositionRoot/CompositionRoot.swift```

### Version Control
At any case you should never write directly to the ```master``` branch
<br/>
You should create a new branch from the ```master``` with a name that is easily associated with the related JIRA issue.  <br/>

**Branch Name Format:** ```PUB-1832```

**Commit Message Format:** ```PUB-1832 | Commit Message```

Before creating a Pull Release please make sure you rebase form your branch's origin branch

### Code Review
Make sure you add all members of the team familiar with the project as PR reviewers.

See [Contact section](#contact) for a list of the available members.

### Other Guidelines
* Explore the repository and try to follow the codestyle for consistency
* Have testing in mind. Write clear classes and function following SoC principle
* Follow TDD if possible or make sure you have unit tested what you written 

## Design ##

Pollfish SDK is designed based on [ Uncle Bob's Clean Architecture ](https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html) combined with **ΜVVM** on the **Presentation** layer and **Repository** pattern on the **Domain/Data** layer.

Architecture is visualized [here](https://app.diagrams.net/#G1gEVQjFrR0iLBlcOzf_9hZDHoIHiGnN0r)

## Testing ##

The implementation aims for maximum tests coverage ~90%.

### Structure ###

Tests can be found under `/Tests` directory

* `/Shared` contains components that are shared between **Unit**, **Integration** and **UI** Tests such as **Mock** components, **Test Doubles**, **Spies**, helper functions under `/Extension` directory and the testing environment application (`TestEnvironmentApp`) on which test are run
* `/UnitTests` contains Unit Test Cases
* `/IntegrationTests` contains Integration Test Cases.
* `/UITests` contains UI Test Cases

### How to run tests ###

* Select `Pollfish-Mock` target
* Select a Simulator running evironment
* Press `⌘+U`
* Select `Report` tab on the left navigation pane to view results and coverage

# Deployment #

### Versioning

* **Version(`versionName`)** [Major].[Minor].[Patch][-beta] starting from **6.0.0**
* **Internal Version(`version`)** Int value starting from **100**

### How to build a new release version?

1. Open ```Pollfish.xcworkspace```
2. Select Pollfish project and update version information on all three targets ```Pollfish-Dev, Pollfish-Mock, Pollfish-Prod```
3. Navigate to ```Source/Supporting Files/Constans.swift``` and update the following constants with the same values of step 2. 

```swift
static let sdkVersionName = "6.0.0"
static let sdkVersion = 101
```

4. Select ```Pollfish Usiversal Framework``` target and ```Any iOS Device``` and click build or ```⌘+B```

5. The output is placed under ```Products``` directory

More info can be found [here](https://pollfish.atlassian.net/wiki/spaces/PSD/pages/1988952065/Publish)

# Contact #

* **Andreas Vourkos** | [andreas@pollfish.com](mailto:andreas.vourkos@prodege.com) | @vourkosa
* **Fotis Mitropoulos** | [fotis@pollfish.com](mailto:fotis.mitropoulos@prodege.com) | @fotis
