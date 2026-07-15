import sqlite3

connection = sqlite3.connect("school.db")
cursor = connection.cursor()

create_table_query = """
CREATE TABLE IF NOT EXISTS students (
    student_id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    branch TEXT NOT NULL,
    semester INTEGER,
    cgpa REAL,
    city TEXT DEFAULT 'Jaipur'
)"""
insert_query = """INSERT INTO students(student_id,name,branch,semester,cgpa,city)
VALUES(?,?,?,?,?,?)"""

student_data1 = (1,"Garvit","Ai",7,8.2,"Jaipur")

cursor.execute(create_table_query)
cursor.execute(insert_query,student_data1)
connection.commit()

print("Database connected successfully")
print("students table created successfully")
connection.close()