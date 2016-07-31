module Model exposing (Model)

import Models.BoardSpecs exposing (BoardSpecs)
import Models.OccupiedTile exposing (OccupiedTile)


type alias Model =
    { boardSpecs : BoardSpecs
    , occupiedTiles : List OccupiedTile
    }
