Docs for USER API
===

# GET a User
**Route**: `GET /users/:id`

**Response**: `{"first_name":string, "last_name":string, "email":string, "is_admin": boolean}`

---

# CREATE a User

**Route:** `POST /users/` <---- with a JSON in the body

* Input JSON Structure: `{"first_name":string, "last_name":string, 
"email":string, "password:string, ""is_admin": boolean}`

**Response**: `{"id": int, "first_name":string, "last_name":string, "email":string, "is_admin": boolean}`

---

# UPDATE a User 

**Route:** `PATCH or PUT /users/:id` <---- with a JSON in the body

* Input JSON Structure: `{"first_name":string, "last_name":string, 
"email":string, "password:string, "is_admin": boolean}`

**Response:** Nothing. Just an OK error code

Note, you don't have to pass every field in the update JSON. The project will only update the fields that are given. 
 
---

# GET User by email

**Route:** `GET /user_by_email/` <----- with a JSON in the body 

* Example input JSON Structure: 

```json
{
  "email": "john@doe.gov"
}
```

**Response**: A JSON containing the user's information
