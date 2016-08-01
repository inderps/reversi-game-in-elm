module Views.ScoreCard exposing (scoreCard)

import Html exposing (..)
import Html.Attributes exposing (class)
import Model exposing (Model)
import Update exposing (Msg(..))
import Views.Disc exposing (orangeDisc, greenDisc)


scoreCard : Model -> Html Msg
scoreCard model =
    div [ class "scorecard" ]
        [ div [ class "score" ]
            [ div [ class "score__player" ]
                [ (orangeDisc)
                , h1 [] [ text " : 2" ]
                ]
            , div [ class "score__player" ]
                [ (greenDisc)
                , h1 [] [ text " : 2" ]
                ]
            ]
        , div [ class "controls" ]
            [ div [ class "controls_next-turn" ]
                [ h1 []
                    [ text "Next Turn: " ]
                ]
            , h1 [ class "controls_reset" ]
                [ text "Reset" ]
            ]
        ]
