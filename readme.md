# GuessTheNumber Smart Contract

## Introduction

The `GuessTheNumber` smart contract is a fun game where players try to guess a secret number between 1 and 100. If a player guesses the correct number, they win all the money in the prize pool. The game is managed by the contract owner, who sets the secret number and adds money to the prize pool.

## How It Works

### Key Parts of the Contract

- **Owner**: The person who creates the contract. They control the secret number and the prize pool.
- **Winning Number**: The secret number that players try to guess. It’s hidden from everyone except the contract.
- **Prize Pool**: The total amount of money that players can win.

### Events

- **Hint**: A message that tells players whether they need to guess higher or lower.
- **CongratulatoryMessage**: A message that announces the winner and the prize they’ve won.

### How to Play

1. **Set Up the Game**: The owner picks a secret number between 1 and 100 when they create the contract.
2. **Add Prize Money**: The owner adds money to the prize pool using the `depositPrize` function.
3. **Make a Guess**: Players guess the secret number by calling the `guess` function.
   - If the guess is correct, the player wins all the money in the prize pool.
   - If the guess is wrong, the contract gives a hint to help the player guess better next time.
4. **Start a New Game**: The owner can reset the game with a new secret number using the `resetGame` function.

### Special Rules

- **OnlyOwner**: Some actions, like setting the secret number and adding prize money, can only be done by the owner.

## How to Use

1. **Deploy the Contract**: The owner creates the contract and sets the secret number.
2. **Add Prize Money**: The owner sends ETH to the contract to build the prize pool.
3. **Guess the Number**: Players try to guess the secret number. The first person to guess correctly wins the prize pool.
4. **Reset the Game**: The owner can start a new game with a new secret number at any time.

## License

This project is licensed under the MIT License.
