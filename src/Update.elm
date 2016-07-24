module Update exposing (..)

import Model exposing (Model)
import Models.Position exposing (Position)
import Updates.PlaceTile exposing (placeTile)
import Updates.HighlightTile exposing (highlightTile)
import Updates.RemoveHighlightTile exposing (removeHighlightTile)


type Msg
    = PlaceTile Position
    | HighlightTile Position
    | RemoveHighlightTile


update : Msg -> Model -> Model
update msg model =
    case msg of
        PlaceTile position ->
            placeTile model position

        HighlightTile position ->
            highlightTile model position

        RemoveHighlightTile ->
            removeHighlightTile model
