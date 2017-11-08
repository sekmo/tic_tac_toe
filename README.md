# Tic Tac Toe

A Ruby implementation of "Tic Tac Toe", to get better at OO design and TDD.
Tests are written with RSpec.

## Rules
- 2 players in game
- A player is assigned a marker ("X" or "O")
- Players take turns until the game status is "not finished"
- A player can mark a cell a on the board if it's empty
- Turn ends when a player marks a cell on the board
- Game gets the "victory" status when the board has three equal markers in a row, column, or diagonal
- Game gets the "draw" status if the board is full and the status is not "victory"
- A game is over when the status is "draw" or "victory"


## Getting started

1. Clone this repo: `git clone https://github.com/sekmo/tic_tac_toe`

2. `cd` to the cloned directory

3. Run `rspec` to perform the tests

4. Run `ruby tic_tac_toe.rb` to run the game


## Domain model

#### Player
- Can be initialized with a name and a marker
- Returns the name and the marker

#### Game
- keeps the rules
- updates its status ("not finished", "victory", "draw")
- it runs turns
- asks for player names
- asks for player moves

#### Board
- It has 9 emtpy cells when it's created
- Can be dropped a mark at a position
- It has combinations of cells (rows, columns and diagonals)
- Tells if it has a full combination

#### Cell
- Has a placeholder to show its position on the board
- It's empty when it's created
- Can be marked with a string
- `to_s` Returns the placeholder or the marker

## How does it work?

When running `tic_tac_toe.rb` we initialize a new Game instance, setting its status to "not finished", then we assign to the game a new board. Finally we ask for the player names and we decide randomly which player comes first.

We run turns calling `do_turn` on the game instance, until the game gets the "victory" or "draw" status.

On every turn we ask the current player for a position to mark, then we switch the player at the end of the turn.
Before switching the player for the next turn we check for any victories to congratulate to the current user, and if the board is full and the game hasn't got the "victory" status, we set the game status to "draw".


## Considerations

At the moment some classes are not very cohesive. For instance the `Game` class stores data and deals with IO. It might be interesting to experiment with the "Entity- Boundary-Interactor" pattern.


## Todo

- Rename `Cell` to `Position` (integrate position concept in Board?)
- Get the first player to always have the "X" symbol
- Extract the presentation from Board
- Decouple the state from the presentation in Game
- Write feature tests to test interaction
