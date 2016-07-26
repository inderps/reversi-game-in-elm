module Init exposing (init)

import Model exposing (Model)
import Models.BoardSpecs exposing (BoardSpecs)
import Models.OccupiedTile exposing (OccupiedTile, move)
import Models.Player exposing (Player(..))
import Models.Position exposing (position)


initialMoves : List OccupiedTile
initialMoves =
    [ move Orange (position 4 4)
    , move Green (position 5 4)
    , move Orange (position 5 5)
    , move Green (position 4 5)
    ]


init : Model
init =
    { boardSpecs = Models.BoardSpecs.init 8 8
    , occupiedTiles = initialMoves
    , turn = Orange
    , highlightedTile = Nothing
    }
