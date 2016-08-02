module Updates.Reset exposing (reset)

import Model exposing (Model)
import Models.OccupiedTile exposing (OccupiedTile, move)
import Init exposing (initialMoves)


reset : Model -> Model
reset model =
    { model | occupiedTiles = initialMoves }
