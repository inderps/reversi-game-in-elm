module Models.OccupiedTile exposing (OccupiedTile, move)

import Models.Position exposing (Position, position)
import Models.Player exposing (Player(..))


type alias OccupiedTile =
    { position : Position
    , player : Player
    }


move : Player -> Position -> OccupiedTile
move player position =
    { position = position
    , player = player
    }
