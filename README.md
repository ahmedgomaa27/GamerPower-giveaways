# Giveaways App

iOS application that integrates with the GamerPower giveaways API to display a list of game giveaways.
This iOS project consists of two main screens: a listing screen and a details screen for giveaways.

<img src="https://github.com/ahmedgomaa27/GamerPower-giveaways/assets/24413703/9a7ddb1c-4c2d-43f2-abcf-1bf34623da55" alt="Listing" width="300"/>
<img src="https://github.com/ahmedgomaa27/GamerPower-giveaways/assets/24413703/d707f4f6-9527-4f4c-b388-2b6b0b04ff0a" alt="Details" width="300"/>

## Project Structure

### Models
- **GiveawayModel.swift**: Defines the data model for giveaways.
- **GiveawayVM.swift**: ViewModel for managing the giveaway data.

### Remote
- **HttpClient.swift**: Handles HTTP network requests.
- **AppTarget.swift**: Configuration for API targets.
- **GiveawayService.swift**: Service for fetching giveaway data from the API.

### Screens

#### Giveaway Listing
- **GiveawayLisitngScreen.swift**: Main screen for listing all giveaways.
- **GiveawayViewModel.swift**: ViewModel for the listing screen.
- **UIComponents**
  - **GiveawayListingView.swift**: View for displaying a list of giveaways.
  - **ChoosePlatformView.swift**: View for selecting a platform.
  - **EpicGamesView.swift**: View for displaying Epic Games giveaways.
  - **GiveawayCard.swift**: Custom view for individual giveaway cards.

#### Giveaway Details
- **GiveawayDetailsScreen.swift**: Screen for displaying the details of a selected giveaway.

### Utils
- **Constants.swift**: Contains constant values used throughout the app.
- **Modifiers**
  - **OnFirstAppearModifier.swift**: Custom view modifier.
- **SharedViews**
  - **ErrorTextView.swift**: View for displaying error messages.
  - **TextWithIcon.swift**: Custom text view with an icon.
  - **TextWithTitle.swift**: Custom text view with a title.
  - **LoaderView.swift**: View for displaying a loading indicator.
- **Extensions**
  - **String+Extensions.swift**: Extensions for String.
  - **UIApplication+Extensions.swift**: Extensions for UIApplication.
  - **UINavigation+Extensions.swift**: Extensions for UINavigation.
- **Errors**
  - **AppErrors.swift**: Custom error definitions.

## Setup

1. Clone the repository.
2. Open the project in Xcode.
3. Run the project on a simulator or a physical device.

## Features

- **Giveaway Listing**: Browse through a list of current giveaways.
- **Giveaway Details**: View detailed information about each giveaway.

## Requirements

- iOS 17.0+
- Xcode 15.0+
- Swift 5.0+

