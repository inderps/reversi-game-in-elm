module Init exposing (init)

import Model exposing (Model)
import Models.Board exposing (Board)
import Models.OccupiedSlot exposing (OccupiedSlot, move)
import Models.Player exposing (Player(..))
import Models.Position exposing (position)


initialMoves : List OccupiedSlot
initialMoves =
    [ move Orange (position 4 4)
    , move Green (position 5 4)
    , move Orange (position 5 5)
    , move Green (position 4 5)
    ]


init : Model
init =
    { board = Models.Board.init 8 8
    , occupiedSlots = initialMoves
    , turn = Orange
    , highlightedTile = Nothing
    }
