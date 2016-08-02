module Update exposing (..)

import Model exposing (Model)
import Models.Position exposing (Position)
import Updates.PlaceDisc exposing (placeDisc)
import Updates.Reset exposing (reset)


type Msg
    = PlaceDisc Position
    | Reset


update : Msg -> Model -> Model
update msg model =
    case msg of
        PlaceDisc position ->
            placeDisc model position

        Reset ->
            reset model
