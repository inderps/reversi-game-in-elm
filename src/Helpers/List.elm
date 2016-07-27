module Helpers.List exposing (firstFewContaining, maybeListToListUntil)

import List exposing (head, tail)


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


firstFewContaining : a -> List a -> List a
firstFewContaining item list =
    firstFewContainingRecurse item [] (Just list)


firstFewContainingRecurse : a -> List a -> Maybe (List a) -> List a
firstFewContainingRecurse itemToCompare filteredList maybeExistingList =
    case maybeExistingList of
        Just list ->
            case head list of
                Just item ->
                    if item == itemToCompare then
                        firstFewContainingRecurse itemToCompare (filteredList ++ [ item ]) (tail list)
                    else
                        filteredList

                Nothing ->
                    filteredList

        Nothing ->
            filteredList
