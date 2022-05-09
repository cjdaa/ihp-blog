module Web.Controller.Post where

import Web.Controller.Prelude
import Web.View.Post.Index
import Web.View.Post.New
import Web.View.Post.Edit
import Web.View.Post.Show

import qualified Text.MMark as MMark
 
instance Controller PostController where
    action PostAction = do
        post <- query @Post 
             |> orderByDesc #createdAt
             |> fetch
        render IndexView { .. }

    action NewPostAction = do
        let post = newRecord
        render NewView { .. }

    action ShowPostAction { postId } = do
        post <- fetch postId 
           >>= pure . modify #comments (orderByDesc #createdAt)
           >>= fetchRelated #comments 
        render ShowView { .. }

    action EditPostAction { postId } = do
        post <- fetch postId
        render EditView { .. }

    action UpdatePostAction { postId } = do
        post <- fetch postId
        post
            |> buildPost
            |> ifValid \case
                Left post -> render EditView { .. }
                Right post -> do
                    post <- post |> updateRecord
                    setSuccessMessage "Post updated"
                    redirectTo PostAction

    action CreatePostAction = do
        let post = newRecord @Post
        post
            |> buildPost
            |> ifValid \case
                Left post -> render NewView { .. } 
                Right post -> do
                    post <- post |> createRecord
                    setSuccessMessage "Post created"
                    redirectTo PostAction

    action DeletePostAction { postId } = do
        post <- fetch postId
        deleteRecord post
        setSuccessMessage "Post deleted"
        redirectTo PostAction


isMarkdown :: Text -> ValidatorResult
isMarkdown text =
    case MMark.parse "" text of
        Left _ -> Failure "Please provide valid Markdown"
        Right _ -> Success


buildPost post = post
    |> fill @["title","body"]
    |> validateField #title nonEmpty
    |> validateField #body isMarkdown