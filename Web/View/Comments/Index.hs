module Web.View.Comments.Index where
import Web.View.Prelude

data IndexView = IndexView { comments :: [Comment]  }

instance View IndexView where
    html IndexView { .. } = [hsx|
        {breadcrumb}

        <h1>Comments</h1>
        <div class="table-responsive">
            <table class="table">
                <thead>
                    <tr>
                        <th>Comment</th>
                        <th></th>
                        <th></th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>{forEach comments renderComment}</tbody>
            </table>
            
        </div>
    |]
        where
            breadcrumb = renderBreadcrumb
                [ breadcrumbLink "Comments" CommentsAction
                ]

renderComment :: Comment -> Html
renderComment comment = [hsx|
    <tr><th>
    
            <h5>{get #author comment}</h5>
            <p>{get #body comment}</p>
            <p>{get #createdAt comment |> timeAgo}</p>
    
    </th></tr>
    
|]