module Computations.DiscSwapping.Position exposing (occupiedTilesInTheseCoordinates, isSameCoordinates)

import List exposing (map, member)
import List.Extra exposing (find, takeWhile)
import Models.OccupiedTile exposing (OccupiedTile)
import Models.Position exposing (Position)
import Extensions.List exposing (maybeListToListUntil)


occupiedTilesInTheseCoordinates : List OccupiedTile -> List Position -> List OccupiedTile
occupiedTilesInTheseCoordinates occupiedTiles coordinates =
    map (ifOccupied occupiedTiles) coordinates
        |> maybeListToListUntil


ifOccupied : List OccupiedTile -> Position -> Maybe OccupiedTile
ifOccupied occupiedTiles position =
    find (isSameCoordinates position) occupiedTiles


isSameCoordinates : Position -> OccupiedTile -> Bool
isSameCoordinates position tile =
    position.x == tile.position.x && position.y == tile.position.y
