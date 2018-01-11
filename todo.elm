import Html exposing (div, text)

main =
  Html.beginnerProgram{model = model, view = view, update = update}

type alias Model = Int
type Msg = Reset

model: Model
model = 0

update msg model =
  case msg of
    Reset ->
      0

view model =
  div []
  [
    text "Hello World"
  ]
