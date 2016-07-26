module Updates.PlaceDisc exposing (placeDisc)

import Model exposing (Model)
import Models.Position exposing (Position)
import Models.OccupiedTile exposing (OccupiedTile, move)
import Helpers.Disc exposing (nextDiscToBePlaced)


placeDisc : Model -> Position -> Model
placeDisc model position =
    { model | occupiedTiles = occupiedTilesAfterPlacingAndSwapingDiscs model position }


occupiedTilesAfterPlacingAndSwapingDiscs : Model -> Position -> List OccupiedTile
occupiedTilesAfterPlacingAndSwapingDiscs model position =
    tilesAfterPlacingDisc model position


tilesAfterPlacingDisc : Model -> Position -> List OccupiedTile
tilesAfterPlacingDisc model pos =
    model.occupiedTiles ++ [ move (nextDiscToBePlaced model.occupiedTiles) pos ]


updateTiles : Model -> Model
updateTiles model =
    model


flipDiscs : Model -> List Maybe OccupiedTile -> Model
flipDiscs model maybeOccupiedTiles =
    model
