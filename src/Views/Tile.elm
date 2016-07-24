module Views.Tile exposing (tiles)

import Html exposing (..)
import Html.Attributes exposing (class)
import Html.Events exposing (onClick)
import List exposing (head, filter, map)
import Models.OccupiedSlot exposing (OccupiedSlot)
import Model exposing (Model)
import Update exposing (Msg(..))
import Views.Disc exposing (disc)


tiles : Int -> Model -> List (Html Msg)
tiles y model =
    map (tile model.occupiedSlots y) [1..model.board.columns]


tile : List OccupiedSlot -> Int -> Int -> Html Msg
tile occupiedSlots y x =
    case maybeOccupied occupiedSlots x y of
        Just occupiedSlot ->
            button [ class "tile" ]
                [ (disc occupiedSlot) ]

        Nothing ->
            button [ class "tile", onClick TakeTurn ] []


maybeOccupied : List OccupiedSlot -> Int -> Int -> Maybe OccupiedSlot
maybeOccupied occupiedSlots x y =
    head (filter (isSlotOccupied x y) occupiedSlots)


isSlotOccupied : Int -> Int -> OccupiedSlot -> Bool
isSlotOccupied x y occupiedSlot =
    .x occupiedSlot == x && .y occupiedSlot == y
