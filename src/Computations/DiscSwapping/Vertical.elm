module Computations.DiscSwapping.Vertical
    exposing
        ( modelAfterSwappingDiscsVertically
        , swappableDiscsVertically
        )

import Model exposing (Model)
import Models.Position exposing (Position)
import Models.OccupiedTile exposing (OccupiedTile)
import Computations.DiscSwapping.Top exposing (modelAfterSwappingDiscsOnTop, topSwappableDiscs)


modelAfterSwappingDiscsVertically : Model -> Model
modelAfterSwappingDiscsVertically =
    modelAfterSwappingDiscsOnTop


swappableDiscsVertically : Model -> Position -> List OccupiedTile
swappableDiscsVertically model position =
    topSwappableDiscs model.occupiedTiles position
