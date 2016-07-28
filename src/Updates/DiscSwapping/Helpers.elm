module Updates.DiscSwapping.Helpers
    exposing
        ( occupiedTilesInTheseCoordinates
        , tilesWithDiscsToSwap
        , tilesAfterSwapping
        )

import List exposing (map, member)
import List.Extra exposing (find, takeWhile)
import Helpers.List exposing (maybeListToListUntil)
import Helpers.Disc exposing (opponentDisc)
import Models.Disc exposing (Disc)
import Models.OccupiedTile exposing (OccupiedTile)
import Models.Position exposing (Position)


tilesAfterSwapping : List OccupiedTile -> List OccupiedTile -> List OccupiedTile
tilesAfterSwapping tiles swapableTiles =
    map (afterSwappingDiscs swapableTiles) tiles


afterSwappingDiscs : List OccupiedTile -> OccupiedTile -> OccupiedTile
afterSwappingDiscs tiles tile =
    if member tile tiles then
        { tile | disc = opponentDisc tile.disc }
    else
        tile


tilesWithDiscsToSwap : Disc -> List OccupiedTile -> List OccupiedTile
tilesWithDiscsToSwap disc tiles =
    takeWhile (hasDifferentDiscs disc) tiles


hasDifferentDiscs : Disc -> OccupiedTile -> Bool
hasDifferentDiscs disc tile =
    disc /= tile.disc


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
