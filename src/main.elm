module Test exposing (..)

import Html exposing (div, text, h1, button)
import Html.Events exposing (..)
import Html.App exposing (..)

type alias Model =
    { name : String
    , counter : Int
    }

type Action 
    = Up
    | Down
    
initialModel = {name = "ELM 101", counter = 3}
    
view model =
    div [][
        h1 [][text model.name]
        , div [][text (toString model.counter)]
        , button [onClick Up][text "UP"]
        , button [onClick Down][text "DOWN"] 
    ]

update msg model =
    case msg of
        Up -> {model | counter = model.counter + 1}
        Down -> {model | counter = model.counter - 1}


main =
    Html.App.beginnerProgram
    {
        model = initialModel
        , view = view
        , update = update
    }