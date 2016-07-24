module Views.Disc exposing (disc)

import Html exposing (..)
import Html.Attributes exposing (class)
import Models.OccupiedSlot exposing (OccupiedSlot)
import Update exposing (Msg(..))
import Models.Player exposing (Player(..))


disc : OccupiedSlot -> Html Msg
disc occupiedSlot =
    case .player occupiedSlot of
        Orange ->
            (orangeDisc)

        Green ->
            (greenDisc)


orangeDisc : Html Msg
orangeDisc =
    discOfPlayer "orange"


greenDisc : Html Msg
greenDisc =
    discOfPlayer "green"


discOfPlayer : String -> Html Msg
discOfPlayer player =
    div [ class ("tile__disc " ++ player) ] []
