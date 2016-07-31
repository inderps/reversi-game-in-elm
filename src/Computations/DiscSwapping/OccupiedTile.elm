module Computations.DiscSwapping.OccupiedTile
    exposing
        ( swappableTilesOnPositionWithDisc
        , swappableTilesOnPositionForNextDisc
        , tilesAfterSwapping
        )

import List exposing (map, member)
import List.Extra exposing (find, takeWhile)
import Models.Position exposing (Position)
import Models.Disc exposing (Disc)
import Models.OccupiedTile exposing (OccupiedTile)
import Computations.Disc exposing (opponentDisc)
import Computations.Tile exposing (lastFilledTile)
import Computations.DiscSwapping.Position exposing (occupiedTilesInTheseCoordinates)


swappableTilesOnPositionForNextDisc : List OccupiedTile -> List Position -> List OccupiedTile
swappableTilesOnPositionForNextDisc occupiedTiles positions =
    case lastFilledTile occupiedTiles of
        Just tile ->
            swappableTilesOnPositionWithDisc occupiedTiles (opponentDisc tile.disc) positions

        Nothing ->
            []


swappableTilesOnPositionWithDisc : List OccupiedTile -> Disc -> List Position -> List OccupiedTile
swappableTilesOnPositionWithDisc occupiedTiles disc positions =
    occupiedTilesInTheseCoordinates occupiedTiles positions
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


tilesWithDiscsToSwap : Disc -> List OccupiedTile -> List OccupiedTile
tilesWithDiscsToSwap disc tiles =
    takeWhile (hasDifferentDiscs disc) tiles


hasDifferentDiscs : Disc -> OccupiedTile -> Bool
hasDifferentDiscs disc tile =
    disc /= tile.disc
