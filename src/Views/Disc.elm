module Views.Disc exposing (disc)

import Html exposing (..)
import Html.Attributes exposing (class)
import Models.OccupiedTile exposing (OccupiedTile)
import Update exposing (Msg(..))
import Models.Player exposing (Player(..))


disc : OccupiedTile -> Html Msg
disc occupiedTile =
    case .player occupiedTile of
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
