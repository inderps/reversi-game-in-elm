module Models.OccupiedSlot exposing (OccupiedSlot, move)

import Models.Player exposing (Player(..))


type alias OccupiedSlot =
    { x : Int
    , y : Int
    , player : Player
    }


move : Player -> Int -> Int -> OccupiedSlot
move player x y =
    { x = x
    , y = y
    , player = player
    }
