module Updates.DiscSwapping.Horizontal exposing (modelAfterSwappingDiscsHorizontally)

import Model exposing (Model)
import Updates.DiscSwapping.Left exposing (modelAfterSwappingDiscsOnLeft)
import Updates.DiscSwapping.Right exposing (modelAfterSwappingDiscsOnRight)


modelAfterSwappingDiscsHorizontally : Model -> Model
modelAfterSwappingDiscsHorizontally =
    modelAfterSwappingDiscsOnRight << modelAfterSwappingDiscsOnLeft
