module Views.ScoreCard exposing (scoreCard)

import Html exposing (..)
import Html.Attributes exposing (class)
import Model exposing (Model)
import Models.Disc exposing (Disc(..))
import Update exposing (Msg(..))
import Views.Disc exposing (disc, orangeDisc, greenDisc)
import Computations.Disc exposing (nextDiscToBePlaced, totalNoOfDiscs)


scoreCard : Model -> Html Msg
scoreCard model =
    div [ class "scorecard" ]
        [ div [ class "score" ]
            [ div [ class "score__player" ]
                [ (orangeDisc)
                , h1 []
                    [ text
                        (" : "
                            ++ (toString (totalNoOfDiscs model.occupiedTiles Orange))
                        )
                    ]
                ]
            , div [ class "score__player" ]
                [ (greenDisc)
                , h1 []
                    [ text
                        (" : "
                            ++ (toString (totalNoOfDiscs model.occupiedTiles Green))
                        )
                    ]
                ]
            ]
        , div [ class "controls" ]
            [ div [ class "controls_next-turn" ]
                [ h1 []
                    [ text "Next Turn: " ]
                , (disc (nextDiscToBePlaced model.occupiedTiles))
                ]
            , h1 [ class "controls_reset" ]
                [ text "Reset" ]
            ]
        ]
