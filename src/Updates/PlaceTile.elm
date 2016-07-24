module Updates.PlaceTile exposing (placeTile)

import Model exposing (Model)
import Models.Position exposing (Position)
import Models.OccupiedSlot exposing (OccupiedSlot, move)


placeTile : Model -> Position -> Model
placeTile model position =
    updateTilesOnLeft (insertTile model position)


insertTile : Model -> Position -> Model
insertTile model pos =
    { model | occupiedSlots = model.occupiedSlots ++ [ move model.turn pos ] }


updateTilesOnLeft : Model -> Model
updateTilesOnLeft model =
    { model | occupiedSlots = [] }


flipDiscs : Model -> List Maybe OccupiedSlot -> Model
flipDiscs model maybeOccupiedSlots =
    model
