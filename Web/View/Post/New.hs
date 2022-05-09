module Web.View.Post.New where
import Web.View.Prelude

data NewView = NewView { post :: Post }

instance View NewView where
    html NewView { .. } = [hsx|
        {breadcrumb}
        <h1>New Post</h1>
        {renderForm post}
    |]
        where
            breadcrumb = renderBreadcrumb
                [ breadcrumbLink "Posts" PostAction
                , breadcrumbText "New Post"
                ]

renderForm :: Post -> Html
renderForm post = formFor post [hsx|
    {(textField #title)}
    {(textareaField #body) { helpText = "You can use Markdown here"} }
    {submitButton}

|]