module Updates.DiscSwapping.Right exposing (modelAfterSwappingDiscsOnRight)

import List exposing (reverse, map)
import Model exposing (Model)
import Computations.Tile exposing (lastFilledTile)
import Models.Position exposing (Position, setYX)
import Updates.DiscSwapping.Helpers exposing (modelAfterSwappingDiscsOnPosition)


modelAfterSwappingDiscsOnRight : Model -> Model
modelAfterSwappingDiscsOnRight model =
    case lastFilledTile model.occupiedTiles of
        Just tile ->
            rightCoordinates tile.position model.boardSpecs.columns
                |> modelAfterSwappingDiscsOnPosition model tile

        Nothing ->
            model


rightCoordinates : Position -> Int -> List Position
rightCoordinates position upto =
    map (setYX position.y) [position.x + 1..upto]
