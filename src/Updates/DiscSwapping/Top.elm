module Updates.DiscSwapping.Top exposing (modelAfterSwappingDiscsOnTop)

import List exposing (reverse, map)
import Model exposing (Model)
import Computations.Tile exposing (lastFilledTile)
import Models.Position exposing (Position, setXY)
import Updates.DiscSwapping.Helpers exposing (modelAfterSwappingDiscsOnPosition)


modelAfterSwappingDiscsOnTop : Model -> Model
modelAfterSwappingDiscsOnTop model =
    case lastFilledTile model.occupiedTiles of
        Just tile ->
            topCoordinates tile.position
                |> modelAfterSwappingDiscsOnPosition model tile

        Nothing ->
            model


topCoordinates : Position -> List Position
topCoordinates position =
    reverse (map (setXY position.x) [1..position.y - 1])
