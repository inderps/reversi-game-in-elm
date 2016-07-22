module View exposing (view)

import Html exposing (..)
import Html.Events exposing (onClick)
import Model exposing (Model)
import Update exposing (Msg(..))


view : Model -> Html Msg
view model =
    div []
        [ button [ onClick TakeTurn ] [ text "-" ]
        , div [] [ text (toString model.turn) ]
        ]
