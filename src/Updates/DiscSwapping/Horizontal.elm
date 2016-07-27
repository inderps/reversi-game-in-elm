module Updates.DiscSwapping.Horizontal exposing (modelAfterSwappingDiscsHorizontally)

import List exposing (reverse, map)
import Model exposing (Model)
import Models.OccupiedTile exposing (OccupiedTile)
import Helpers.Tile exposing (lastFilledTile)
import Models.Position exposing (Position, tiltedPosition)
import Updates.DiscSwapping.Helpers exposing (occupiedTilesInTheseCoordinates)


modelAfterSwappingDiscsHorizontally : Model -> Model
modelAfterSwappingDiscsHorizontally =
    modelAfterSwappingDiscsOnLeft


modelAfterSwappingDiscsOnLeft : Model -> Model
modelAfterSwappingDiscsOnLeft model =
    { model | occupiedTiles = leftTiles model.occupiedTiles }


leftTiles : List OccupiedTile -> List OccupiedTile
leftTiles occupiedTiles =
    occupiedTilesInTheseCoordinates occupiedTiles (leftCoordinates occupiedTiles)


leftCoordinates : List OccupiedTile -> List Position
leftCoordinates occupiedTiles =
    reverse (listUptoDisc 1 (lastFilledTile occupiedTiles))


listUptoDisc : Int -> Maybe OccupiedTile -> List Position
listUptoDisc n maybeTile =
    case maybeTile of
        Just tile ->
            map (tiltedPosition tile.position.y) [n..tile.position.x - 1]

        Nothing ->
            []
