module Models.OccupiedSlot exposing (OccupiedSlot, move)

import Models.Position exposing (Position, position)
import Models.Player exposing (Player(..))


type alias OccupiedSlot =
    { position : Position
    , player : Player
    }


move : Player -> Position -> OccupiedSlot
move player position =
    { position = position
    , player = player
    }
