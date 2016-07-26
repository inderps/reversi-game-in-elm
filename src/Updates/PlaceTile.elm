module Updates.PlaceTile exposing (placeTile)

import Model exposing (Model)
import Models.Position exposing (Position)
import Models.OccupiedTile exposing (OccupiedTile, move)


placeTile : Model -> Position -> Model
placeTile model position =
    model



--
-- insertTile : Model -> Position -> Model
-- insertTile model pos =
--     { model | occupiedTiles = model.occupiedTiles ++ [ move model.turn pos ] }


updateTiles : Model -> Model
updateTiles model =
    model


flipDiscs : Model -> List Maybe OccupiedTile -> Model
flipDiscs model maybeOccupiedTiles =
    model
