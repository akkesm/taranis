module Admin.View.Comparisons.Show where
import Admin.View.Prelude

data ShowView = ShowView { comparison :: Comparison }

instance View ShowView where
    html ShowView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href={ComparisonsAction}>Comparisons</a></li>
                <li class="breadcrumb-item active">Show Comparison</li>
            </ol>
        </nav>
        <h1>Show Comparison</h1>
        <p>{comparison}</p>
    |]
