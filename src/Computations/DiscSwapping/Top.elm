module Computations.DiscSwapping.Top exposing (modelAfterSwappingDiscsOnTop)

import List exposing (reverse, map)
import Model exposing (Model)
import Models.Disc exposing (Disc)
import Models.Position exposing (Position, setXY)
import Models.OccupiedTile exposing (OccupiedTile)
import Computations.Tile exposing (lastFilledTile)
import Computations.DiscSwapping.OccupiedTile exposing (swappableTilesOnPosition, tilesAfterSwapping)
import Updates.Common.Model exposing (modelAfterReplacingTiles)


modelAfterSwappingDiscsOnTop : Model -> Model
modelAfterSwappingDiscsOnTop model =
    case lastFilledTile model.occupiedTiles of
        Just tile ->
            topCoordinates tile.position
                |> swappableTilesOnPosition model.occupiedTiles tile.disc
                |> tilesAfterSwapping model.occupiedTiles
                |> modelAfterReplacingTiles model

        Nothing ->
            model


topSwappableDiscs : List OccupiedTile -> Position -> Disc -> List OccupiedTile
topSwappableDiscs occupiedTiles position disc =
    topCoordinates position
        |> swappableTilesOnPosition occupiedTiles disc


topCoordinates : Position -> List Position
topCoordinates position =
    reverse (map (setXY position.x) [1..position.y - 1])
