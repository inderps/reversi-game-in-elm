module Update exposing (..)

import Model exposing (Model)


type Msg
    = TakeTurn


update : Msg -> Model -> Model
update msg model =
    case msg of
        TakeTurn ->
            model
