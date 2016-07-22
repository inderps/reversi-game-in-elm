module Model exposing (Model)

import Models.Board exposing (Board)
import Models.OccupiedSlot exposing (OccupiedSlot)
import Models.Turn exposing (Turn)


type alias Model =
    { board : Board
    , occupiedSlots : List OccupiedSlot
    , turn : Turn
    }
