Docs for SESSION API (Log in and Log out)
===

# Log In
**Route**: `POST /sessions/` <---- JSON in the body

* Input JSON Structure: `{"email": string, "password"}`

If Valid: `{"id": int, "email": string, "authentication_token": string}`

If Invalid: 401 header


----

# Log Out



**Response**: `{"first_name":string, "last_name":string, "email":string, "is_admin": boolean}`
