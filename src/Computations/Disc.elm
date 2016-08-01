module Computations.Disc exposing (nextDiscToBePlaced, opponentDisc, totalNoOfDiscs)

import List exposing (filter, length)
import Computations.Tile exposing (lastFilledTile)
import Models.OccupiedTile exposing (OccupiedTile, move)
import Models.Disc exposing (Disc(..))


totalNoOfDiscs : List OccupiedTile -> Disc -> Int
totalNoOfDiscs occupiedTiles disc =
    length (filter (tileContainDisc disc) occupiedTiles)


tileContainDisc : Disc -> OccupiedTile -> Bool
tileContainDisc disc occupiedTile =
    occupiedTile.disc == disc


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
    lastFilledTile occupiedTiles
        |> maybeDisc


maybeDisc : Maybe OccupiedTile -> Maybe Disc
maybeDisc maybeOccupiedTile =
    case maybeOccupiedTile of
        Just occupiedTile ->
            Just occupiedTile.disc

        Nothing ->
            Nothing
