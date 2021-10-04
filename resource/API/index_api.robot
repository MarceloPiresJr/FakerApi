*** Variables ***

${URL_BASE}=  https://fakerestapi.azurewebsites.net

${URL_API}=  api/v1

&{URL_ENDPOINT}
###  API ACTIVITIES
...              activities=Activities
...              activities_id=Activities/{id}
### API AUTHORS
...              authors=Authors
...              authors_id=Authors/{id}
...              books_authors=authors/books/{idBook}
### API BOOKS
...              books=Books
...              books_id=Books/{id}
...              books_covers=books/covers/{idBook}
### API COVERPHOTOS
...              coverphotos=CoverPhotos
...              coverphotos_id=CoverPhotos/{id}
### API USERS
...              users=users
...              users_id=users{id}

