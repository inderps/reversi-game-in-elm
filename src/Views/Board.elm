module Views.Board exposing (board)

import Html exposing (..)
import Html.Attributes exposing (class)
import Model exposing (Model)
import Update exposing (Msg(..))
import Views.HorizontalTiles exposing (listOfHorizontalTiles)


board : Model -> Html Msg
board model =
    div [ class "board" ]
        (listOfHorizontalTiles model)
