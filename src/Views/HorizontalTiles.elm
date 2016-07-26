module Views.HorizontalTiles exposing (listOfHorizontalTiles)

import Html exposing (..)
import Html.Attributes exposing (class)
import List exposing (map)
import Model exposing (Model)
import Update exposing (Msg(..))
import Views.Tile exposing (tile)


listOfHorizontalTiles : Model -> List (Html Msg)
listOfHorizontalTiles model =
    map (horizontalTiles model) [1..model.boardSpecs.rows]


horizontalTiles : Model -> Int -> Html Msg
horizontalTiles model row =
    div [ class "board__row" ]
        (map (tile model row) [1..model.boardSpecs.columns])
