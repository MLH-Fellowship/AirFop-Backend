Docs for Project API
===

# GET a Project
**Route**: `GET /projects/:id`

**Response**: `{"project_name":string, "phase":string, "award_date": date," "pop":string, "customer": string,
 "contractor": string, "pm": string, "status": string, "status_comment": string}`

---

# CREATE a Project

**Route:** `POST /projects/` <---- with a JSON in the body

* Input JSON Structure: `{"project_name":string, "phase":string, "award_date": date," "pop":string, "customer": string,
                         "contractor": string, "pm": string, "status": string, "status_comment": string}`

**Response**: ``{"id": int, "project_name":string, "phase":string, "award_date": date," "pop":string, "customer": string,
                "contractor": string, "pm": string, "status": string, "status_comment": string}``

---

# UPDATE a Project 

**Route:** `PATCH or PUT /projects/:id` <---- with a JSON in the body

* Input JSON Structure: ``{"project_name":string, "phase":string, "award_date": date," "pop":string, "customer": string,
                          "contractor": string, "pm": string, "status": string, "status_comment": string}``

**Response:** Nothing. Just an OK error code

Note, you don't have to pass every field in the update JSON. The project will only update the fields that are given. 
 