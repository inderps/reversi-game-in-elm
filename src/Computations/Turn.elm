module Computations.Turn exposing (canDiscBePlaced, canNextTurnBePlayed, highestPlacedDisc)

import List exposing (append, isEmpty, length, filter, any)
import Model exposing (Model)
import Models.Position exposing (Position)
import Models.OccupiedTile exposing (OccupiedTile)
import Models.Disc exposing (Disc(..))
import Computations.Board exposing (unOccupiedPositions)
import Computations.Disc exposing (totalNoOfDiscs)
import Computations.DiscSwapping.Horizontal exposing (swappableDiscsHorizontally)
import Computations.DiscSwapping.Vertical exposing (swappableDiscsVertically)


canNextTurnBePlayed : Model -> Bool
canNextTurnBePlayed model =
    any (canDiscBePlaced model) (unOccupiedPositions model)


highestPlacedDisc : Model -> Maybe Disc
highestPlacedDisc model =
    if
        totalNoOfDiscs model.occupiedTiles Orange
            == totalNoOfDiscs model.occupiedTiles Green
    then
        Nothing
    else if
        totalNoOfDiscs model.occupiedTiles Orange
            > totalNoOfDiscs model.occupiedTiles Green
    then
        Just Orange
    else
        Just Green


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
