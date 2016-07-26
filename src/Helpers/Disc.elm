module Helpers.Disc exposing (nextDiscToBePlaced)

import List exposing (tail, reverse, head)
import Models.OccupiedTile exposing (OccupiedTile, move)
import Models.Disc exposing (Disc(..))


nextDiscToBePlaced : List OccupiedTile -> Disc
nextDiscToBePlaced =
    opponentDisc << orangeDiscIfNothing << lastPlacedDisc


opponentDisc : Disc -> Disc
opponentDisc disc =
    case disc of
        Orange ->
            Green

        Green ->
            Orange


orangeDiscIfNothing : Maybe Disc -> Disc
orangeDiscIfNothing maybeDisc =
    case maybeDisc of
        Just disc ->
            disc

        Nothing ->
            Orange


lastPlacedDisc : List OccupiedTile -> Maybe Disc
lastPlacedDisc occupiedTiles =
    maybeDisc (head (reverse occupiedTiles))


maybeDisc : Maybe OccupiedTile -> Maybe Disc
maybeDisc maybeOccupiedTile =
    case maybeOccupiedTile of
        Just occupiedTile ->
            Just occupiedTile.disc

        Nothing ->
            Nothing
