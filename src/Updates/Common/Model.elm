module Updates.Common.Model exposing (modelAfterAddingTile, modelAfterReplacingTiles)

import Model exposing (Model)
import Models.OccupiedTile exposing (OccupiedTile, move)


modelAfterAddingTile : Model -> OccupiedTile -> Model
modelAfterAddingTile model tile =
    { model | occupiedTiles = model.occupiedTiles ++ [ tile ] }


modelAfterReplacingTiles : Model -> List OccupiedTile -> Model
modelAfterReplacingTiles model tiles =
    { model | occupiedTiles = tiles }
