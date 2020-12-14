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

**Route:** `GET /query/` <---- with a JSON in the body

* Valid Input JSON Structure: 

```json
{
    "filter": {
        "date": {
            "start": "day/month/year",
            "end": "day/month/year"
        },
        "status": {
            "Green": "boolean",
            "Yellow": "boolean",
            "Red": "boolean"
        }
    }
}
```

* If you'd like to omit certain filter attributes, insert a "null" after the name of the attribute. For example: 


```json
{
    "filter": {
        "date": "null",
        "status": {
            "Green": "false",
            "Yellow": "true",
            "Red": "true"
        }
    }
}
```

* This will execute a search that will only look for the projects with statuses between yellow and red. If you wanted
to only search for projects between two dates, then do something like the following:

```json
{
    "filter": {
        "date": {
            "start": "11/04/2020",
            "end": "05/04/2021"
        },
        "status": "null"
    }
}
```

This will execute a search for all projects between 4/11/2020 and 4/5/2021.

**Caution: There are some quirks to the query operation:**

1. The backend expects all values to be strings. 
1. For status colors, make sure to capitalize the color keys. 
1. The format for dates is "**day/month/year**" - not "**month/day/year**". No idea why Rails does it that way.

**Response:** A Valid Project object
