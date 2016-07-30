module Updates.DiscSwapping.Vertical exposing (modelAfterSwappingDiscsVertically)

import Model exposing (Model)
import Updates.DiscSwapping.Top exposing (modelAfterSwappingDiscsOnTop)


modelAfterSwappingDiscsVertically : Model -> Model
modelAfterSwappingDiscsVertically =
    modelAfterSwappingDiscsOnTop
