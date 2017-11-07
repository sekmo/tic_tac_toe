# Tic Tac Toe

An implementation of "Tic Tac Toe" in Ruby, to experiment with TDD and OO design. Tests are written with RSpec.

## Rules
- 2 players in game
- A player is assigned a marker ("X" or "O")
- Players take turns until the game status is "not finished"
- A player can mark a cell a on the board if it's empty
- Turn ends when a player marks a cell on the board
- Game gets the "victory" status when the board has three equal markers in a row, column, or diagonal
- Game gets the "draw" status if the board is full and the status is not "victory"
- A game is over when the status is "draw" or "victory"


## Getting started

1. Clone this repo: `git clone https://github.com/sekmo/tic_tac_toe`

2. Run `rspec` from the cloned directory to run the tests

3. Run `ruby tic_tac_toe.rb` to run the game


## Domain model

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

When running `tic_tac_toe.rb` we initialize a new Game instance, setting its status to "not finished", then we create a new board. Finally we ask for the player names and we assign a random player.
We run turns calling the `#do_turn` on the game instance, until the game gets the status "victory" or "draw".

On every turn we ask the current player for a position to mark, then we switch the player at the end of the turn.
Before switching the player for the next turn we check for any victories to congratulate to the current user.


## Considerations

Currently the board has 9 empty cells when it's initialized, and when we send `drop_marker_at(1, "X")` to the board, it calls in turn `put_marker("X")` on its first cell.

At the moment some classes are not very cohesive. For instance the `Game` class stores data and deal with IO. Maybe it would be nice to experiment with the "Entity- Boundary-Interactor" pattern.


## Todo

- Change `cells` for `positions` in Board, remove the `Cell` class
- Get the first player to always have the "X" symbol
