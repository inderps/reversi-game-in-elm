module Views.Tile exposing (tile)

import Html exposing (..)
import Html.Attributes exposing (class)
import Html.Events exposing (onClick, onMouseOver, onMouseOut)
import List exposing (head, filter, map)
import Models.OccupiedTile exposing (OccupiedTile)
import Models.Position exposing (Position, position)
import Model exposing (Model)
import Update exposing (Msg(..))
import Views.Disc exposing (disc)


tile : Model -> Int -> Int -> Html Msg
tile model y x =
    tileWithPosition model (position x y)


tileWithPosition : Model -> Position -> Html Msg
tileWithPosition model pos =
    case maybeOccupied model.occupiedTiles pos of
        Just occupiedTile ->
            button [ class "tile" ]
                [ (disc occupiedTile) ]

        Nothing ->
            button
                [ class (maybeHighlightTile pos model.highlightedTile)
                , onClick (PlaceTile pos)
                , onMouseOver (HighlightTile pos)
                , onMouseOut (RemoveHighlightTile)
                ]
                []


maybeOccupied : List OccupiedTile -> Position -> Maybe OccupiedTile
maybeOccupied occupiedTiles pos =
    head (filter (isTileOccupied pos) occupiedTiles)


isTileOccupied : Position -> OccupiedTile -> Bool
isTileOccupied pos occupiedTile =
    .x occupiedTile.position == .x pos && .y occupiedTile.position == .y pos


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
