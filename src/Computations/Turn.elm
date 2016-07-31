module Computations.Turn exposing (canDiscBePlaced)

import List exposing (append, isEmpty)
import Model exposing (Model)
import Models.Position exposing (Position)
import Models.OccupiedTile exposing (OccupiedTile)
import Computations.DiscSwapping.Horizontal exposing (swappableDiscsHorizontally)
import Computations.DiscSwapping.Vertical exposing (swappableDiscsVertically)


canDiscBePlaced : Model -> Position -> Bool
canDiscBePlaced model position =
    anySwappableDiscs model position


anySwappableDiscs : Model -> Position -> Bool
anySwappableDiscs model position =
    not (isEmpty (swappableDiscs model position))


swappableDiscs : Model -> Position -> List OccupiedTile
swappableDiscs model position =
    swappableDiscsHorizontally model position
        |> append (swappableDiscsVertically model position)
