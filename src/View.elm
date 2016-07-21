module View exposing (view)

import Html exposing (..)
import Html.Events exposing (onClick)

import Model exposing (Model)
import Update exposing (Msg (..))

view : Model -> Html Msg
view model =
  div []
    [ button [ onClick Decrement ] [ text "-" ]
    , div [] [ text (toString model.counter) ]
    , button [ onClick Increment ] [ text "+" ]
    ]
