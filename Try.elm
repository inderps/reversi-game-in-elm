module Main exposing (..)

import Html exposing (text)
import List exposing (reverse, head, filter, map, tail)
import List.Extra exposing (find)
import Models.Position exposing (Position, position)
import Models.OccupiedTile exposing (OccupiedTile, move)
import Models.Disc exposing (Disc(..))
import Helpers.Tile exposing (lastFilledTile)
import Models.Position exposing (Position, tiltedPosition)


initialMoves : List OccupiedTile
initialMoves =
    [ move Orange (position 4 4)
    , move Green (position 5 4)
    , move Orange (position 5 5)
    , move Green (position 2 5)
    , move Green (position 3 5)
    , move Green (position 4 5)
    ]


leftCoordinates : List OccupiedTile -> List Position
leftCoordinates occupiedTiles =
    reverse (listUptoDisc 1 (lastFilledTile occupiedTiles))


listUptoDisc : Int -> Maybe OccupiedTile -> List Position
listUptoDisc n maybeTile =
    case maybeTile of
        Just tile ->
            map (tiltedPosition tile.position.y) [n..tile.position.x - 1]

        Nothing ->
            []


occupiedTiles : List Position
occupiedTiles =
    [ position 5 6, position 3 0, position 2 0, position 5 0 ]


occupiedTilesInTheseCoordinates : List OccupiedTile -> List Position -> List (Maybe OccupiedTile)
occupiedTilesInTheseCoordinates occupiedTiles coordinates =
    map (ifOccupied occupiedTiles) coordinates


ifOccupied : List OccupiedTile -> Position -> Maybe OccupiedTile
ifOccupied occupiedTiles position =
    find (isSameCoordinates position) occupiedTiles


isSameCoordinates : Position -> OccupiedTile -> Bool
isSameCoordinates position tile =
    position.x == tile.position.x && position.y == tile.position.y


maybeListToListUntil : List (Maybe a) -> List a
maybeListToListUntil maybeList =
    maybeListToListRecurse [] (Just maybeList)


maybeListToListRecurse : List a -> Maybe (List (Maybe a)) -> List a
maybeListToListRecurse filteredList maybeList =
    case maybeList of
        Just list ->
            case head list of
                Just maybeItem ->
                    case maybeItem of
                        Just item ->
                            maybeListToListRecurse (filteredList ++ [ item ]) (tail list)

                        Nothing ->
                            filteredList

                Nothing ->
                    filteredList

        Nothing ->
            filteredList


main =
    text (toString (maybeListToListUntil (occupiedTilesInTheseCoordinates initialMoves (leftCoordinates initialMoves))))
