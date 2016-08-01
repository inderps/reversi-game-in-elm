module Computations.DiscSwapping.Vertical
    exposing
        ( modelAfterSwappingDiscsVertically
        , swappableDiscsVertically
        )

import List exposing (append)
import Model exposing (Model)
import Models.Position exposing (Position)
import Models.OccupiedTile exposing (OccupiedTile)
import Computations.DiscSwapping.Top exposing (modelAfterSwappingDiscsOnTop, topSwappableDiscs)
import Computations.DiscSwapping.Bottom exposing (modelAfterSwappingDiscsOnBottom, bottomSwappableDiscs)


modelAfterSwappingDiscsVertically : Model -> Model
modelAfterSwappingDiscsVertically =
    modelAfterSwappingDiscsOnBottom << modelAfterSwappingDiscsOnTop


swappableDiscsVertically : Model -> Position -> List OccupiedTile
swappableDiscsVertically model position =
    topSwappableDiscs model.occupiedTiles position
        |> append (bottomSwappableDiscs model.boardSpecs model.occupiedTiles position)
