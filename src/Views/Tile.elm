module Views.Tile exposing (tile)

import Html exposing (..)
import Html.Attributes exposing (class)
import Html.Events exposing (onClick)
import List exposing (head, filter, map)
import Computations.Turn exposing (canDiscBePlaced)
import Model exposing (Model)
import Models.OccupiedTile exposing (OccupiedTile)
import Models.Position exposing (Position, setXY)
import Update exposing (Msg(..))
import Views.Disc exposing (disc)


tile : Model -> Int -> Int -> Html Msg
tile model y x =
    tileWithPosition model (setXY x y)


tileWithPosition : Model -> Position -> Html Msg
tileWithPosition model pos =
    case maybeOccupied model.occupiedTiles pos of
        Just occupiedTile ->
            button [ class "tile" ]
                [ (disc occupiedTile.disc) ]

        Nothing ->
            if canDiscBePlaced model pos then
                button
                    [ class "tile highlight"
                    , onClick (PlaceDisc pos)
                    ]
                    []
            else
                button
                    [ class "tile" ]
                    []


maybeOccupied : List OccupiedTile -> Position -> Maybe OccupiedTile
maybeOccupied occupiedTiles pos =
    head (filter (isTileOccupied pos) occupiedTiles)


isTileOccupied : Position -> OccupiedTile -> Bool
isTileOccupied pos occupiedTile =
    .x occupiedTile.position == .x pos && .y occupiedTile.position == .y pos
