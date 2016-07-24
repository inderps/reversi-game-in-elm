module View exposing (view)

import Html exposing (..)
import Html.Attributes exposing (class)
import Views.Board exposing (board)
import Model exposing (Model)
import Update exposing (Msg(..))


view : Model -> Html Msg
view model =
    div [ class "game" ]
        [ button [] [ text "Start New Game" ]
        , (board model)
        ]
