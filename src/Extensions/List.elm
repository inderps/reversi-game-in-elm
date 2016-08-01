module Extensions.List exposing (maybeListToListUntil)

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
                            tail list
                                |> maybeListToListRecurse (filteredList ++ [ item ])

                        Nothing ->
                            filteredList

                Nothing ->
                    filteredList

        Nothing ->
            filteredList
