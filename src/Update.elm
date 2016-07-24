module Update exposing (..)

import Model exposing (Model)
import Models.Position exposing (Position)


type Msg
    = TakeTurn
    | HighlightTile Position


update : Msg -> Model -> Model
update msg model =
    case msg of
        TakeTurn ->
            model

        HighlightTile position ->
            highlightTile model position


highlightTile : Model -> Position -> Model
highlightTile model position =
    model
