module Computations.DiscSwapping.Right exposing (modelAfterSwappingDiscsOnRight)

import List exposing (map)
import Model exposing (Model)
import Models.Disc exposing (Disc)
import Models.Position exposing (Position, setYX)
import Models.OccupiedTile exposing (OccupiedTile)
import Models.BoardSpecs exposing (BoardSpecs)
import Computations.Tile exposing (lastFilledTile)
import Computations.DiscSwapping.OccupiedTile exposing (swappableTilesOnPosition, tilesAfterSwapping)
import Updates.Common.Model exposing (modelAfterReplacingTiles)


modelAfterSwappingDiscsOnRight : Model -> Model
modelAfterSwappingDiscsOnRight model =
    case lastFilledTile model.occupiedTiles of
        Just tile ->
            rightCoordinates tile.position model.boardSpecs.columns
                |> swappableTilesOnPosition model.occupiedTiles tile.disc
                |> tilesAfterSwapping model.occupiedTiles
                |> modelAfterReplacingTiles model

        Nothing ->
            model


rightSwappableDiscs : BoardSpecs -> List OccupiedTile -> Position -> Disc -> List OccupiedTile
rightSwappableDiscs boardSpecs occupiedTiles position disc =
    rightCoordinates position boardSpecs.columns
        |> swappableTilesOnPosition occupiedTiles disc


rightCoordinates : Position -> Int -> List Position
rightCoordinates position upto =
    map (setYX position.y) [position.x + 1..upto]
