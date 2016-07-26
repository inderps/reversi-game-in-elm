module Update exposing (..)

import Model exposing (Model)
import Models.Position exposing (Position)
import Updates.PlaceDisc exposing (placeDisc)
import Updates.HighlightTile exposing (highlightTile)
import Updates.RemoveHighlightTile exposing (removeHighlightTile)


type Msg
    = PlaceDisc Position
    | HighlightTile Position
    | RemoveHighlightTile


update : Msg -> Model -> Model
update msg model =
    case msg of
        PlaceDisc position ->
            placeDisc model position

        HighlightTile position ->
            highlightTile model position

        RemoveHighlightTile ->
            removeHighlightTile model
