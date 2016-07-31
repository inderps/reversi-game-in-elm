module Computations.DiscSwapping.Right exposing (modelAfterSwappingDiscsOnRight, rightSwappableDiscs)

import List exposing (map)
import Model exposing (Model)
import Models.Position exposing (Position, setYX)
import Models.OccupiedTile exposing (OccupiedTile)
import Models.BoardSpecs exposing (BoardSpecs)
import Computations.Tile exposing (lastFilledTile)
import Computations.DiscSwapping.OccupiedTile
    exposing
        ( swappableTilesOnPositionWithDisc
        , swappableTilesOnPositionForNextDisc
        , tilesAfterSwapping
        )
import Updates.Common.Model exposing (modelAfterReplacingTiles)


modelAfterSwappingDiscsOnRight : Model -> Model
modelAfterSwappingDiscsOnRight model =
    case lastFilledTile model.occupiedTiles of
        Just tile ->
            rightCoordinates tile.position model.boardSpecs.columns
                |> swappableTilesOnPositionWithDisc model.occupiedTiles tile.disc
                |> tilesAfterSwapping model.occupiedTiles
                |> modelAfterReplacingTiles model

        Nothing ->
            model


rightSwappableDiscs : BoardSpecs -> List OccupiedTile -> Position -> List OccupiedTile
rightSwappableDiscs boardSpecs occupiedTiles position =
    rightCoordinates position boardSpecs.columns
        |> swappableTilesOnPositionForNextDisc occupiedTiles


rightCoordinates : Position -> Int -> List Position
rightCoordinates position upto =
    map (setYX position.y) [position.x + 1..upto]
