# SCBCN_ELM101
Introductory workshop to start learning Elm

## Defining a basic view
 - Create a file named main.elm in the src folder
 - Define a module called Test
    
    ``` 
    module Test exposing (..)
    ```
 - Import the Html module (only with div, txt and h1)
    
    ```
    import Html exposing (div, text, h1, button)
    ```
 - Create a simple view function that renders a text in a h1 inside a div.
    
    ```
    view model =
        div[][
            h1[][text model]
        ]
    ```
 - Create a main function that calls view
    
    ```
    main =
        view "Hello Barcelona!"
    ```
 - Create main.js

    ```
    elm make --output main.js
    ```

## Using a model
 - Create a type alias called Model with a name (String) and a counter (Int)

    ```
    type alias Model =
    { name : String
    , counter : Int
    }
    ```
 - Create a value called initialModel with some data

    ```
    initialModel = {name = "ELM 101", counter = 3}
    ```
 - Use the model to render the view

    ```
    view model =
    div [][
        h1 [][text model.name]
        , div [][text (toString model.counter)]
    ]
    ```

 - Pass initialModel as a parameter to the view function in main

    ```
    main =
        view initialModel
    ```
 - Create main.js

    ```
    elm make --output main.js
    ```

## Updating counter
 - Create two buttons (Up and down)

    ```
    import Html exposing (div, text, h1, button)
    ```
    ```
    view model =
    div [][
        h1 [][text model.name]
        , div [][text (toString model.counter)]
        , button [][text "UP"]
        , button [][text "DOWN"]
    ]
    ```
 - Create a union type with two cases, Up and down

    ```
    type Action 
    = Up
    | Down
    ```
 - Import Html.Events

    ```
    import Html.Events exposing (..)
    ```

 - Add the onClick event to both buttons

    ```
    , button [onClick Up][text "UP"]
    , button [onClick Down][text "DOWN"]    
    ```

 - Create an update function that gets a msg and a model and updates the model accordingly using pattern matching

    ```
    update msg model =
    case msg of
        Up -> {model | counter = model.counter + 1}
        Down -> {model | counter = model.counter - 1}
    ```

 - Import Html.App

    ```
    import Html.App exposing (..)
    ```

 - Use Html.beginnerProgram

    ```
    main =
        Html.App.beginnerProgram
        {
            model = initialModel
            , view = view
            , update = update
        }
    ```

 - Create main.js

    ```
    elm make --output main.js
    ```     

## Generate a random number

 - Import Random module

    ```
    import Random
    ```
 - Create a function to generate random numbers

    ```
    randomNumber =
        Random.int 0 100
    ```

 - Change main to use *program*
    ```
    main =
    Html.App.program
    {
        init = (initialModel, Cmd.none)
        , view = view
        , update = update
        , subscriptions = (\model -> Sub.none)
    }
    ```

 - Update the update function to return Cmd.none en each case
    ```
    update msg model =
    case msg of
        Up -> ({model | counter = model.counter + 1}, Cmd.none)
        Down -> ({model | counter = model.counter - 1}, Cmd.none)
    ```

 - Create a new case (GetRandom) in the Action union
    ```
    type Action 
        = Up
        | Down
        | GetRandom
    ```

 - Add a new branch (GetRandom) in the update pattern matching
    ```
    update msg model =
        case msg of
            Up -> ({model | counter = model.counter + 1}, Cmd.none)
            Down -> ({model | counter = model.counter - 1}, Cmd.none)
            GetRandom -> (model, Cmd.none)
    ```

 - Create a new case (Update of Int) in the Action union
    ```
    type Action 
        = Up
        | Down
        | GetRandom
        | Update Int
    ```

- Add a new branch (Update) in the update pattern matching
    ```
    update msg model =
        case msg of
            Up -> ({model | counter = model.counter + 1}, Cmd.none)
            Down -> ({model | counter = model.counter - 1}, Cmd.none)
            GetRandom -> (model, Cmd.none)
            Update x -> ({model | counter = x}, Cmd.none)
    ```

 - Update the GetRandom branch in the update pattern match to return the command needed
    ```
    update msg model =
        case msg of
            Up -> ({model | counter = model.counter + 1}, Cmd.none)
            Down -> ({model | counter = model.counter - 1}, Cmd.none)
            GetRandom -> (model, Random.generate Update randomNumber)
            Update x -> ({model | counter = x}, Cmd.none)
    ```

 - Create main.js

    ```
    elm make --output main.js
    ```   