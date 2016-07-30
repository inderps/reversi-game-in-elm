module Main exposing (..)

import Html exposing (text)
import List exposing (reverse, head, filter, map, tail, member)
import List.Extra exposing (takeWhile)
import Models.OccupiedTile exposing (OccupiedTile, move)
import Models.Disc exposing (Disc(..))
import Helpers.Tile exposing (lastFilledTile)
import Init exposing (init)
import Helpers.Disc exposing (opponentDisc)


main =
    text (toString ())
