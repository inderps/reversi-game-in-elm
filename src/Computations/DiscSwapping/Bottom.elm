module Computations.DiscSwapping.Bottom exposing (modelAfterSwappingDiscsOnBottom, bottomSwappableDiscs)

import List exposing (reverse, map)
import Model exposing (Model)
import Models.Position exposing (Position, setXY)
import Models.OccupiedTile exposing (OccupiedTile)
import Models.BoardSpecs exposing (BoardSpecs)
import Computations.Tile exposing (lastFilledTile)
import Computations.DiscSwapping.OccupiedTile
    exposing
        ( swappableTilesOnPositionForNextDisc
        , swappableTilesOnPositionWithDisc
        , tilesAfterSwapping
        )
import Updates.Common.Model exposing (modelAfterReplacingTiles)


modelAfterSwappingDiscsOnBottom : Model -> Model
modelAfterSwappingDiscsOnBottom model =
    case lastFilledTile model.occupiedTiles of
        Just tile ->
            bottomCoordinates tile.position model.boardSpecs.rows
                |> swappableTilesOnPositionWithDisc model.occupiedTiles tile.disc
                |> tilesAfterSwapping model.occupiedTiles
                |> modelAfterReplacingTiles model

        Nothing ->
            model


bottomSwappableDiscs : BoardSpecs -> List OccupiedTile -> Position -> List OccupiedTile
bottomSwappableDiscs boardSpecs occupiedTiles position =
    bottomCoordinates position boardSpecs.rows
        |> swappableTilesOnPositionForNextDisc occupiedTiles


bottomCoordinates : Position -> Int -> List Position
bottomCoordinates position upto =
    map (setXY position.x) [position.y + 1..upto]
