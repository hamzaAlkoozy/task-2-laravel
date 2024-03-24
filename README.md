## Configuration
I attached `.env.example` file, take the content and place it on `.env` file in your machine <br>
<br>you might want to change some config
<br>
E.g: `DB_USERNAME` and `DB_PASSWORD`

## Initiate Database with tables and records
###Default way:
check file `database/init_db.sql` and execute it, <br>
it will do the following:

1. create database `task_2_laravel`
2. create necessary tables
3. populate sample data
### Other way(migrations and seeders):
1. run this script `database/migrations/create_db.sql`
2. run `php artisan migrate --seed`

## Install Dependencies

run `composer install`

## Run API server

open new terminal and run `php artisan serve`, it runs by default on `localhost:8000`

## Test API
### API Testing with Postman
Collection is on root folder name <br> `Task-2-Laravel.postman_collection`

1. Open Postman.
2. Click on `File > Import...` in the top menu.
3. Select the `Task-2-Laravel.postman_collection` file.
4. After importing, you will see the collection in the `Collections` tab. You can now send requests to test the API.

The Postman collection has <b>4</b> folders

1. `Users API`
2. `Projects API`
3. `Timesheets API`
4. `Auth API` which has `register`, `login`, and `logout` endpoints

Note: Authentication is applied to ALL endpoints for these APIs
`Users API`, `Projects API`, and `Timesheets API`

### Starting steps (E.g: list users)

1. Login using one of these credentials
```json
{
    "email": "hamza@gmail.com",
    "password": 12345678
}
```

```json
{
    "email": "john@gmail.com",
    "password": 12345678
}
```   
you will see `access_token` in response, you need to copy it

2. To list users `GET /api/user`, you need to place `access_token` in `Authorization` header <br>
   E.g: `Bearer {access_token}`<br>
   E.g: `Bearer 1|kv4f83odIPzckDO8F3D0fbjw6ELUQ9r6VwVDtVzy27699929`

Note: you need to do this manually for endpoint.

### Filtering in `Read All records` endpoints

E.g: to filter `users`, place this JSON object in request body <br><br>
Note: each model, has some fields that either compared `strict` or using `LIKE`
<br>
E.g: `gender` => strict , `name` => LIKE
```json
{
    "filter": {
        "gender": "male",
        "first_name": "m"
    }
}
```



