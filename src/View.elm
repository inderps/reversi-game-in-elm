module View exposing (view)

import Html exposing (..)
import Html.Attributes exposing (class, href)
import Views.Board exposing (board)
import Views.ScoreCard exposing (scoreCard)
import Model exposing (Model)
import Update exposing (Msg(..))


view : Model -> Html Msg
view model =
    div [ class "game" ]
        [ (scoreCard model)
        , (board model)
        , div [ class "source-link" ]
            [ a [ href "https://github.com/inderps/reversi-game-in-elm" ] [ text "source" ]
            ]
        ]
