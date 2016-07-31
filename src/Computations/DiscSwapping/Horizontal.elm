module Computations.DiscSwapping.Horizontal
    exposing
        ( modelAfterSwappingDiscsHorizontally
        , swappableDiscsHorizontally
        )

import Model exposing (Model)
import Models.Position exposing (Position)
import Models.OccupiedTile exposing (OccupiedTile)
import List exposing (append)
import Computations.DiscSwapping.Left exposing (modelAfterSwappingDiscsOnLeft, leftSwappableDiscs)
import Computations.DiscSwapping.Right exposing (modelAfterSwappingDiscsOnRight, rightSwappableDiscs)


modelAfterSwappingDiscsHorizontally : Model -> Model
modelAfterSwappingDiscsHorizontally =
    modelAfterSwappingDiscsOnRight << modelAfterSwappingDiscsOnLeft


swappableDiscsHorizontally : Model -> Position -> List OccupiedTile
swappableDiscsHorizontally model position =
    rightSwappableDiscs model.boardSpecs model.occupiedTiles position
        |> append (leftSwappableDiscs model.occupiedTiles position)
