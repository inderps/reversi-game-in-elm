module Updates.PlaceDisc exposing (placeDisc)

import Model exposing (Model)
import Models.Position exposing (Position)
import Models.OccupiedTile exposing (OccupiedTile, move)
import Helpers.Model exposing (modelAfterAddingTile)
import Helpers.Disc exposing (nextDiscToBePlaced)
import Updates.DiscSwapping.Horizontal exposing (modelAfterSwappingDiscsHorizontally)


placeDisc : Model -> Position -> Model
placeDisc model position =
    modelAfterPlacingAndSwapingDiscs model position


modelAfterPlacingAndSwapingDiscs : Model -> Position -> Model
modelAfterPlacingAndSwapingDiscs model position =
    modelAfterPlacingDisc model position
        |> modelAfterSwappingDiscs


modelAfterPlacingDisc : Model -> Position -> Model
modelAfterPlacingDisc model pos =
    move (nextDiscToBePlaced model.occupiedTiles) pos
        |> modelAfterAddingTile model


modelAfterSwappingDiscs : Model -> Model
modelAfterSwappingDiscs =
    modelAfterSwappingDiscsHorizontally
