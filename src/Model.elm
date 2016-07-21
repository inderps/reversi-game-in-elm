module Model exposing (Model, init)

import Models.Board exposing (Board)
import Models.OccupiedSlot exposing (OccupiedSlot)

type alias Model =
  { board : Board
  , occupiedSlots : List OccupiedSlot
  , counter: Int
  }

init : Int -> Model

init val =
  { board = Models.Board.init 8 8
  , occupiedSlots = []
  , counter = val
  }
