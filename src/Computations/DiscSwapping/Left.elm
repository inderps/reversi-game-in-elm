module Computations.DiscSwapping.Left exposing (modelAfterSwappingDiscsOnLeft, leftSwappableDiscs)

import List exposing (reverse, map)
import Model exposing (Model)
import Models.Position exposing (Position, setYX)
import Models.OccupiedTile exposing (OccupiedTile)
import Computations.Tile exposing (lastFilledTile)
import Computations.DiscSwapping.OccupiedTile
    exposing
        ( swappableTilesOnPositionWithDisc
        , swappableTilesOnPositionForNextDisc
        , tilesAfterSwapping
        )
import Updates.Common.Model exposing (modelAfterReplacingTiles)


modelAfterSwappingDiscsOnLeft : Model -> Model
modelAfterSwappingDiscsOnLeft model =
    case lastFilledTile model.occupiedTiles of
        Just tile ->
            leftCoordinates tile.position
                |> swappableTilesOnPositionWithDisc model.occupiedTiles tile.disc
                |> tilesAfterSwapping model.occupiedTiles
                |> modelAfterReplacingTiles model

        Nothing ->
            model


leftSwappableDiscs : List OccupiedTile -> Position -> List OccupiedTile
leftSwappableDiscs occupiedTiles position =
    leftCoordinates position
        |> swappableTilesOnPositionForNextDisc occupiedTiles


leftCoordinates : Position -> List Position
leftCoordinates position =
    reverse (map (setYX position.y) [1..position.x - 1])
