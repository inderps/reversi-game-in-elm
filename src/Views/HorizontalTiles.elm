module Views.HorizontalTiles exposing (listOfHorizontalTiles)

import Html exposing (..)
import Html.Attributes exposing (class)
import Model exposing (Model)
import Update exposing (Msg(..))
import Views.Tile exposing (tiles)


rowCSSClass : Int -> String
rowCSSClass position =
    "row row-" ++ (toString position)


horizontalTiles : Int -> Model -> Html Msg
horizontalTiles position model =
    div [ class (rowCSSClass position) ]
        (tiles position model)


listOfHorizontalTiles : Model -> List (Html Msg)
listOfHorizontalTiles model =
    List.indexedMap horizontalTiles (List.repeat model.board.rows model)
