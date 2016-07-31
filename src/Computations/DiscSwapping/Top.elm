module Computations.DiscSwapping.Top exposing (modelAfterSwappingDiscsOnTop, topSwappableDiscs)

import List exposing (reverse, map)
import Model exposing (Model)
import Models.Position exposing (Position, setXY)
import Models.OccupiedTile exposing (OccupiedTile)
import Computations.Tile exposing (lastFilledTile)
import Computations.DiscSwapping.OccupiedTile
    exposing
        ( swappableTilesOnPositionForNextDisc
        , swappableTilesOnPositionWithDisc
        , tilesAfterSwapping
        )
import Updates.Common.Model exposing (modelAfterReplacingTiles)


modelAfterSwappingDiscsOnTop : Model -> Model
modelAfterSwappingDiscsOnTop model =
    case lastFilledTile model.occupiedTiles of
        Just tile ->
            topCoordinates tile.position
                |> swappableTilesOnPositionWithDisc model.occupiedTiles tile.disc
                |> tilesAfterSwapping model.occupiedTiles
                |> modelAfterReplacingTiles model

        Nothing ->
            model


topSwappableDiscs : List OccupiedTile -> Position -> List OccupiedTile
topSwappableDiscs occupiedTiles position =
    topCoordinates position
        |> swappableTilesOnPositionForNextDisc occupiedTiles


topCoordinates : Position -> List Position
topCoordinates position =
    reverse (map (setXY position.x) [1..position.y - 1])
