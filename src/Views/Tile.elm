module Views.Tile exposing (tiles)

import Html exposing (..)
import Html.Attributes exposing (class)
import Html.Events exposing (onClick, onMouseOver)
import List exposing (head, filter, map)
import Models.OccupiedSlot exposing (OccupiedSlot)
import Models.Position exposing (Position, position)
import Model exposing (Model)
import Update exposing (Msg(..))
import Views.Disc exposing (disc)


tiles : Int -> Model -> List (Html Msg)
tiles y model =
    map (tile model.occupiedSlots y) [1..model.board.columns]


tile : List OccupiedSlot -> Int -> Int -> Html Msg
tile occupiedSlots y x =
    tileWithPosition occupiedSlots (position x y)


tileWithPosition : List OccupiedSlot -> Position -> Html Msg
tileWithPosition occupiedSlots pos =
    case maybeOccupied occupiedSlots pos of
        Just occupiedSlot ->
            button [ class "tile" ]
                [ (disc occupiedSlot) ]

        Nothing ->
            button [ class "tile", onClick TakeTurn, onMouseOver (HighlightTile pos) ] []


maybeOccupied : List OccupiedSlot -> Position -> Maybe OccupiedSlot
maybeOccupied occupiedSlots pos =
    head (filter (isSlotOccupied pos) occupiedSlots)


isSlotOccupied : Position -> OccupiedSlot -> Bool
isSlotOccupied pos occupiedSlot =
    .x occupiedSlot.position == .x pos && .y occupiedSlot.position == .y pos
