module Updates.DiscSwapping.Right exposing (modelAfterSwappingDiscsOnRight)

import List exposing (reverse, map)
import Model exposing (Model)
import Models.OccupiedTile exposing (OccupiedTile)
import Helpers.Tile exposing (lastFilledTile)
import Helpers.Model exposing (modelAfterReplacingTiles)
import Models.Position exposing (Position, tiltedPosition)
import Models.Disc exposing (Disc)
import Updates.DiscSwapping.Helpers
    exposing
        ( occupiedTilesInTheseCoordinates
        , tilesWithDiscsToSwap
        , tilesAfterSwapping
        )


modelAfterSwappingDiscsOnRight : Model -> Model
modelAfterSwappingDiscsOnRight model =
    case lastFilledTile model.occupiedTiles of
        Just tile ->
            swappableRightTiles model.occupiedTiles tile.disc tile.position model.boardSpecs.columns
                |> tilesAfterSwapping model.occupiedTiles
                |> modelAfterReplacingTiles model

        Nothing ->
            model


swappableRightTiles : List OccupiedTile -> Disc -> Position -> Int -> List OccupiedTile
swappableRightTiles occupiedTiles disc position upto =
    rightTiles occupiedTiles position upto
        |> tilesWithDiscsToSwap disc


rightTiles : List OccupiedTile -> Position -> Int -> List OccupiedTile
rightTiles occupiedTiles position upto =
    positionsInbetween position upto
        |> occupiedTilesInTheseCoordinates occupiedTiles


positionsInbetween : Position -> Int -> List Position
positionsInbetween position upto =
    map (tiltedPosition position.y) [position.x + 1..upto]
