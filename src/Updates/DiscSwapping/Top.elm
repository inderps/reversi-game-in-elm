module Updates.DiscSwapping.Top exposing (modelAfterSwappingDiscsOnTop)

import List exposing (reverse, map)
import Model exposing (Model)
import Models.OccupiedTile exposing (OccupiedTile)
import Helpers.Tile exposing (lastFilledTile)
import Helpers.Model exposing (modelAfterReplacingTiles)
import Models.Position exposing (Position, setXY)
import Models.Disc exposing (Disc)
import Updates.DiscSwapping.Helpers
    exposing
        ( occupiedTilesInTheseCoordinates
        , tilesWithDiscsToSwap
        , tilesAfterSwapping
        )


modelAfterSwappingDiscsOnTop : Model -> Model
modelAfterSwappingDiscsOnTop model =
    case lastFilledTile model.occupiedTiles of
        Just tile ->
            swappableTopTiles model.occupiedTiles tile.disc tile.position
                |> tilesAfterSwapping model.occupiedTiles
                |> modelAfterReplacingTiles model

        Nothing ->
            model


swappableTopTiles : List OccupiedTile -> Disc -> Position -> List OccupiedTile
swappableTopTiles occupiedTiles disc position =
    topTiles occupiedTiles position
        |> tilesWithDiscsToSwap disc


topTiles : List OccupiedTile -> Position -> List OccupiedTile
topTiles occupiedTiles position =
    topCoordinates position
        |> occupiedTilesInTheseCoordinates occupiedTiles


topCoordinates : Position -> List Position
topCoordinates =
    reverse << positionsInbetween


positionsInbetween : Position -> List Position
positionsInbetween position =
    map (setXY position.x) [1..position.y - 1]
