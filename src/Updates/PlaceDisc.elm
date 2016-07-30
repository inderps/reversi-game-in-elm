module Updates.PlaceDisc exposing (placeDisc)

import Model exposing (Model)
import Models.Position exposing (Position)
import Models.OccupiedTile exposing (OccupiedTile, move)
import Updates.Common.Model exposing (modelAfterAddingTile)
import Computations.Disc exposing (nextDiscToBePlaced)
import Computations.DiscSwapping.Horizontal exposing (modelAfterSwappingDiscsHorizontally)
import Computations.DiscSwapping.Vertical exposing (modelAfterSwappingDiscsVertically)


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
    modelAfterSwappingDiscsVertically << modelAfterSwappingDiscsHorizontally
