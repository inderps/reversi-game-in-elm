module Views.Disc exposing (disc)

import Html exposing (..)
import Html.Attributes exposing (class)
import Models.OccupiedSlot exposing (OccupiedSlot)
import Update exposing (Msg(..))


disc : OccupiedSlot -> Html Msg
disc occupiedSlot =
    div [ class "tile__disc" ]
        []
