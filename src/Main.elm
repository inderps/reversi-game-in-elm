module ReversiApp exposing (..)

import Html.App as App

import Model exposing (init)
import Update exposing (update)
import View exposing (view)

main =
  App.beginnerProgram
    { model = init 0
    , update = update
    , view = view
    }
