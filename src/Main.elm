module ReversiApp exposing (..)

import Html.App as App
import Init exposing (init)
import Update exposing (update)
import View exposing (view)


main : Program Never
main =
    App.beginnerProgram
        { model = init
        , update = update
        , view = view
        }
