import sqlite3

connection = sqlite3.connect("school.db")
cursor = connection.cursor()

print("Python connected  to sql database")

query = "select count(*) from students;"
cursor.execute(query)
result= cursor.fetchone()
print(f"{result}")

query = "select name , cgpa from students  order by cgpa desc limit 3; "
cursor.execute(query)
result= cursor.fetchall()
 
for position, (name, cgpa) in enumerate(result, 1):
    print(f" {position}, {name} , CGPA:{cgpa}")
connection.close()