module Init exposing (init)

import Model exposing (Model)
import Models.Board exposing (Board)
import Models.OccupiedSlot exposing (OccupiedSlot, move)
import Models.Player exposing (Player(..))


initialMoves : List OccupiedSlot
initialMoves =
    [ move Tom 3 3
    , move Jerry 4 3
    , move Tom 4 4
    , move Jerry 3 4
    ]


init : Model
init =
    { board = Models.Board.init 8 8
    , occupiedSlots = initialMoves
    , turn = Tom
    }
