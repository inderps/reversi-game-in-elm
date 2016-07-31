module Update exposing (..)

import Model exposing (Model)
import Models.Position exposing (Position)
import Updates.PlaceDisc exposing (placeDisc)


type Msg
    = PlaceDisc Position


update : Msg -> Model -> Model
update msg model =
    case msg of
        PlaceDisc position ->
            placeDisc model position
