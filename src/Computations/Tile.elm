module Computations.Tile exposing (lastFilledTile)

import Models.OccupiedTile exposing (OccupiedTile, move)
import List.Extra exposing (last)


lastFilledTile : List OccupiedTile -> Maybe OccupiedTile
lastFilledTile occupiedTiles =
    last occupiedTiles
