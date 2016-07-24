module Views.Tile exposing (tiles)

import Html exposing (..)
import Html.Attributes exposing (class)
import Html.Events exposing (onClick, onMouseOver, onMouseOut)
import List exposing (head, filter, map)
import Models.OccupiedSlot exposing (OccupiedSlot)
import Models.Position exposing (Position, position)
import Model exposing (Model)
import Update exposing (Msg(..))
import Views.Disc exposing (disc)


tiles : Int -> Model -> List (Html Msg)
tiles y model =
    map (tile model y) [1..model.board.columns]


tile : Model -> Int -> Int -> Html Msg
tile model y x =
    tileWithPosition model (position x y)


tileWithPosition : Model -> Position -> Html Msg
tileWithPosition model pos =
    case maybeOccupied model.occupiedSlots pos of
        Just occupiedSlot ->
            button [ class "tile" ]
                [ (disc occupiedSlot) ]

        Nothing ->
            button
                [ class (maybeHighlightTile pos model.highlightedTile)
                , onClick TakeTurn
                , onMouseOver (HighlightTile pos)
                , onMouseOut (RemoveHighlightTile)
                ]
                []


maybeOccupied : List OccupiedSlot -> Position -> Maybe OccupiedSlot
maybeOccupied occupiedSlots pos =
    head (filter (isSlotOccupied pos) occupiedSlots)


isSlotOccupied : Position -> OccupiedSlot -> Bool
isSlotOccupied pos occupiedSlot =
    .x occupiedSlot.position == .x pos && .y occupiedSlot.position == .y pos


maybeHighlightTile : Position -> Maybe Position -> String
maybeHighlightTile tilePos maybeHighlightedTilePos =
    case maybeHighlightedTilePos of
        Just highlightPos ->
            if tilePos == highlightPos then
                "tile highlight"
            else
                "tile"

        Nothing ->
            "tile"
