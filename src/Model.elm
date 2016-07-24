module Model exposing (Model)

import Models.Board exposing (Board)
import Models.OccupiedSlot exposing (OccupiedSlot)
import Models.Turn exposing (Turn)
import Models.Position exposing (Position)


type alias Model =
    { board : Board
    , occupiedSlots : List OccupiedSlot
    , turn : Turn
    , highlightedTile : Maybe Position
    }
