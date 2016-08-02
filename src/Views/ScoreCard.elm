module Views.ScoreCard exposing (scoreCard)

import Html exposing (..)
import Html.Events exposing (onClick)
import Html.Attributes exposing (class)
import Model exposing (Model)
import Models.Disc exposing (Disc(..))
import Update exposing (Msg(..))
import Views.Disc exposing (disc, orangeDisc, greenDisc)
import Computations.Disc exposing (nextDiscToBePlaced, totalNoOfDiscs)
import Computations.Turn exposing (canNextTurnBePlayed, highestPlacedDisc)
import Computations.Board exposing (allPositions)


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
            [ (nextTurn model)
            , h1 [ class "controls_reset", onClick (Reset) ]
                [ text "Reset" ]
            ]
        ]


nextTurn : Model -> Html Msg
nextTurn model =
    if canNextTurnBePlayed model then
        div [ class "controls_next-turn" ]
            [ h1 []
                [ text "Next Turn: " ]
            , (disc (nextDiscToBePlaced model.occupiedTiles))
            ]
    else
        div [ class "controls_next-turn" ]
            [ (nextTurnText model) ]


nextTurnText : Model -> Html Msg
nextTurnText model =
    case highestPlacedDisc model of
        Just disc ->
            case disc of
                Orange ->
                    div [ class "controls_next-turn" ]
                        [ h1 [] [ text "Winner: " ]
                        , (Views.Disc.disc Orange)
                        ]

                Green ->
                    div [ class "controls_next-turn" ]
                        [ h1 [] [ text "Winner: " ]
                        , (Views.Disc.disc Green)
                        ]

        Nothing ->
            div [ class "controls_next-turn" ]
                [ h1 [] [ text "Draw" ] ]
