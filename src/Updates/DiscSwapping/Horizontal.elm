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
    swappableLeftTiles model.occupiedTiles
        |> tilesAfterSwapping model.occupiedTiles
        |> modelAfterReplacingTiles model


swappableLeftTiles : List OccupiedTile -> List OccupiedTile
swappableLeftTiles occupiedTiles =
    lastFilledTile occupiedTiles
        |> tilesWithDiscsToSwap (leftTiles occupiedTiles)


leftTiles : List OccupiedTile -> List OccupiedTile
leftTiles occupiedTiles =
    leftCoordinates occupiedTiles
        |> occupiedTilesInTheseCoordinates occupiedTiles


leftCoordinates : List OccupiedTile -> List Position
leftCoordinates occupiedTiles =
    lastFilledTile occupiedTiles
        |> listUptoDisc 1
        |> reverse


listUptoDisc : Int -> Maybe OccupiedTile -> List Position
listUptoDisc n maybeTile =
    case maybeTile of
        Just tile ->
            map (tiltedPosition tile.position.y) [n..tile.position.x - 1]

        Nothing ->
            []
