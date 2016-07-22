module Models.Turn exposing (..)

import Models.Player exposing (Player(..))


type alias Turn =
    Player


choose : Player -> Player
choose player =
    player
