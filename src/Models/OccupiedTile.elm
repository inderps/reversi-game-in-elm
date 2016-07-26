module Models.OccupiedTile exposing (OccupiedTile, move)

import Models.Position exposing (Position, position)
import Models.Disc exposing (Disc(..))


type alias OccupiedTile =
    { position : Position
    , disc : Disc
    }


move : Disc -> Position -> OccupiedTile
move disc position =
    { position = position
    , disc = disc
    }
