module Updates.DiscSwapping.Helpers exposing (occupiedTilesInTheseCoordinates)

import List exposing (map)
import List.Extra exposing (find)
import Helpers.List exposing (maybeListToListUntil)
import Models.OccupiedTile exposing (OccupiedTile)
import Models.Position exposing (Position)


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
