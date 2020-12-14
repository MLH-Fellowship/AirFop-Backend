Docs for Project API
===

# GET a Project
**Route**: `GET /projects/:id`

**Response**: `{"project_name":string, "phase":string, "award_date": date," "pop":string, "customer": string,
 "contractor": string, "pm": string, "status": string, "status_comment": string, "project_num": int, 
"funding_source": string, "name": string}`

---

# Search for a Project by name
**Route**: `GET /proj_by_name/:name`

**Response**: `{"id": integer, "project_name":string, "phase":string, "award_date": date," "pop":string, "customer": string,
"contractor": string, "pm": string, "status": string, "status_comment": string, "project_num": int,
"funding_source": string, "name": string}`

---

# CREATE a Project

**Route:** `POST /projects/` <---- with a JSON in the body

* Input JSON Structure: `{"project_name":string, "phase":string, "award_date": date," "pop":string, "customer": string,
                         "contractor": string, "pm": string, "status": string, "status_comment": string, "project_num": int, "funding_source": string}`

**Response**: `{"id": int, "project_name":string, "phase":string, "award_date": date," "pop":string, "customer": string,
                "contractor": string, "pm": string, "status": string, "status_comment": string, "project_num": int, 
"funding_source": string, "name": string}`

---

# UPDATE a Project 

**Route:** `PATCH or PUT /projects/:id` <---- with a JSON in the body

* Input JSON Structure: `{"project_name":string, "phase":string, "award_date": date," "pop":string, "customer": string,
                          "contractor": string, "pm": string, "status": string, "status_comment": string,
  "project_num": int, "funding_source": string, "name": string}`

**Response:** Nothing. Just an OK error code

Note, you don't have to pass every field in the update JSON. The project will only update the fields that are given. 

# DELETE a Project
**Route**: `DELETE /projects/:id`

**Response**: `This returns nothing`

---

# QUERY for a project

**Route:** `GET /query/?....` <--- Key, Value params 

* To query for a project by status or date, make sure to set "date" and "status" to something other than "null". 

This route accepts key, value params to search for projects with similar attributes. 

Examples: 


To search for all the Yellow status records that fall between two dates, the URL will be: 
`localhost:3000/query/?status=ok&Red=false&Green=false&Yellow=true&date=ok&start=11/04/2020&end=05/04/2021`

To search for all the Yellow to Red records:
`localhost:3000/query/?status=ok&Red=true&Yellow=true&date=null`

**Caution: There are some quirks to the query operation:**

1. The backend expects all values to be strings. 
1. For status colors, make sure to capitalize the color keys. 
1. The format for dates is "**day/month/year**" - not "**month/day/year**". No idea why Rails does it that way.

**Response:** A Valid Project object
