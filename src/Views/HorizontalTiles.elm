module Views.HorizontalTiles exposing (listOfHorizontalTiles)

import Html exposing (..)
import Html.Attributes exposing (class)
import List exposing (map)
import Model exposing (Model)
import Update exposing (Msg(..))
import Views.Tile exposing (tiles)


listOfHorizontalTiles : Model -> List (Html Msg)
listOfHorizontalTiles model =
    map (horizontalTiles model) [1..model.board.rows]


horizontalTiles : Model -> Int -> Html Msg
horizontalTiles model position =
    div [ class "board__row" ]
        (tiles position model)
