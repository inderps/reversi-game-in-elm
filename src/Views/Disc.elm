module Views.Disc exposing (disc)

import Html exposing (..)
import Html.Attributes exposing (class)
import Models.OccupiedTile exposing (OccupiedTile)
import Update exposing (Msg(..))
import Models.Disc exposing (Disc(..))


disc : OccupiedTile -> Html Msg
disc occupiedTile =
    case .disc occupiedTile of
        Orange ->
            (orangeDisc)

        Green ->
            (greenDisc)


orangeDisc : Html Msg
orangeDisc =
    discOfColor "orange"


greenDisc : Html Msg
greenDisc =
    discOfColor "green"


discOfColor : String -> Html Msg
discOfColor disc =
    div [ class ("tile__disc " ++ disc) ] []
