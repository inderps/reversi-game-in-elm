module Computations.DiscSwapping.Position exposing (occupiedTilesInTheseCoordinatesList, isSameCoordinates)

import List exposing (map, member)
import List.Extra exposing (find, takeWhile)
import Models.OccupiedTile exposing (OccupiedTile)
import Models.Position exposing (Position)
import Extensions.List exposing (maybeListToListUntil)


occupiedTilesInTheseCoordinatesList : List OccupiedTile -> List (List Position) -> List (List OccupiedTile)
occupiedTilesInTheseCoordinatesList occupiedTiles coordinatesList =
    map (occupiedTilesInTheseCoordinates occupiedTiles) coordinatesList


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
