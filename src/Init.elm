module Init exposing (init)

import Model exposing (Model)
import Models.BoardSpecs exposing (BoardSpecs)
import Models.OccupiedTile exposing (OccupiedTile, move)
import Models.Disc exposing (Disc(..))
import Models.Position exposing (setXY)


initialMoves : List OccupiedTile
initialMoves =
    [ move Orange (setXY 4 4)
    , move Green (setXY 5 4)
    , move Orange (setXY 5 5)
    , move Green (setXY 4 5)
    ]


init : Model
init =
    { boardSpecs = Models.BoardSpecs.init 8 8
    , occupiedTiles = initialMoves
    }
