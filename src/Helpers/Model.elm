module Helpers.Model exposing (modelAfterAddingTile)

import Model exposing (Model)
import Models.OccupiedTile exposing (OccupiedTile, move)


modelAfterAddingTile : Model -> OccupiedTile -> Model
modelAfterAddingTile model tile =
    { model | occupiedTiles = model.occupiedTiles ++ [ tile ] }
