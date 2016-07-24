module Init exposing (init)

import Model exposing (Model)
import Models.Board exposing (Board)
import Models.OccupiedSlot exposing (OccupiedSlot, move)
import Models.Player exposing (Player(..))


initialMoves : List OccupiedSlot
initialMoves =
    [ move Tom 4 4
    , move Jerry 5 4
    , move Tom 5 5
    , move Jerry 4 5
    ]


init : Model
init =
    { board = Models.Board.init 8 8
    , occupiedSlots = initialMoves
    , turn = Tom
    }
