# FlowerGame

FlowerGame is a Flutter application that allows users to interact with a virtual flower. The flower has 12 petals that disappear upon being tapped, and each tap reveals a message of "Love" or "Doesn't Love" below the flower. Once all petals have been tapped, the user can restart the game with a button, which will regenerate the flower with differently colored petals.

## Features

- Interactive flower with 12 petals.
- Petals disappear when tapped.
- Displays "Love" or "Doesn't Love" message upon each tap.
- Button to restart the game and regenerate petals with new colors.

## Screenshots

![FlowerGame Screenshot](screenshot.png)

## Getting Started

### Prerequisites

- Flutter SDK: [Install Flutter](https://flutter.dev/docs/get-started/install)
- An IDE with Flutter support: VS Code, Android Studio, or IntelliJ IDEA.

### Installation

1. Clone the repository:

    ```bash
    git clone https://github.com/shreedev706/FlowerGame.git
    cd FlowerGame
    ```

2. Install dependencies:

    ```bash
    flutter pub get
    ```

3. Run the app:

    ```bash
    flutter run
    ```

## Usage

- Tap on any petal to make it disappear and reveal a message.
- After all petals have disappeared, use the "Restart Game" button to play again with new petal colors.

## Code Overview

### `main.dart`

This is the main file that sets up the Flutter app and contains the `InteractiveFlower` widget, which manages the state and interaction of the petals.

### `InteractiveFlower`

A stateful widget that maintains the visibility of petals and handles user interactions. It also resets the game state when the "Restart Game" button is pressed.

### `FlowerPainter`

A custom painter that draws the flower petals and the center circle. It dynamically generates petal colors.

## Contributing

Contributions are welcome! Please follow these steps:

1. Fork the repository.
2. Create a new branch: `git checkout -b my-feature-branch`
3. Make your changes and commit them: `git commit -m 'Add some feature'`
4. Push to the branch: `git push origin my-feature-branch`
5. Submit a pull request.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## Acknowledgements

- Flutter documentation: [Flutter.dev](https://flutter.dev/docs)
- [Stack Overflow](https://stackoverflow.com/) community for code examples and solutions.

---

Happy coding!

