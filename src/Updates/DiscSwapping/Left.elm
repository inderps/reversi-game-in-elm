module Updates.DiscSwapping.Left exposing (modelAfterSwappingDiscsOnLeft)

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


modelAfterSwappingDiscsOnLeft : Model -> Model
modelAfterSwappingDiscsOnLeft model =
    case lastFilledTile model.occupiedTiles of
        Just tile ->
            swappableLeftTiles model.occupiedTiles tile.position tile.disc
                |> tilesAfterSwapping model.occupiedTiles
                |> modelAfterReplacingTiles model

        Nothing ->
            model


swappableLeftTiles : List OccupiedTile -> Position -> Disc -> List OccupiedTile
swappableLeftTiles occupiedTiles position disc =
    leftTiles occupiedTiles position
        |> tilesWithDiscsToSwap disc


leftTiles : List OccupiedTile -> Position -> List OccupiedTile
leftTiles occupiedTiles position =
    leftCoordinates position
        |> occupiedTilesInTheseCoordinates occupiedTiles


leftCoordinates : Position -> List Position
leftCoordinates =
    reverse << leftSidePositions


leftSidePositions : Position -> List Position
leftSidePositions position =
    map (tiltedPosition position.y) [1..position.x - 1]
