module Main exposing (..)

import Html.Attributes exposing (value)
import Html exposing (Html, div, text, ul, li, input, button, h1)
import Html.Events exposing (on, keyCode, onClick, onInput)
import Json.Decode as Json


type alias Model =
    { todoList : List String
    , newTaskName : String
    }


type Msg
    = Reset
    | AddTask String
    | NewTaskName String


toHtmlList : List String -> List (Html.Html msg)
toHtmlList strings =
    List.map toListItem strings


toListItem itemText =
    li [] [ text itemText ]



---- MODEL ----


init : ( Model, Cmd Msg )
init =
    ( { todoList = [ "Test Item ToDo" ], newTaskName = "" }
    , Cmd.none
    )



---- UPDATE ----


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    let
        newModel =
            case msg of
                Reset ->
                    { model | todoList = [] }

                AddTask taskName ->
                    if model.newTaskName /= "" then
                        { model
                            | todoList = taskName :: model.todoList
                            , newTaskName = ""
                        }
                    else
                        model

                NewTaskName taskName ->
                    { model | newTaskName = taskName }
    in
        ( newModel, Cmd.none )



---- VIEW ----


view : Model -> Html Msg
view model =
    div []
        [ h1 [] [ text "Your Elm App is working!" ]
        , div []
            [ h1 [] [ text "TODO" ]
            , ul []
                ([ li []
                    [ input [ onInput NewTaskName, value model.newTaskName ] []
                    , button [ onClick (AddTask model.newTaskName) ] [ text "add" ]
                    ]
                 ]
                    ++ (toHtmlList model.todoList)
                )
            ]
        ]



---- PROGRAM ----


main : Program Never Model Msg
main =
    Html.program
        { view = view
        , update = update
        , init = init
        , subscriptions = always Sub.none
        }
