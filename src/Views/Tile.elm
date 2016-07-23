module Views.Tile exposing (tiles)

import Html exposing (..)
import Html.Attributes exposing (class)
import Html.Events exposing (onClick)
import Model exposing (Model)
import Update exposing (Msg(..))


tile : Int -> Int -> Model -> Html Msg
tile y x model =
    button [ class "tile", onClick TakeTurn ]
        []


tiles : Int -> Model -> List (Html Msg)
tiles y model =
    List.indexedMap (tile y) (List.repeat model.board.columns model)
