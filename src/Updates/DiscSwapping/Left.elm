module Updates.DiscSwapping.Left exposing (modelAfterSwappingDiscsOnLeft)

import List exposing (reverse, map)
import Model exposing (Model)
import Computations.Tile exposing (lastFilledTile)
import Models.Position exposing (Position, setYX)
import Updates.DiscSwapping.Helpers exposing (modelAfterSwappingDiscsOnPosition)


modelAfterSwappingDiscsOnLeft : Model -> Model
modelAfterSwappingDiscsOnLeft model =
    case lastFilledTile model.occupiedTiles of
        Just tile ->
            leftCoordinates tile.position
                |> modelAfterSwappingDiscsOnPosition model tile

        Nothing ->
            model


leftCoordinates : Position -> List Position
leftCoordinates position =
    reverse (map (setYX position.y) [1..position.x - 1])
