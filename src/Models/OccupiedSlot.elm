module Models.OccupiedSlot exposing (OccupiedSlot, init)
import Models.Player exposing (Player (..))

type alias OccupiedSlot =
  { x : Int
  , y: Int
  , player: Player
  }

init : Player -> Int -> Int -> OccupiedSlot

init player x y =
  { x = x
  , y = y
  , player = player
  }
