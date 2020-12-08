Docs for Project API
===

# GET a Project
**Route**: `GET /projects/:id`

**Response**: `{"project_name":string, "phase":string, "award_date": date," "pop":string, "customer": string,
 "contractor": string, "pm": string, "status": string, "status_comment": string, "project_num": int, "funding_source": string}`

---

# CREATE a Project

**Route:** `POST /projects/` <---- with a JSON in the body

* Input JSON Structure: `{"project_name":string, "phase":string, "award_date": date," "pop":string, "customer": string,
                         "contractor": string, "pm": string, "status": string, "status_comment": string, "project_num": int, "funding_source": string}`

**Response**: `{"id": int, "project_name":string, "phase":string, "award_date": date," "pop":string, "customer": string,
                "contractor": string, "pm": string, "status": string, "status_comment": string, "project_num": int, 
"funding_source": string}`

---

# UPDATE a Project 

**Route:** `PATCH or PUT /projects/:id` <---- with a JSON in the body

* Input JSON Structure: `{"project_name":string, "phase":string, "award_date": date," "pop":string, "customer": string,
                          "contractor": string, "pm": string, "status": string, "status_comment": string,
  "project_num": int, "funding_source": string}`

**Response:** Nothing. Just an OK error code

Note, you don't have to pass every field in the update JSON. The project will only update the fields that are given. 

# DELETE a Project
**Route**: `DELETE /projects/:id`

**Response**: `This returns nothing`

---
 