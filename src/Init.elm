module Init exposing (init)

import Model exposing (Model)
import Models.Board exposing (Board)
import Models.OccupiedSlot exposing (OccupiedSlot, move)
import Models.Player exposing (Player(..))


initialMoves : List OccupiedSlot
initialMoves =
    [ move Orange 4 4
    , move Green 5 4
    , move Orange 5 5
    , move Green 4 5
    ]


init : Model
init =
    { board = Models.Board.init 8 8
    , occupiedSlots = initialMoves
    , turn = Orange
    }
