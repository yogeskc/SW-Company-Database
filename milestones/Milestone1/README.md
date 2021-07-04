# Milestone 1: The Semantic-Conceptual Model 

The goal of this milestone is to create a complete technical document that will define in detail the conceptual 
design and architecture of your database system. Note that this milestone is a professional document that is read 
by technical and non-technical people and teams (i,e CEO, CTO, Project Managers, Founders, Engineers, Testers....).

## Cover Page

| Milestone/Version |    Date    |
| ----------------- | ---------- |
|       M1V1        | 03/09/2020 |

## Table of Contents

## Section I: Project Description

## Section II: Use Cases 

All the main entities and actors in the system is demonstrated for DB design.**


## Section III: Database Requirements (Business Rules)

***Note: In this section, database requirements based on the user cases from section II. They
must cover all your entities and relations that will exist in your database system.***

Business rules are database requirements that are extracted from use cases. A good business rules contains: 
(1) two or more entities, (2) one or more rules defining a relationship between such entities, 
(3) all the entities must be quantifiable, and (4) one or more optional conditions. 
Quantifiable entities are defined by the many, one or zero quantities. 

Database requirements must be enumerated and grouped by the entity that performs the action 
so later they are easy to find in the document. 

Example of database requirements extracted from our use case example given in section II: 

    1. User 
        1.1. A user shall create only one account 
        1.2. A user shall be able to rent multiple books at once before checking out
        1.3. A user shall have at least one role.

    2. Account 
        2.1. An account shall be created by only one user. 
    
    3. Role
        3.1 A role shall be linked to many users. 
    
    4. Book
        4.1 A book can be rented by multiple users

Database requirements listed in this section must cover ALL the following relationships:

1. Many-to-Many
2. One-to-One
3. Many-to-One
4. One-to-Many
5. ISA
6. Aggregation 
7. Recursive

 

## Section IV: Detailed List of Main Entities, Attributes and Keys 

***Note: In this section, students must create at least 16 strong entities, and each entity must have 
at least three or more attributes. Failure to meet those guidelines will result in your milestone being returned with
a grade reduction.***

This section describe entities and their attributes for database system, including keys and 
attributes details (data type and form). For example using our two business rules from section III.

      1. User (Strong)
          * user_id: key, numeric 
          * name: composite, alphanumeric
          * dob: multivalue, timestamp
          
      2. Book (Strong)
          * ISBM: key, alphanumeric
          * title: composite, alphanumeric
          * author: composite, alphanumeric
      
      3. Role (Strong)
          * role_id: key, numeric
          * description: alphanumeric
      
      3. Account (Weak)
          * id: key, numeric 
          * user: key, numeric 
          * role: key, numeric
          




## Section V: Entity Relationship Diagram (ERD) 

***Note: Entities from section IV is in this diagram***

Based on your database requirements from section III and the entities and attributes from section IV, create a Entity
Relationship Diagram (ERD) that will represent the conceptual high level architecture of your database system.  

***Note: hand drawing diagrams are not allowed in this section***

This ERD is done using a software tool that supports drawing diagrams. 
using [draw.io](https://www.draw.io) 



## Section VI: Testing Table 

This section is be done concurrently with section V. Create a testing table similar to the one below with all the relationships in your ERD, and test it as learned in class. 

Testing table example:

| Rule | Entity A  |  Relation |  Entity B | Cardinality  | Pass/Fail  |           Error Description               |  
|------|-----------|-----------|-----------|--------------|------------|-------------------------------------------|
|  1   |   User    |  Creates  |  Account  |    1-to-1    |    Fail    |  Users can create many accounts with different emails/usernames         | 
|  2   |   User    |  Rents    |  Book     |    M-to-N    |    Pass    |                None                       |


#


