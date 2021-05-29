module Web.View.Comparisons.Index where
import Web.View.Prelude

data IndexView = IndexView {}

instance View IndexView where
    html IndexView = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item active"><a>83</a></li>
                <li class="breadcrumb-item "><a>83</a></li>
            </ol>
        </nav>
        <h2 style="text-align: center;">Thank You!</h2>
        <br>
        <h4 style="text-align: center;">You will soon find the tierlist on the official server</h4>
        -- <br><br><br><br><br><br>
        -- <footer style="text-align: center;"><a href="https://github.com/akkesm/taranis" target="_blank">Source</a></footer>
    |]

