module Update exposing (..)

import Model exposing (Model)
import Models.Position exposing (Position)
import Updates.HighlightTile exposing (highlightTile)
import Updates.RemoveHighlightTile exposing (removeHighlightTile)


type Msg
    = TakeTurn
    | HighlightTile Position
    | RemoveHighlightTile


update : Msg -> Model -> Model
update msg model =
    case msg of
        TakeTurn ->
            model

        HighlightTile position ->
            highlightTile model position

        RemoveHighlightTile ->
            removeHighlightTile model
