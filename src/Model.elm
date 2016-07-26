module Model exposing (Model)

import Models.BoardSpecs exposing (BoardSpecs)
import Models.OccupiedTile exposing (OccupiedTile)
import Models.Turn exposing (Turn)
import Models.Position exposing (Position)


type alias Model =
    { boardSpecs : BoardSpecs
    , occupiedTiles : List OccupiedTile
    , turn : Turn
    , highlightedTile : Maybe Position
    }
