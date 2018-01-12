import Html exposing (div, text, ul, li, input, button, h1)
import Html.Events exposing (onClick)

main =
  Html.beginnerProgram{model = model, view = view, update = update}

type alias Model = Int
type Msg = Reset

model: Model
model = 0

-- toHtmlList : List String -> Html.Html msg
toHtmlList strings =
  ul[][List.map toListItem ["Milk", "Cheese", "Eggs"]]

-- toListItem : String -> Html.Html msg
toListItem itemText =
  li [] [ text itemText]

update msg model =
  case msg of
    Reset ->
      0

view model =
  div []
  [
    h1[][text "TODO"]
  , ul[]
    [
      li[]
      [
        input[][]
      , button[][text "add"]
      ]
    , li[][text "Milk"]
    , li[][text "Cheese"]
    , li[][text "Eggs"]
    ]
  ]
