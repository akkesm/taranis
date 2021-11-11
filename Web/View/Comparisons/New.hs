module Web.View.Comparisons.New where
import Web.View.Prelude

data NewView = NewView
    {
      comparison :: Comparison
    , skillOne :: Skill
    , skillTwo :: Skill
    , vote :: Maybe Int
    }

instance View NewView where
    html NewView { comparison = comparison, skillOne = skillOne, skillTwo = skillTwo, vote = vote } =
        let voteInt :: Int = fromMaybe 1 vote
        in [hsx|
            <nav>
                <ol class="breadcrumb">
                    <li class="breadcrumb-item">{tshow voteInt}</li>
                    <li class="breadcrumb-item active">83</li>
                </ol>
            </nav>
            <h3 style="text-align: center">Select which ability you would pick in game</h3>
            {renderForm comparison skillOne skillTwo}
            <br><br><br><br>
            <footer style="text-align: center;"><a href="https://github.com/akkesm/taranis" target="_blank">Source</a></footer>
        |]

renderForm :: Comparison -> Skill -> Skill -> Html
renderForm comparison skillOne skillTwo = formFor comparison [hsx|
    <style>
        .skip-button {
            background: rgb(31,174,0);
            background: linear-gradient(0deg, rgba(31,174,0,1) 0%, rgba(115,239,41,1) 49%);
            border-color: #63ed29;
            border-radius: 10px;
            box-shadow: 0 5px #256610;
            font-family: Helvetica;
            -webkit-text-stroke-width: 1px;
            -webkit-text-stroke-color: black;
            color: white;
            font-size: 2rem;
            font-weight: 600;
            text-shadow: 0px 3px 2px #333333;
        }
        .skip-button:activate {
          box-shadow: 0 2px ##256610;
          transform: translateY(3px);
        }
        a:link, a:visited, a:hover, a:active {
            color:white;
            background-color: transparent;
            text-decoration: none;
        }
    </style>

    <input type="hidden" name="skill1" value={get #name skillOne}>
    <input type="hidden" name="skill2" value={get #name skillTwo}>
    <div style="text-align: center;">
        <input type="image" name="winner" value="1" src={get #image skillOne} style="background-color: transparent; border:none; margin: 20px;">
        <input type="image" name="winner" value="2" src={get #image skillTwo} style="background-color: transparent; border:none; margin: 20px;">
        <br>
        <button type="submit" class="skip-button">
            <a href={WinnerNoneComparisonAction}>Unsure</a>
        </button>
    </div>
|]
