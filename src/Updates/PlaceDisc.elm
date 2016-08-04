module Updates.PlaceDisc exposing (placeDisc)

import Model exposing (Model)
import Models.Position exposing (Position)
import Models.OccupiedTile exposing (OccupiedTile, move)
import Updates.Common.Model exposing (modelAfterAddingTile, modelAfterSwappingDiscs)
import Computations.Disc exposing (nextDiscToBePlaced)
import Computations.DiscSwapping.Coordinates exposing (coordinates)


placeDisc : Model -> Position -> Model
placeDisc model position =
    modelAfterPlacingAndSwapingDiscs model position


modelAfterPlacingAndSwapingDiscs : Model -> Position -> Model
modelAfterPlacingAndSwapingDiscs model position =
    modelAfterPlacingDisc model position
        |> modelAfterSwappingDiscs coordinates


modelAfterPlacingDisc : Model -> Position -> Model
modelAfterPlacingDisc model pos =
    move (nextDiscToBePlaced model.occupiedTiles) pos
        |> modelAfterAddingTile model
