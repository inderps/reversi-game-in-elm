module Computations.DiscSwapping.OccupiedTile
    exposing
        ( swappableTilesOnPositionWithDisc
        , swappableTilesOnPositionForNextDisc
        , tilesAfterSwapping
        )

import List exposing (map, member, length, concat)
import List.Extra exposing (find, takeWhile)
import Models.Position exposing (Position)
import Models.Disc exposing (Disc)
import Models.OccupiedTile exposing (OccupiedTile)
import Computations.Disc exposing (opponentDisc)
import Computations.Tile exposing (lastFilledTile)
import Computations.DiscSwapping.Position exposing (occupiedTilesInTheseCoordinatesList)


swappableTilesOnPositionForNextDisc : List OccupiedTile -> List (List Position) -> List OccupiedTile
swappableTilesOnPositionForNextDisc occupiedTiles positionsList =
    case lastFilledTile occupiedTiles of
        Just tile ->
            swappableTilesOnPositionWithDisc occupiedTiles (opponentDisc tile.disc) positionsList

        Nothing ->
            []


swappableTilesOnPositionWithDisc : List OccupiedTile -> Disc -> List (List Position) -> List OccupiedTile
swappableTilesOnPositionWithDisc occupiedTiles disc positionsList =
    occupiedTilesInTheseCoordinatesList occupiedTiles positionsList
        |> tilesWithDiscsToSwap disc


tilesAfterSwapping : List OccupiedTile -> List OccupiedTile -> List OccupiedTile
tilesAfterSwapping tiles swapableTiles =
    map (discAfterSwapping swapableTiles) tiles


discAfterSwapping : List OccupiedTile -> OccupiedTile -> OccupiedTile
discAfterSwapping tiles tile =
    if member tile tiles then
        { tile | disc = opponentDisc tile.disc }
    else
        tile


tilesWithDiscsToSwap : Disc -> List (List OccupiedTile) -> List OccupiedTile
tilesWithDiscsToSwap disc tilesList =
    concat (map (tilesWithDiscsToSwapForList disc) tilesList)


tilesWithDiscsToSwapForList : Disc -> List OccupiedTile -> List OccupiedTile
tilesWithDiscsToSwapForList disc tiles =
    takeWhile (hasDifferentDiscs disc) tiles
        |> emptyListIfAllTilesAreSwappable tiles


emptyListIfAllTilesAreSwappable : List OccupiedTile -> List OccupiedTile -> List OccupiedTile
emptyListIfAllTilesAreSwappable tiles1 tiles2 =
    if (length tiles1 == length tiles2) then
        []
    else
        tiles2


hasDifferentDiscs : Disc -> OccupiedTile -> Bool
hasDifferentDiscs disc tile =
    disc /= tile.disc
