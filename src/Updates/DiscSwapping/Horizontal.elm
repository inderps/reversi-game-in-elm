module Updates.DiscSwapping.Horizontal exposing (modelAfterSwappingDiscsHorizontally)

import List exposing (reverse, map)
import Model exposing (Model)
import Models.OccupiedTile exposing (OccupiedTile)
import Helpers.Tile exposing (lastFilledTile)
import Helpers.Model exposing (modelAfterReplacingTiles)
import Models.Position exposing (Position, tiltedPosition)
import Updates.DiscSwapping.Helpers
    exposing
        ( occupiedTilesInTheseCoordinates
        , tilesWithDiscsToSwap
        , tilesAfterSwapping
        )


modelAfterSwappingDiscsHorizontally : Model -> Model
modelAfterSwappingDiscsHorizontally =
    modelAfterSwappingDiscsOnLeft


modelAfterSwappingDiscsOnLeft : Model -> Model
modelAfterSwappingDiscsOnLeft model =
    case lastFilledTile model.occupiedTiles of
        Just tile ->
            swappableLeftTiles model.occupiedTiles tile
                |> tilesAfterSwapping model.occupiedTiles
                |> modelAfterReplacingTiles model

        Nothing ->
            model


swappableLeftTiles : List OccupiedTile -> OccupiedTile -> List OccupiedTile
swappableLeftTiles occupiedTiles tile =
    leftTiles occupiedTiles tile.position
        |> tilesWithDiscsToSwap tile.disc


leftTiles : List OccupiedTile -> Position -> List OccupiedTile
leftTiles occupiedTiles position =
    leftCoordinates position
        |> occupiedTilesInTheseCoordinates occupiedTiles


leftCoordinates : Position -> List Position
leftCoordinates position =
    listUptoDisc 1 position
        |> reverse


listUptoDisc : Int -> Position -> List Position
listUptoDisc n position =
    map (tiltedPosition position.y) [n..position.x - 1]
