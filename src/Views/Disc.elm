module Views.Disc exposing (disc, orangeDisc, greenDisc)

import Html exposing (..)
import Html.Attributes exposing (class)
import Update exposing (Msg(..))
import Models.Disc exposing (Disc(..))


disc : Disc -> Html Msg
disc disc =
    case disc of
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
